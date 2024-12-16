import 'dart:developer';

import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/data/service/text_extraction/text_extraction_service.dart';
import 'package:bizkit/module/biz_card/domain/model/text_extraction/text_extraction_model/text_extraction_model.dart';
import 'package:bizkit/module/biz_card/domain/model/text_extraction/text_extraction_responce/extracted_details.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/text_extraction/text_extraction_repo.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardTextExtractionController extends GetxController {
  final TextExtractionRepo textExtractionService = TextExtractionService();

  RxBool isLoading = false.obs;
  RxBool continueLoading = false.obs;

  // Holds extractedDetails response
  var extractedDetails = ExtractedDetails().obs;

  RxList<ImageModel> pickedImageUrl = <ImageModel>[].obs;
  RxList<String> pickedSelfiesImageUrl = <String>[].obs;

  RxList<String> extractedPhoneNumbers = <String>[].obs;
  RxList<String> extractedEmails = <String>[].obs;
  RxList<String> extractedLocations = <String>[].obs;
  RxList<String> extractedNames = <String>[].obs;
  RxList<String> extractedCompany = <String>[].obs;
  RxList<String> extractedDesignation = <String>[].obs;

  void textExtraction(
      {required TextExtractionModel textExtractionModel,
      required BuildContext context,
      required bool fromVisitingCard}) async {
    continueLoading.value = true;
    isLoading.value = true;

    final data = await textExtractionService.textExtracion(
        textExtractionModel: textExtractionModel);

    data.fold(
      (failure) {
        continueLoading.value = false;
        isLoading.value = false;
        log('${failure.message}');
        showSnackbar(context,
            message: 'failed to decode text from given image');
      },
      (success) {
        try {
          continueLoading.value = false;
          extractedDetails.value = success.extractedDetails!;
          extractedEmails.assignAll((extractedDetails.value.emails ?? []));
          extractedPhoneNumbers.assignAll((extractedDetails.value.phoneNumbers
                  ?.map((e) => e.removeAllWhitespace
                      .replaceAll('+91', '')
                      .substring(0, 10))
                  .toList() ??
              []));
          extractedLocations.assignAll((extractedDetails.value.location ?? []));
          extractedNames
              .assignAll((success.extractedDetails?.unIdentifiedText ?? []));
          extractedCompany
              .assignAll((success.extractedDetails?.unIdentifiedText ?? []));
          extractedDesignation
              .assignAll((success.extractedDetails?.unIdentifiedText ?? []));
          final cardController = Get.find<CardController>();
          cardController.nameController.text =
              extractedDetails.value.personName ?? '';
          cardController.phoneController.text =
              (extractedPhoneNumbers.isNotEmpty)
                  ? extractedPhoneNumbers.first
                  : '';
          cardController.emailController.text =
              (extractedDetails.value.emails?.isNotEmpty ?? false)
                  ? extractedDetails.value.emails!.first
                  : '';
          cardController.designationController.text =
              extractedDetails.value.designation ?? '';
          cardController.companyNameController.text =
              extractedDetails.value.companyName ?? '';
          final receivedCardController = Get.find<ReceivedCardController>();
          receivedCardController.nameController.text =
              extractedDetails.value.personName ?? '';
          receivedCardController.phoneController.text =
              (extractedPhoneNumbers.isNotEmpty)
                  ? extractedPhoneNumbers.first
                  : '';
          receivedCardController.emailController.text =
              (extractedDetails.value.emails?.isNotEmpty ?? false)
                  ? extractedDetails.value.emails!.first
                  : '';
          receivedCardController.designationController.text =
              extractedDetails.value.designation ?? '';
          receivedCardController.companyNameController.text =
              extractedDetails.value.companyName ?? '';
          receivedCardController.websiteController.text =
              (extractedDetails.value.websites?.isNotEmpty ?? false)
                  ? extractedDetails.value.websites!.first
                  : '';
                  continueLoading.value=false;
          isLoading.value = false;
          if (fromVisitingCard) {
            continueLoading.value=false;
            isLoading.value = false;
            GoRouter.of(context).pushNamed(Routes.scanedDataFeilds);
          } else {
            GoRouter.of(context)
                .pushReplacementNamed(Routes.cardCreationDetailAdding);
          }
        } catch (e) {
          continueLoading.value = false;
          log('errror text extrattion = $e');
        }
        continueLoading.value = false;
        isLoading.value = false;
      },
    );
    continueLoading.value = false;
    isLoading.value = false;
  }

  void pickImageScanning({required bool camera}) async {
    final ImageModel? imageUrl = await ImagePickerClass.getImage(
      camera: camera,
    );

    if (imageUrl != null) {
      pickedImageUrl.add(imageUrl);
    } else {
      log('Image picking failed or was canceled.');
    }
  }

  void pickSelfie({required bool camera}) async {
    final ImageModel? imageUrl = await ImagePickerClass.getImage(
      camera: camera,
    );

    if (imageUrl != null) {
      pickedSelfiesImageUrl.add(imageUrl.base64 ?? '');
    } else {
      log('Image picking failed or was canceled.');
    }
  }

  void clearCardImages() {
    pickedImageUrl.value = [];
    isLoading.value = false;
  }

  void deleteImage() {
    if (pickedImageUrl.isNotEmpty) {
      pickedImageUrl.removeLast();
      pickedImageUrl.isEmpty?continueLoading.value=false:null;
    }
  }

  void swapImages() {
    if (pickedImageUrl.length == 2) {
      var image = pickedImageUrl.first;
      pickedImageUrl[0] = pickedImageUrl[1];
      pickedImageUrl[1] = image;
    }
  }
}
