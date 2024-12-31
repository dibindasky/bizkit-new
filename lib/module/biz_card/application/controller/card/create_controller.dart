import 'dart:async';
import 'dart:developer';

import 'package:bizkit/core/model/bizcard_id_parameter_model/bizcard_id_parameter_model.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/controller/reminder/reminder_controller.dart';
import 'package:bizkit/module/biz_card/data/service/card/card_service.dart';
import 'package:bizkit/module/biz_card/data/sqflite/bizcards/bizcards_local_service.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/archived_and_deleted_cards_responce/archived_or_deleted_card/archived_or_deleted_card.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_all_cards/bizcard.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_card_views_responce/view.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/card_repo.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/profile_controller/profile_controller.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/debouncer/debouncer.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardController extends GetxController {
  final BizcardsLocalService bizcardsLocalService = BizcardsLocalService();
  @override
  void onInit() {
    super.onInit();
    getAllcards(true);
  }

  String toUserId = '';
  // Loading
  RxBool isLoading = false.obs;
  RxBool loadingForCardViews = false.obs;

  bool isLocalDataLoaded = false; // Flag to track if local data has been loaded

  /// scanned card is my card or not
  RxBool myCardDeeplinkPage = false.obs;

  /// connection alredy exist with scanned card or not
  RxBool connectionExist = false.obs;

  /// show machometer common screeen
  RxBool showMachoMeterScreen = false.obs;

  final CardRepo cardRepo = CardService();

  RxList<Views> cardViews = <Views>[].obs;
  RxList<Bizcard> bizcards = <Bizcard>[].obs;

  RxString bizcardId = ''.obs;
  RxString defaultBizcardId = ''.obs;

  final reminderController = Get.find<ReminderController>();

  Rx<CardDetailModel> bizcardDetail = CardDetailModel().obs;

  RxList<ArchivedOrDeletedCard> archivedCards = <ArchivedOrDeletedCard>[].obs;
  RxList<ArchivedOrDeletedCard> deletedCards = <ArchivedOrDeletedCard>[].obs;

  // Card Profile Creation Text Controllers
  final mat.TextEditingController nameController = mat.TextEditingController();
  final mat.TextEditingController phoneController = mat.TextEditingController();
  final mat.TextEditingController emailController = mat.TextEditingController();
  final mat.TextEditingController companyNameController =
      mat.TextEditingController();
  final mat.TextEditingController designationController =
      mat.TextEditingController();
  final mat.TextEditingController businessCategeryController =
      mat.TextEditingController();

  /// loading for bizcard preview while card creation
  RxBool updateCArdPreviewCardCreationNameLoading = false.obs;
  RxBool updateCArdPreviewCardCreationEmailLoading = false.obs;
  RxBool updateCArdPreviewCardCreationPhoneLoading = false.obs;
  RxBool updateCArdPreviewCardCreationDesignationLoading = false.obs;

  final Debouncer debouncer = Debouncer(milliseconds: 300);

  /// variable to stop auto sliding cards while showing qr
  RxBool autoScrollCard = false.obs;

  /// update the ui of card dummy for creation page
  void updateCardPreviewCardCreation(RxBool loader) {
    loader.value = true;
    debouncer.run(
      () {
        loader.value = false;
      },
    );
  }

  void createCard(BuildContext context) async {
    isLoading.value = true;
    final CreateCard createCard = CreateCard(
        email: emailController.text,
        businessCategory: businessCategeryController.text,
        companyName: companyNameController.text,
        designation: designationController.text,
        name: nameController.text,
        phone: [phoneController.text]);
    final data = await cardRepo.createCard(createCard: createCard);
    data.fold(
      (l) {
        isLoading.value = false;
        showSnackbar(context, message: errorMessage);
      },
      (r) {
        showSnackbar(context, message: 'Card Created Successfully');
        // context.push(Routes.bizCardNavbar);
        Get.find<ModuleController>().chooseModule(context, module: Module.card);
        getAllcards(true);
        isLoading.value = false;
      },
    );
    isLoading.value = false;
  }

  void getAllcards(bool isLoad) async {
    final profileController=Get.find<ProfileController>(); 
    if (!isLoad && bizcards.isNotEmpty) return;
    isLoading.value = true;
    bizcards.value = <Bizcard>[];

  if(profileController.saveLocalData.isTrue){
      // Step 1: Fetch and display local data first
    await fetchBizcardsFromLocalDb();
  }
  

    // Step 2: Then update with any network data if available
    if (!isLocalDataLoaded) {
      await fetchBizcardsFromNetWork();
    }
     isLoading.value = false;
  }

  Future<void> fetchBizcardsFromNetWork() async {
    final profileController = Get.find<ProfileController>();
    final data = await cardRepo.getAllCards();
    data.fold(
      (l) {
        isLoading.value = false;
        update();
      },
      (r) async {
        bizcards.assignAll(r.bizcards ?? <Bizcard>[]);
        if (bizcards.isNotEmpty) {
          bizcardId.value = r.bizcards?.first.bizcardId ?? '';
          log('Defalt Bizcard Id === > ${bizcardId.value}');

          // Store new bizcards in local database
          for (Bizcard bizcard in r.bizcards ?? <Bizcard>[]) {
            if(profileController.saveLocalData.isTrue){
                await bizcardsLocalService.addBizcardToLocalIfNotExists(
                bizcardModel: bizcard);
            }
          
            if (bizcard.isDefault ?? false) {
              defaultBizcardId.value = bizcard.bizcardId ?? '';
            }
          }
        }
        isLoading.value = false;
        update();
      },
    );
  }

  Future<void> fetchBizcardsFromLocalDb() async {
    isLoading.value = true;
    final localData =
        await bizcardsLocalService.getBizcardsFromLocalLocalStorage();
    localData.fold(
      (failure) {
        log('getBizcardsFromLocalLocalStorage error: ${failure.message}');
      },
      (success) {
        if (success.isNotEmpty) {
          bizcards.assignAll(success);
          defaultBizcardId.value =
              bizcards.firstWhere((e) => e.isDefault ?? false).bizcardId ?? '';
          // Mark local data as loaded
          isLocalDataLoaded = true;
          isLoading.value = false;
        }
      },
    );
  }

  void cardDetail(
      {required String cardId,
      bool refresh = false,
      bool toEdit = false}) async {
        final profileController = Get.find<ProfileController>();
    log('Bizcard ID -> $cardId');
    if (cardId != bizcardDetail.value.bizcardId) {
      bizcardDetail.value = CardDetailModel();
    }
    if (refresh || cardId != (bizcardDetail.value.bizcardId ?? "")) {
      isLoading.value = true;
    }

    if (profileController.saveLocalData.isTrue){
        await fetchBizcardDetailsFromLocalDb(cardId);
    }
    // Step 1: Fetch and display local data first
  

    // Step 2: Then update with any network data if available
    await fetchBizcardDetailFromNetWork(cardId, toEdit);
  }

  Future<void> fetchBizcardDetailFromNetWork(String cardId, bool toEdit) async {
    final profileController = Get.find<ProfileController>();
    final data = await cardRepo.getCardDetail(cardId: cardId);
    data.fold(
      (l) => isLoading.value = false,
      (r) async {
        bizcardDetail.value = r;
        if (profileController.saveLocalData.isTrue) {
          await bizcardsLocalService.addBizcardFullDetailToLocalIfNotExists(
              bizcardModel: r);
        }

        if (toEdit) {
          Get.find<PersonalDetailsController>().getPersonalDetails(r);
          Get.find<BusinesDetailsController>().getBusinessDetails(r);
        }
        isLoading.value = false;
        update();
        update(['logo_story']);
      },
    );
  }

  Future<void> fetchBizcardDetailsFromLocalDb(String cardId) async {
    isLoading.value = true;
    final localData = await bizcardsLocalService
        .getBizcardFullDetailsFromLocalLocalStorage(bizcardId: cardId);
    localData.fold(
      (failure) {
        log('getBizcardFullDetailsFromLocalLocalStorage error: ${failure.message}');
      },
      (success) {
        if (success != null) {
          bizcardDetail.value = success;
          isLoading.value = false;
        }
      },
    );
  }

  /// Set card as default
  void setDefaultCard(
      {required String cardId, required BuildContext context}) async {
    log('cardId ==> $cardId');
    isLoading.value = true;
    final data = await cardRepo.setDefaultCard(cardId: cardId);
    data.fold(
      (l) {
        isLoading.value = false;
        showSnackbar(context, message: errorMessage);
      },
      (r) {
        getAllcards(true);
        showSnackbar(context, message: 'This card set as default');
        isLoading.value = false;
      },
    );
  }

  // Archive a card - [ same function for RESTORE the archived card ]
  void archiveACard(
      {required CardArchiveModel cardArchive,
      required BuildContext context}) async {
    isLoading.value = true;

    final data = await cardRepo.archiveTheCard(cardArchive: cardArchive);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        getAllcards(true);
        fetchDeletedAndArchivedCards();
        showSnackbar(context,
            message: cardArchive.isArchived == true
                ? 'Archived Successfully'
                : 'Restore Successfully');
        isLoading.value = false;
      },
    );
  }

  // Delete a card - [ same function for RESTORE the deleted card ]
  void deleteACard(
      {required CardDeleteModel cardDelete,
      required BuildContext context}) async {
    isLoading.value = true;
    final data = await cardRepo.deleteTheCard(cardDelete: cardDelete);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        getAllcards(true);
        fetchDeletedAndArchivedCards();
        cardDelete.isDisabled == true
            ? showSnackbar(context, message: 'Deleted Successfully')
            : showSnackbar(context, message: 'Restore Successfully');
        isLoading.value = false;
      },
    );
  }

  // fetch all deleted and archived cards
  void fetchDeletedAndArchivedCards() async {
    isLoading.value = true;
    final data = await cardRepo.getAllArchivedAndDeletedCards();
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        archivedCards.assignAll(r.archivedCards ?? []);
        deletedCards.assignAll(r.disabledCards ?? []);
        update();
        isLoading.value = false;
      },
    );
  }

  // fetch card views
  void fetchCardViews(
      {required BizcardIdParameterModel bizcardIdParameterModel}) async {
    loadingForCardViews.value = true;
    final data = await cardRepo.getCardViews(
        bizcardIdParameterModel: bizcardIdParameterModel);
    data.fold(
      (l) => loadingForCardViews.value = false,
      (r) {
        cardViews.assignAll(r.views ?? []);
        loadingForCardViews.value = false;
      },
    );
  }

  /// update the number of shares
  void updateShareCount({required String cardId}) async {
    log('cardId ==> $cardId');
    final data = await cardRepo.updateShareCount(
        bizcardIdParameterModel: BizcardIdParameterModel(bizcardId: cardId));
    data.fold(
      (l) => null,
      (r) {
        int? index = bizcards.indexWhere((e) => e.bizcardId == cardId);
        if (index != null && index != -1) {
          bizcards[index] = bizcards[index]
              .copyWith(shareCount: (bizcards[index].shareCount ?? 0) + 1);
        }
      },
    );
  }

  /// scan qr or come to the app through link
  /// then need to call this api to create connection if there is no connection
  void scanAndConnect({required String cardId}) async {
    myCardDeeplinkPage.value = false;
    isLoading.value = true;
    bizcardDetail.value = CardDetailModel();
    final data = await cardRepo.scanAndConnect(cardId: cardId);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        bizcardDetail.value = r.sharedDetails!;
        myCardDeeplinkPage.value = r.newConnection == null;
        connectionExist.value = r.newConnection ?? false;
        update();
        isLoading.value = false;
        reminderController.getCardRemiderHistory(
            id: bizcardDetail.value.bizcardId ?? '', card: true);
      },
    );
  }

  /// pop up for adding connection details
  void showConnectionDetailPopUp(BuildContext context) async {
    connectionExist.value = false;
    await Future.delayed(const Duration(seconds: 3)).then(
      (_) =>
          //  connectionExist.value? GoRouter.of(context).pushNamed(Routes.matchoMeterConnectionScreen):
          showConfirmationDialog(
        context,
        heading: 'Add a Selfie Together or Details About This Connection.',
        actionButton: 'Add Details',
        onPressed: () => GoRouter.of(context).pushNamed(
          Routes.connectionDetailFilling,
          extra: bizcardDetail.value,
        ),
      ),
    );
  }

  changeAutoScroll(bool value) {
    autoScrollCard.value = value;
  }
}
