import 'dart:developer';

import 'package:bizkit/core/model/bizcard_id_parameter_model/bizcard_id_parameter_model.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/data/service/card/card_service.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/archived_and_deleted_cards_responce/archived_or_deleted_card/archived_or_deleted_card.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/business_details.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/personal_details.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_all_cards/bizcard.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_card_views_responce/view.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/card_repo.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllcards(true);
  }

  // Loading
  RxBool isLoading = false.obs;
  RxBool loadingForCardViews = false.obs;

  /// scanned card is my card or not
  RxBool myCardDeeplinkPage = false.obs;

  /// connection alredy exist with scanned card or not
  RxBool connectionExist = false.obs;

  final CardRepo cardRepo = CardService();

  RxList<Views> cardViews = <Views>[].obs;
  RxList<Bizcard> bizcards = <Bizcard>[].obs;

  RxString bizcardId = ''.obs;

  Rx<CardDetailModel> bizcardDetail = CardDetailModel().obs;
  Rx<PersonalDetails?> personalDetails = PersonalDetails().obs;
  Rx<BusinessDetails?> businessDetails = BusinessDetails().obs;

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
    isLoading.value = true;
    if (!isLoad && bizcards.isNotEmpty) return;
    final data = await cardRepo.getAllCards();
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        bizcards.value = r.bizcards ?? <Bizcard>[];
        if (bizcards.isNotEmpty) {
          bizcardId.value = r.bizcards?.first.bizcardId ?? '';
          log('defalt Bizcard Id === > ${bizcardId.value}');
        }
        isLoading.value = false;
      },
    );
    isLoading.value = false;
    update();
  }

  void cardDetail({required String cardId}) async {
    log('Bizcard ID -> $cardId');
    bizcardDetail.value = CardDetailModel();
    isLoading.value = true;
    final data = await cardRepo.getCardDetail(cardId: cardId);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        bizcardDetail.value = r;
        personalDetails.value = r.personalDetails;
        businessDetails.value = r.businessDetails;
        isLoading.value = false;
        update();
      },
    );
  }

  // // Set card as default
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
        personalDetails.value = r.sharedDetails!.personalDetails;
        businessDetails.value = r.sharedDetails!.businessDetails;
        myCardDeeplinkPage.value = r.newConnection == null;
        connectionExist.value = r.newConnection ?? false;
        print('bizcardDetail.value -> ${bizcardDetail.value.connectionId}');
        update();
        isLoading.value = false;
        print('connection is scan and cpnncet -> ${r.connectionId}');
      },
    );
  }

  /// pop up for adding connection details
  void showConnectionDetailPopUp(BuildContext context) async {
    connectionExist.value = false;
    await Future.delayed(const Duration(seconds: 3)).then((_) =>
        showConfirmationDialog(context,
            heading: 'Add Selfie And Details About This Connection..',
            actionButton: 'Add Details',
            onPressed: () => GoRouter.of(context).pushNamed(
                Routes.connectionDetailFilling,
                extra: bizcardDetail.value)));
  }
}
