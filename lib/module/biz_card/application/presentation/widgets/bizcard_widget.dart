import 'dart:convert';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_query_params_model/individual_shared_fields_query_params_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';

class BizcardWidget extends StatelessWidget {
  BizcardWidget({
    super.key,
    this.designation,
    this.name,
    this.personImage,
    this.qrScanner,
    this.onTap,
    this.bizcardId,
    required this.width,
    required this.height,
  }) : _flipCardController = FlipCardController();

  final String? personImage;
  final String? qrScanner;
  final String? name;
  final String? bizcardId;
  final String? designation;
  final VoidCallback? onTap;
  final double width, height;
  final FlipCardController _flipCardController;

  final levelSharingController = Get.find<LevelSharingController>();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      controller: _flipCardController,
      direction: FlipDirection.HORIZONTAL,
      flipOnTouch: false,
      front: _buildFrontCard(context),
      back: _buildBackCard(context),
    );
  }

  Widget _buildFrontCard(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius25,
          image: const DecorationImage(
            image: AssetImage(bizcardBgImage),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-1, -1),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                kWidth10,
                Text(
                  'Business Card',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                GestureDetector(
                  onTap: () {
                    levelSharingController.fetchIndividualSharedFields(
                        queryParameter: IndividualSharedFieldsQueryParamsModel(
                            bizcardId: bizcardId ?? ""));
                    GoRouter.of(context)
                        .pushNamed(Routes.levelSharingSettings, extra: {
                      "isCommonLevelSharing": false,
                      "bizcardId": bizcardId,
                    });
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(bizcardMoreIcon),
                  ),
                )
              ],
            ),
            adjustHieght(18.h),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kneon, width: 2),
                image: DecorationImage(
                  image: AssetImage(personImage ?? 'personImage'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            adjustHieght(10.h),
            Text(
              name ?? 'name',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            adjustHieght(4.h),
            Text(
              textAlign: TextAlign.center,
              designation ?? 'designation',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            adjustHieght(10.h),
            GestureDetector(
              onTap: () => _flipCardController.toggleCard(),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: kBorderRadius5,
                  image: DecorationImage(
                    image: MemoryImage(base64Decode(qrScanner ?? 'qrScanner')),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackCard(BuildContext context) {
    return GestureDetector(
      onTap: () => _flipCardController.toggleCard(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius25,
          color: kwhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-1, -1),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: width * 0.8,
            height: width * 0.8,
            decoration: BoxDecoration(
              borderRadius: kBorderRadius20,
              image: DecorationImage(
                image: MemoryImage(base64Decode(qrScanner ?? '')),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
