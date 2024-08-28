import 'dart:developer';

import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/visiting_card/visiting_card_controller.dart';
import 'package:bizkit/module/biz_card/data/service/text_extraction/text_extraction_service.dart';
import 'package:bizkit/module/biz_card/domain/model/text_extraction/text_extraction_model/text_extraction_model.dart';
import 'package:bizkit/module/biz_card/domain/model/text_extraction/text_extraction_responce/extracted_details.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/text_extraction_repo.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';

import 'package:get/get.dart';

class CardTextExtractionController extends GetxController {
  final TextExtractionRepo textExtractionService = TextExtractionService();

  RxBool isLoading = false.obs;

  // Holds extractedDetails response
  var extractedDetails = ExtractedDetails().obs;

  RxList<ImageModel> pickedImageUrl = <ImageModel>[].obs;
  RxList<String> pickedSelfiesImageUrl = <String>[].obs;

  RxList<String> extractedPhoneNumbers = <String>[].obs;
  RxList<String> extractedEmails = <String>[].obs;
  RxList<String> extractedLocations = <String>[].obs;

  void textExtraction(
      {required TextExtractionModel textExtractionModel,
      required bool fromVisitingCard}) async {
    isLoading.value = true;

    final data = await textExtractionService.textExtracion(
        textExtractionModel: textExtractionModel);

    data.fold(
      (failure) {
        isLoading.value = false;
        log('${failure.message}');
      },
      (success) {
        extractedDetails.value = success.extractedDetails!;

        extractedEmails.assignAll((extractedDetails.value.emails ?? []));
        extractedPhoneNumbers
            .assignAll((extractedDetails.value.phoneNumbers ?? []));
        extractedLocations.assignAll((extractedDetails.value.location ?? []));
        if (fromVisitingCard == false) {
          final cardController = Get.find<CardController>();
          cardController.nameController.text =
              extractedDetails.value.personName ?? '';
          cardController.phoneController.text =
              (extractedDetails.value.phoneNumbers?.isNotEmpty ?? false)
                  ? extractedDetails.value.phoneNumbers!.first
                  : '';
          cardController.emailController.text =
              (extractedDetails.value.emails?.isNotEmpty ?? false)
                  ? extractedDetails.value.emails!.first
                  : '';
          cardController.designationController.text =
              extractedDetails.value.designation ?? '';
          cardController.companyNameController.text =
              extractedDetails.value.businessName ?? '';
        } else {
          final visitingCardController = Get.find<VisitingCardController>();
          visitingCardController.nameController.text =
              extractedDetails.value.personName ?? '';
          visitingCardController.phoneController.text =
              (extractedDetails.value.phoneNumbers?.isNotEmpty ?? false)
                  ? extractedDetails.value.phoneNumbers!.first
                  : '';
          visitingCardController.emailController.text =
              (extractedDetails.value.emails?.isNotEmpty ?? false)
                  ? extractedDetails.value.emails!.first
                  : '';
          visitingCardController.designationController.text =
              extractedDetails.value.designation ?? '';
          visitingCardController.companyNameController.text =
              extractedDetails.value.businessName ?? '';
        }

        isLoading.value = false;
      },
    );
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
}
