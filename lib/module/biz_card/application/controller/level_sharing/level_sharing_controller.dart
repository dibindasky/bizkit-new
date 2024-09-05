import 'package:bizkit/module/biz_card/data/service/level_sharing/level_sharing_service.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/all_common_shared_fields_responce/all_common_shared_fields_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/business_shared_fields/business_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_query_params_model/individual_shared_fields_query_params_model.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_responce/individual_shared_fields_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/personal_shared_fields/personal_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/update_common_shared_fields_model/update_common_shared_fields_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/level_sharing/level_sharing_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LevelSharingController extends GetxController {
  final LevelSharingRepo levelSharingService = LevelSharingService();

  RxBool commonLevelSharingLoading = false.obs;
  RxBool individualLevelSharingLoading = false.obs;

  // businessSharedFields , personalSharedFields for [ common level sharing ]
  Rx<BusinessSharedFields> businessSharedFields = BusinessSharedFields().obs;
  Rx<PersonalSharedFields> personalSharedFields = PersonalSharedFields().obs;

  // individualBusinessSharedFields , individualPersonalSharedFields for [ Individual level sharing ]
  Rx<BusinessSharedFields> individualBusinessSharedFields =
      BusinessSharedFields().obs;
  Rx<PersonalSharedFields> individualPersonalSharedFields =
      PersonalSharedFields().obs;

  Rx<AllCommonSharedFieldsResponce> commonLevelSharedFields =
      AllCommonSharedFieldsResponce().obs;

  // Variable to store the selected card's QR code
  var selectedCardQRData = ''.obs;

  // Variable to store the selected card's ID
  var selectedCardId = ''.obs;

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
        commonLevelSharedFields.value = success;
        businessSharedFields.value =
            success.sharedFields?.business ?? BusinessSharedFields();
        personalSharedFields.value =
            success.sharedFields?.personal ?? PersonalSharedFields();
      },
    );
  }

  // Method to  update the Common shared fields
  void updateCommonSharedFields(
      {required UpdateCommonSharedFieldsModel updateCommonSharedFields,
      required BuildContext context}) async {
    commonLevelSharingLoading.value = true;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final data = await levelSharingService.updateCommonSharedFields(
        updateCommonSharedFields: updateCommonSharedFields);

    data.fold(
      (failure) {
        commonLevelSharingLoading.value = false;
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(errorMessage),
            backgroundColor: kred,
          ),
        );
      },
      (success) {
        commonLevelSharingLoading.value = false;
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Common shared fields updated successfully'),
            backgroundColor: neonShade,
          ),
        );

        GoRouter.of(context).pop();
      },
    );
  }

  // Method to update the selected card's QR code
  void updateSelectedCardQRData(String qrData, cardId) {
    selectedCardQRData.value = qrData;
    selectedCardId.value = cardId;
  }

  void changePersonalCommonLevelSharing(
      {required PersonalSharedFields personalSharedFields}) {
    this.personalSharedFields.value = personalSharedFields;
  }

  void changeBusinessSharedFieldsCommonLevelSharing(
      {required BusinessSharedFields businessSharedFields}) {
    this.businessSharedFields.value = businessSharedFields;
  }

  void changeComSharingApplicableToIndividual(
      {required AllCommonSharedFieldsResponce applicableToIndividual}) {
    commonLevelSharedFields.value = applicableToIndividual;
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
