import 'dart:math';

import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/data/service/card/personal_details.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/achievement/personal_achievement_request_model/personal_achievement_request_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/achievement/personal_achievent_deletion_model/personal_achievent_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/image_card/image_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/reminder/personal_dayes_to_reminder_model/personal_dayes_to_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/reminder/reminder_deletion/reminder_deletion.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/social_media/personal_social_media_deletion/personal_social_media_deletion.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/social_media/personal_social_media_request_model/personal_social_media_request_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/personal_details_repo.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetailsController extends GetxController {
  final PersonalDetailsRepo personalRepo = PersonalDetailsService();
  RxBool isLoading = false.obs;
  RxBool deleteLoading = false.obs;
  RxList<String> personalImages = <String>[].obs;

  // personaal Achivement Controllers
  RxList<ImageCard>? achievementImages = <ImageCard>[].obs;
  TextEditingController personalAchievementDate = TextEditingController();
  TextEditingController personalAchievementEvent = TextEditingController();
  TextEditingController personalAchievementTitle = TextEditingController();
  TextEditingController personalAchievementDescription =
      TextEditingController();
  RxList<ImageCard> personalAchivementImage = <ImageCard>[].obs;

  // Personal Social Media Adding controllers
  TextEditingController personalSocialMediaLebal = TextEditingController();
  TextEditingController personalSocialMediaLink = TextEditingController();

  // Dates To reminder Controller
  TextEditingController personalDatesToReminderDate = TextEditingController();
  TextEditingController personalDatesToReminderMessage =
      TextEditingController();

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

  void acheievementAdding(List<String> images, BuildContext context) async {
    isLoading.value = true;
    final cardController = Get.find<CardController>();
    PersonalAchievementRequestModel personalAchiment =
        PersonalAchievementRequestModel(
      bizcardId: cardController.bizcardDetail.value.bizcardId,
      date: personalAchievementDate.text,
      description: personalAchievementDescription.text,
      event: personalAchievementEvent.text,
      images: images,
      personalDetailsId: cardController.bizcardDetail.value.personalDetails?.id,
      title: personalAchievementTitle.text,
    );
    final data = await personalRepo.personalAchivmentAdding(
        personalAchiment: personalAchiment);
    data.fold((l) => null, (r) {
      personalAchievementDescription.clear();
      personalAchievementEvent.clear();
      personalAchievementDate.clear();
      personalAchievementTitle.clear();
      isLoading.value = false;
      cardController.cardDetail(
          cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      Navigator.pop(context);
    });
  }

  void acheievementUpdate(
      {required PersonalAchievementRequestModel personalAchiment}) async {
    isLoading.value = true;
    final data = await personalRepo.personalAchivmentEditing(
        personalAchiment: personalAchiment);
    data.fold(
      (l) => null,
      (r) {
        final cardController = Get.find<CardController>();
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalAcheievementDeleting(
      {required PersonalAchieventDeletionModel
          personalAchievementDeletion}) async {
    deleteLoading.value = true;
    final data = await personalRepo.personalAchivmentDeleting(
        personalAchimentDeletion: personalAchievementDeletion);
    data.fold(
      (l) => null,
      (r) {
        final cardController = Get.find<CardController>();
        deleteLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalSocialMediaAdding(
      {required PersonalSocialMediaRequestModel
          personalSocialMediaModel}) async {
    isLoading.value = true;
    final data = await personalRepo.personalSocialMediaAdding(
        personalSocialMediaModel: personalSocialMediaModel);
    data.fold(
      (l) => null,
      (r) {
        final cardController = Get.find<CardController>();
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalSocialMediaUpdate(
      {required PersonalSocialMediaRequestModel
          personalSocialMediaModel}) async {
    isLoading.value = true;
    final data = await personalRepo.personalSocialMediaEditing(
        personalSocialMediaModel: personalSocialMediaModel);
    data.fold(
      (l) => null,
      (r) {
        final cardController = Get.find<CardController>();
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalSocialMediaDelete(int socialMediaIndex) async {
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
        deleteLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalDatesToRemiderAdding() async {
    isLoading.value = true;
    final cardController = Get.find<CardController>();
    PersonalDayesToReminderModel personalDatesToReminderModel =
        PersonalDayesToReminderModel(
            bizcardId: cardController.bizcardDetail.value.bizcardId,
            date: personalDatesToReminderDate.text,
            description: personalDatesToReminderMessage.text,
            personalDetailsId:
                cardController.bizcardDetail.value.personalDetails?.id);
    final data = await personalRepo.personalDatesToReminderAdding(
        personalDatesToReminderModel: personalDatesToReminderModel);
    data.fold(
      (l) => null,
      (r) {
        personalDatesToReminderDate.clear();
        personalDatesToReminderMessage.clear();
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalDaatesToReminderUpdate(
      {required PersonalDayesToReminderModel
          personalDatesToReminderModel}) async {
    isLoading.value = true;
    final data = await personalRepo.personalDatesToReminderEditing(
        personalDatesToReminderModel: personalDatesToReminderModel);
    data.fold(
      (l) => null,
      (r) {
        final cardController = Get.find<CardController>();
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalDatesToReminderDelete(int datesToReminderIndex) async {
    deleteLoading.value = true;
    final cardController = Get.find<CardController>();
    ReminderDeletion remiderDeletion = ReminderDeletion(
        dateId: cardController.bizcardDetail.value.personalDetails
            ?.datesToRemember?[datesToReminderIndex].id,
        personalDetailsId:
            cardController.bizcardDetail.value.personalDetails?.id);
    final data = await personalRepo.personalDatesToReminderDeleting(
        remiderDeletion: remiderDeletion);
    data.fold(
      (l) => null,
      (r) {
        deleteLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }
}
