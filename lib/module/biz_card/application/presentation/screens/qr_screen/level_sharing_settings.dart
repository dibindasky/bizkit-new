import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/qr_screen/widgets/level_sharing_switchs.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_responce/individual_shared_fields_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_responce/shared_fields.dart';

import 'package:bizkit/module/biz_card/domain/model/level_sharing/update_common_shared_fields_model/shared_fields.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/update_common_shared_fields_model/update_common_shared_fields_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardDefaultLevelSharing extends StatelessWidget {
  const CardDefaultLevelSharing({super.key, this.isCommonLevelSharing = false});

  final bool isCommonLevelSharing;

  @override
  Widget build(BuildContext context) {
    final levelSharingController = Get.find<LevelSharingController>();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {},
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          isCommonLevelSharing
              ? 'Commen level sharing settings'
              : 'Level Sharing',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              adjustHieght(khieght * .04),
              SwitchButtons(
                isCommonLevelSharing: isCommonLevelSharing,
              ),
              adjustHieght(khieght * .05),
              EventButton(
                text: 'Save',
                onTap: () {
                  if (isCommonLevelSharing) {
                    levelSharingController.updateCommonSharedFields(
                      context: context,
                      updateCommonSharedFields: UpdateCommonSharedFieldsModel(
                        applicableToIndividual: levelSharingController
                                .commonLevelSharedFields
                                .value
                                .applicableToIndividual ??
                            false,
                        sharedFields: SharedFields(
                          business:
                              levelSharingController.businessSharedFields.value,
                          personal:
                              levelSharingController.personalSharedFields.value,
                        ),
                      ),
                    );
                  } else {
                    levelSharingController.updateIndividualSharedFields(
                      context: context,
                      updateIndividualSharedFields:
                          IndividualSharedFieldsResponce(
                        sharedFields: IndividualSharedFields(
                            business: levelSharingController
                                .individualBusinessSharedFields.value,
                            personal: levelSharingController
                                .individualPersonalSharedFields.value),
                        bizcardId: levelSharingController.selectedCardId.value,
                      ),
                    );
                  }
                },
              ),
              adjustHieght(khieght * .03),
            ],
          ),
        ),
      ),
    );
  }
}
