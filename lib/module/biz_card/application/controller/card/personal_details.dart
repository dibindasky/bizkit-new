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
  RxList<String> personalImages = <String>[].obs;
  final cardController = Get.find<CardController>();

  // personaal Achivement Controllers
  RxList<ImageCard>? achievementImages = <ImageCard>[].obs;
  TextEditingController personalAchievementDate = TextEditingController();
  TextEditingController personalAchievementEvent = TextEditingController();
  TextEditingController personalAchievementTitle = TextEditingController();
  TextEditingController personalAchievementDescription =
      TextEditingController();

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

  void acheievementAdding() async {
    isLoading.value = true;
    PersonalAchievementRequestModel personalAchiment =
        PersonalAchievementRequestModel(
      bizcardId: cardController.bizcardDetail.value.bizcardId,
      date: personalAchievementDate.text,
      description: personalAchievementDescription.text,
      event: personalAchievementEvent.text,
      images: achievementImages
          ?.map((achievementImage) => achievementImage.image!)
          .toList(),
      personalDetailsId: cardController.bizcardDetail.value.personalDetails?.id,
      title: personalAchievementTitle.text,
    );
    final data = await personalRepo.personalAchivmentAdding(
        personalAchiment: personalAchiment);
    data.fold((l) => null, (r) {
      isLoading.value = false;
      cardController.cardDetail(
          cardId: cardController.bizcardDetail.value.bizcardId ?? '');
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
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void acheievementRemoving(
      {required PersonalAchieventDeletionModel
          personalAchievementDeletion}) async {
    isLoading.value = true;
    final data = await personalRepo.personalAchivmentDeleting(
        personalAchimentDeletion: personalAchievementDeletion);
    data.fold(
      (l) => null,
      (r) {
        isLoading.value = false;
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
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalSocialMediaDelete(
      {required PersonalSocialMediaDeletion
          personalSocialMediaDeletion}) async {
    isLoading.value = true;
    final data = await personalRepo.personalSocialMediaDeleting(
        personalSocialMediaDeletion: personalSocialMediaDeletion);
    data.fold(
      (l) => null,
      (r) {
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalDatesToRemiderAdding() async {
    isLoading.value = true;
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
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void personalDatesToReminderDelete(
      {required ReminderDeletion remiderDeletion}) async {
    isLoading.value = true;
    final data = await personalRepo.personalDatesToReminderDeleting(
        remiderDeletion: remiderDeletion);
    data.fold(
      (l) => null,
      (r) {
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }
}
