import 'package:bizkit/module/biz_card/data/service/level_sharing/level_sharing_service.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/all_common_shared_fields_responce/shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/business_shared_fields/business_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/personal_shared_fields/personal_shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/level_sharing/level_sharing_repo.dart';
import 'package:get/get.dart';

class LevelSharingController extends GetxController {
  final LevelSharingRepo levelSharingService = LevelSharingService();

  RxBool commonLevelSharingLoading = false.obs;
  RxBool individualLevelSharingLoading = false.obs;

  var businessSharedFields = BusinessSharedFields().obs;
  var personalSharedFields = PersonalSharedFields().obs;
  var sharedFields = SharedFields().obs;

  // get all common shared fields
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
}
