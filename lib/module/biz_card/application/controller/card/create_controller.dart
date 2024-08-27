import 'dart:developer';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/data/service/card/card_service.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/archived_and_deleted_cards_responce/archived_or_deleted_card/archived_or_deleted_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_detail_model/business_details.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_detail_model/personal_details.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/get_all_cards/bizcard.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/achievement/personal_achievement_request_model/personal_achievement_request_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/reminder/personal_dayes_to_reminder_model/personal_dayes_to_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/personal_details_request_model/personal_details_request_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/card_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
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

  final CardRepo cardRepo = CardService();
  RxList<Bizcard> bizcards = <Bizcard>[].obs;

  // Loading
  RxBool isLoading = false.obs;

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

  // Personal Details Controllers
  RxList<String> personalImages = <String>[].obs;
  Rx<PersonalAchievementRequestModel> personalAcheivementModel =
      PersonalAchievementRequestModel().obs;
  Rx<PersonalDetailsRequestModel> personalSocialMediaMOdel =
      PersonalDetailsRequestModel().obs;
  Rx<PersonalDayesToReminderModel> personalDatesToReminder =
      PersonalDayesToReminderModel().obs;
  final mat.TextEditingController personalNameController =
      mat.TextEditingController();
  final mat.TextEditingController personalPhoneController =
      mat.TextEditingController();
  final mat.TextEditingController personalEmailController =
      mat.TextEditingController();
  final mat.TextEditingController bloodGroupController =
      mat.TextEditingController();
  final mat.TextEditingController dOBController = mat.TextEditingController();
  final mat.TextEditingController personlAddressController =
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
        showSnackbar(context, message: 'Card created Successfully');
        context.push(Routes.bizCardNavbar);
        getAllcards(true);
        isLoading.value = false;
      },
    );
  }

  void getAllcards(bool isLoad) async {
    isLoading.value = true;
    if (!isLoad && bizcards.isNotEmpty) return;
    final data = await cardRepo.getAllCards();
    data.fold(
      (l) => isLoading.value = false,
      (r) => bizcards.value = r.bizcards ?? <Bizcard>[],
    );
    update();
    isLoading.value = false;
  }

  void cardDetail({required String cardId}) async {
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

        cardArchive.isArchived == true
            ? showSnackbar(context, message: 'Archived Successfully')
            : showSnackbar(context, message: 'Restore Successfully');
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

  void getPersonalDetails(CardDetailModel cardDetail) {
    personalEmailController.text = cardDetail.personalDetails?.email ?? '';
    personalNameController.text = cardDetail.personalDetails?.name ?? '';
    personalPhoneController.text =
        cardDetail.personalDetails?.phone?.first ?? '';
  }

  void createPersonalDetails(
      {required String bizcardId, required String personalDetailsId}) async {
    if (personalNameController.text.isEmpty) {
      Get.snackbar('Fail', 'Please Add Name');
      return;
    }
    final personalController = Get.find<PersonalDetailsController>();

    PersonalDetailsRequestModel personalDetailsRequestModel =
        PersonalDetailsRequestModel(
      personalDetailsId: personalDetailsId,
      address: personlAddressController.text,
      bizcardId: bizcardId,
      bloodGroup: bloodGroupController.text,
      dob: dOBController.text,
      email: personalEmailController.text,
      images: personalController.personalImages,
      name: personalNameController.text,
      phone: [personalPhoneController.text],
    );

    isLoading.value = true;
    final data = await cardRepo.personalDetailsAdding(
        personalDetailsRequestModel: personalDetailsRequestModel);
    data.fold(
      (l) => null,
      (r) {
        isLoading.value = false;
        Get.snackbar('Sucess', 'Successfully Added Personal Details',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: neonShade,
            duration: const Duration(milliseconds: 300));
      },
    );
  }
}
