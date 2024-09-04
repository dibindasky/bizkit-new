import 'package:bizkit/module/biz_card/data/service/level_sharing/level_sharing_service.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/business_shared_fields/business_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_query_params_model/individual_shared_fields_query_params_model.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_responce/individual_shared_fields_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/personal_shared_fields/personal_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/update_common_shared_fields_model/update_common_shared_fields_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/level_sharing/level_sharing_repo.dart';
import 'package:get/get.dart';

class LevelSharingController extends GetxController {
  final LevelSharingRepo levelSharingService = LevelSharingService();

  RxBool commonLevelSharingLoading = false.obs;
  RxBool individualLevelSharingLoading = false.obs;

  // businessSharedFields , personalSharedFields for [ common level sharing ]
  var businessSharedFields = BusinessSharedFields().obs;
  var personalSharedFields = PersonalSharedFields().obs;

  // individualBusinessSharedFields , individualPersonalSharedFields for [ Individual level sharing ]
  var individualBusinessSharedFields = BusinessSharedFields().obs;
  var individualPersonalSharedFields = PersonalSharedFields().obs;

  // Variable to store the selected card's QR code
  var selectedCardQRData = ''.obs;

  // get all Common shared fields
  void fetchAllCommonSharedFields() async {
    commonLevelSharingLoading.value = true;
    final data = await levelSharingService.getAllCommonSharedFields();

    data.fold(
      (failure) {
        commonLevelSharingLoading.value = false;
      },
      (success) {
        commonLevelSharingLoading.value = false;
        businessSharedFields.value =
            success.sharedFields?.business ?? BusinessSharedFields();
        personalSharedFields.value =
            success.sharedFields?.personal ?? PersonalSharedFields();
      },
    );
  }

  // Method to  update the Common shared fields
  void updateCommonSharedFields(
      {required UpdateCommonSharedFieldsModel updateCommonSharedFields}) async {
    commonLevelSharingLoading.value = true;
    final data = await levelSharingService.updateCommonSharedFields(
        updateCommonSharedFields: updateCommonSharedFields);

    data.fold(
      (failure) {
        commonLevelSharingLoading.value = false;
      },
      (success) {
        commonLevelSharingLoading.value = false;
      },
    );
  }

  // Method to update the selected card's QR code
  void updateSelectedCardQRData(String qrData) {
    selectedCardQRData.value = qrData;
  }

  // get all Individual shared fields
  void fetchIndividualSharedFields(
      {required IndividualSharedFieldsQueryParamsModel queryParameter}) async {
    individualLevelSharingLoading.value = true;
    final data = await levelSharingService.getAllIndividualSharedFields(
        queryParameter: queryParameter);

    data.fold(
      (failure) {
        individualLevelSharingLoading.value = false;
      },
      (success) {
        individualLevelSharingLoading.value = false;
        individualBusinessSharedFields.value =
            success.sharedFields?.business ?? BusinessSharedFields();
        individualPersonalSharedFields.value =
            success.sharedFields?.personal ?? PersonalSharedFields();
      },
    );
  }

  // Method for update the Individual shared fields
  void updateIndividualSharedFields(
      {required IndividualSharedFieldsResponce
          updateIndividualSharedFields}) async {
    individualLevelSharingLoading.value = true;
    final data = await levelSharingService.updateIndividualSharedFields(
        updateIndividualSharedFields: updateIndividualSharedFields);

    data.fold(
      (failure) {
        individualLevelSharingLoading.value = false;
      },
      (success) {
        individualLevelSharingLoading.value = false;
      },
    );
  }
}
