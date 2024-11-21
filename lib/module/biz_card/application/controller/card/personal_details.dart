import 'dart:developer';

import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/data/service/card/card_service.dart';
import 'package:bizkit/module/biz_card/data/service/card/personal_details.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/achievement/personal_achievement_request_model/personal_achievement_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/achievement/personal_achievent_deletion_model/personal_achievent_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/dates_to_remember.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/personal_details_request_model/personal_details_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/reminder/personal_dayes_to_reminder_model/personal_dayes_to_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/reminder/reminder_deletion/reminder_deletion.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/social_media/personal_social_media_deletion/personal_social_media_deletion.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/social_media/personal_social_media_request_model/personal_social_media_request_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/card_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/personal_details_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class PersonalDetailsController extends GetxController {
  final PersonalDetailsRepo personalRepo = PersonalDetailsService();
  RxBool isLoading = false.obs;
  RxBool deleteLoading = false.obs;
  RxString deletingId = ''.obs;
  RxBool achievementLoading = false.obs;
  final CardRepo cardRepo = CardService();
  final PersonalDetailsRepo personalDetailsRepo = PersonalDetailsService();

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

  /// personal phone numberes
  RxList<String> personalPhoneNumbers = <String>[].obs;

  // personal Achivement Controllers
  List<ImageCard> existingAchievementImages = [];
  List<ImageCard> newAchievementimage = [];
  String achievementTitleChange = '';
  String achievementDescriptionChange = '';
  TextEditingController achievementDate = TextEditingController();
  TextEditingController achievementEvent = TextEditingController();
  TextEditingController achievementTitle = TextEditingController();
  TextEditingController achievementDescription = TextEditingController();
  RxList<ImageCard> personalAchivementImage = <ImageCard>[].obs;

  // Personal Social Media Adding controllers
  TextEditingController personalSocialMediaLebal = TextEditingController();
  TextEditingController personalSocialMediaLink = TextEditingController();

  // Dates To reminder Controller
  TextEditingController personalDatesToReminderDate = TextEditingController();
  TextEditingController personalDatesToReminderMessage =
      TextEditingController();

  void getPersonalDetails(CardDetailModel cardDetail) {
    personalEmailController.text = cardDetail.personalDetails?.email ?? '';
    personalNameController.text = cardDetail.personalDetails?.name ?? '';
    personalPhoneNumbers.value =
        cardDetail.personalDetails?.phone ?? <String>[];
    personlAddressController.text = cardDetail.personalDetails?.address ?? '';
    dOBController.text = DateTimeFormater.getDateByDayMonthYear(
        cardDetail.personalDetails?.dob ?? '');
    bloodGroupController.text = cardDetail.personalDetails?.bloodGroup ?? '';
  }

  /// add phone number to personal data
  void addPeresonalPhoneNumber(BuildContext context, String phone) {
    if (personalPhoneNumbers.contains(phone)) {
      showSnackbar(context, message: 'Phone number alredy exist');
    } else {
      personalPhoneNumbers.add(phone);
      personalPhoneController.text = '';
    }
    update(['personalPhoneNumber']);
  }

  /// remove phoneNumber from personal data
  void deletePersonalPhoneNumber(int index) {
    personalPhoneNumbers.removeAt(index);
    update(['personalPhoneNumber']);
  }

  void personalImagesAdding(bool isCam) async {
    final image = await ImagePickerClass.getImage(camera: isCam);
    if (image != null) {
      personalImages.add(image.base64!);
      update();
    }
  }

  void removePersonalImages(int index) {
    personalImages.removeAt(index);
    update();
  }

  void createPersonalDetails(
      {required String bizcardId,
      required String personalDetailsId,
      required BuildContext context}) async {
    if (personalNameController.text.isEmpty) {
      showSnackbar(context, message: 'Please Add Name');
      return;
    }
    isLoading.value = true;
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
      phone: personalPhoneNumbers,
    );

    final data = await personalDetailsRepo.personalDetailsAdding(
        personalDetailsRequestModel: personalDetailsRequestModel);
    data.fold(
      (l) {
        isLoading.value = false;
        if (l.data == 304) {
          showSnackbar(context,
              message: 'Successfully Updated Personal Details');
          GoRouter.of(context).pop();
        }
      },
      (r) {
        showSnackbar(context, message: 'Successfully Added Personal Details');
        GoRouter.of(context).pop();
      },
    );
    isLoading.value = false;
  }

  void acheievementAdding(List<String> images, BuildContext context) async {
    achievementLoading.value = true;
    final cardController = Get.find<CardController>();
    PersonalAchievementRequestModel personalAchiment =
        PersonalAchievementRequestModel(
      bizcardId: cardController.bizcardDetail.value.bizcardId,
      date: achievementDate.text == '' ? null : achievementDate.text,
      description: achievementDescription.text,
      event: achievementEvent.text,
      images: images,
      personalDetailsId: cardController.bizcardDetail.value.personalDetails?.id,
      title: achievementTitle.text,
    );
    print(personalAchiment.bizcardId);
    print(personalAchiment.personalAchievementId);
    print(personalAchiment.images?.first);
    final data = await personalRepo.personalAchivmentAdding(
        personalAchiment: personalAchiment);
    data.fold(
        (l) => showSnackbar(context,
            message: 'Failed to add achivement, please try again',
            backgroundColor: kred), (r) {
      achievementDescription.clear();
      achievementEvent.clear();
      achievementDate.clear();
      achievementTitle.clear();

      cardController.cardDetail(
          cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      showSnackbar(context, message: 'Achievement Added Successfully');
      GoRouter.of(context).pop();
    });
    achievementLoading.value = false;
  }

  void achivementDataClear() {
    achievementDescription.clear();
    achievementEvent.clear();
    achievementDate.clear();
    achievementTitle.clear();
    newAchievementimage.clear();
    existingAchievementImages.clear();
  }

  void acheievementUpdate(
      List<String> images, BuildContext context, String achievementId) async {
    final cardController = Get.find<CardController>();
    PersonalAchievementRequestModel personalAchiment =
        PersonalAchievementRequestModel(
            images: images,
            bizcardId: cardController.bizcardDetail.value.bizcardId,
            date: achievementDate.text,
            description: achievementDescription.text,
            event: achievementEvent.text,
            personalAchievementId: achievementId,
            title: achievementTitle.text,
            personalDetailsId:
                cardController.bizcardDetail.value.personalDetails?.id);
    achievementLoading.value = true;
    final data = await personalRepo.personalAchivmentEditing(
        personalAchiment: personalAchiment);
    data.fold(
      (l) => showSnackbar(context,
          message: 'Failed to update achivement, please try again',
          backgroundColor: kred),
      (r) {
        final cardController = Get.find<CardController>();

        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
    achievementLoading.value = false;
  }

  void personalAcheievementDeleting(
      {required PersonalAchieventDeletionModel personalAchievementDeletion,
      bool fromInner = true,
      required BuildContext context}) async {
    deleteLoading.value = true;
    deletingId.value = personalAchievementDeletion.personalAchievementId ?? '';
    final data = await personalRepo.personalAchivmentDeleting(
        personalAchimentDeletion: personalAchievementDeletion);
    data.fold(
      (l) => null,
      (r) {
        final cardController = Get.find<CardController>();
        List<Achievement> achievement = cardController
                .bizcardDetail.value.personalDetails?.personalAchievements ??
            [];
        achievement.removeWhere((element) =>
            element.id == personalAchievementDeletion.personalAchievementId);
        // set achivemets without the deleted one
        cardController.bizcardDetail.value = cardController.bizcardDetail.value
            .copyWith(
                personalDetails: cardController
                    .bizcardDetail.value.personalDetails
                    ?.copyWith(personalAchievements: achievement));
        if (fromInner) {
          GoRouter.of(context).pop();
        }
        showSnackbar(context, message: 'Acheievement Deleted Successfully');
      },
    );
    deleteLoading.value = false;
    deletingId.value = '';
  }

  void personalSocialMediaAdding(
      {required PersonalSocialMediaRequestModel personalSocialMediaModel,
      required BuildContext context}) async {
    isLoading.value = true;
    final data = await personalRepo.personalSocialMediaAdding(
        personalSocialMediaModel: personalSocialMediaModel);
    data.fold(
      (l) => null,
      (r) {
        final cardController = Get.find<CardController>();

        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Social Media Added Successfully');
      },
    );
    isLoading.value = false;
  }

  void personalSocialMediaUpdate(
      {required PersonalSocialMediaRequestModel personalSocialMediaModel,
      required BuildContext context}) async {
    isLoading.value = true;
    final data = await personalRepo.personalSocialMediaEditing(
        personalSocialMediaModel: personalSocialMediaModel);
    data.fold(
      (l) => null,
      (r) {
        final cardController = Get.find<CardController>();
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Social Media Updated Successfully');
      },
    );
    isLoading.value = false;
  }

  void personalSocialMediaDelete(int socialMediaIndex,
      {required BuildContext context, bool fromIner = true}) async {
    deleteLoading.value = true;
    final cardController = Get.find<CardController>();
    PersonalSocialMediaDeletion personalSocialMediaDeletion =
        PersonalSocialMediaDeletion(
            personalDetailsId:
                cardController.bizcardDetail.value.personalDetails?.id,
            socialMediaId: cardController.bizcardDetail.value.personalDetails
                ?.personalSocialMedia?[socialMediaIndex].id);
    final data = await personalRepo.personalSocialMediaDeleting(
        personalSocialMediaDeletion: personalSocialMediaDeletion);
    data.fold(
      (l) => null,
      (r) {
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        if (fromIner) GoRouter.of(context).pop();
        showSnackbar(context, message: 'Social Media Deleted Successfully');
      },
    );
    deleteLoading.value = false;
  }

  void personalDatesToRemiderAdding(
      {required BuildContext context, bool fromIner = true}) async {
    isLoading.value = true;
    final cardController = Get.find<CardController>();
    PersonalDayesToReminderModel personalDatesToReminderModel =
        PersonalDayesToReminderModel(
            bizcardId: cardController.bizcardDetail.value.bizcardId,
            date: personalDatesToReminderDate.text,
            description: personalDatesToReminderMessage.text,
            personalDetailsId:
                cardController.bizcardDetail.value.personalDetails?.id);
    log('dates to remember -> ${personalDatesToReminderModel.toJson()}');
    final data = await personalRepo.personalDatesToReminderAdding(
        personalDatesToReminderModel: personalDatesToReminderModel);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        personalDatesToReminderDate.clear();
        personalDatesToReminderMessage.clear();
        var personalDetails = cardController.bizcardDetail.value.personalDetails
            ?.copyWith(datesToRemember: [
          DatesToRemember(
              id: r.dateId,
              date: personalDatesToReminderModel.date,
              description: personalDatesToReminderModel.description),
          ...cardController
                  .bizcardDetail.value.personalDetails?.datesToRemember ??
              [],
        ]);
        cardController.bizcardDetail.value = cardController.bizcardDetail.value
            .copyWith(personalDetails: personalDetails);
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Dates To Remider Added Successfully');
      },
    );
    isLoading.value = false;
  }

  void personalDaatesToReminderUpdate(
      {required PersonalDayesToReminderModel personalDatesToReminderModel,
      required BuildContext context}) async {
    isLoading.value = true;
    final data = await personalRepo.personalDatesToReminderEditing(
        personalDatesToReminderModel: personalDatesToReminderModel);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        final cardController = Get.find<CardController>();
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Dates To Remider Updated Successfully');
      },
    );
  }

  void personalDatesToReminderDelete(int datesToReminderIndex,
      {bool fromInner = true, required BuildContext context}) async {
    deleteLoading.value = true;
    final cardController = Get.find<CardController>();
    ReminderDeletion remiderDeletion = ReminderDeletion(
        dateId: cardController.bizcardDetail.value.personalDetails
            ?.datesToRemember?[datesToReminderIndex].id,
        personalDetailsId:
            cardController.bizcardDetail.value.personalDetails?.id);
    List<DatesToRemember> list =
        cardController.bizcardDetail.value.personalDetails?.datesToRemember ??
            [];
    list.removeAt(datesToReminderIndex);
    var personalDetails = cardController.bizcardDetail.value.personalDetails
        ?.copyWith(datesToRemember: list);
    cardController.bizcardDetail.value = cardController.bizcardDetail.value
        .copyWith(personalDetails: personalDetails);
    final data = await personalRepo.personalDatesToReminderDeleting(
        remiderDeletion: remiderDeletion);
    data.fold(
      (l) => deleteLoading.value = false,
      (r) {
        if (fromInner) GoRouter.of(context).pop();
        deleteLoading.value = false;
        // showSnackbar(context, message: 'Dates To Remider Deleted Successfully');
      },
    );
  }
}
