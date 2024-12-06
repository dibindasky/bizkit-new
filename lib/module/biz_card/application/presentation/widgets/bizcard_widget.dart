import 'dart:convert';
import 'dart:typed_data';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_query_params_model/individual_shared_fields_query_params_model.dart';
import 'package:bizkit/module/module_manager/application/controller/access/access_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
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
    this.completeLevel,
    this.isDefault,
    this.createCard = false,
  }) : _flipCardController = FlipCardController();

  final String? personImage;
  final String? qrScanner;
  final String? name;
  final String? bizcardId;
  final String? designation;
  final VoidCallback? onTap;
  final double width, height;
  final bool createCard;
  final FlipCardController _flipCardController;
  final int? completeLevel;
  final bool? isDefault;

  final levelSharingController = Get.find<LevelSharingController>();
  final accessController = Get.find<AccessController>();

  Uint8List? get decodedQrImage {
    if (qrScanner == null || qrScanner!.isEmpty) {
      return null; // Return null if the base64 string is invalid
    }
    try {
      return base64Decode(qrScanner!); // Decode the valid base64 string
    } catch (e) {
      debugPrint('Invalid base64 string: $e');
      return null;
    }
  }

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
              mainAxisAlignment: isDefault == true
                  ? MainAxisAlignment.spaceAround
                  : createCard == true
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceAround,
              children: [
                if (isDefault == true)
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    child: ColoredBox(
                        color: kneon,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: Text(
                            'Default',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 10),
                          ),
                        )),
                  ),
                if (isDefault == false) kWidth10,
                Text(
                  'Business Card',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                createCard
                    ? kempty
                    : GestureDetector(
                        onTap: () {
                          levelSharingController.fetchIndividualSharedFields(
                              queryParameter:
                                  IndividualSharedFieldsQueryParamsModel(
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
            Stack(
              children: [
                if (!createCard)
                  SizedBox(
                    width: 80.w,
                    height: 80.w,
                    child: CircularProgressIndicator(
                      value: (completeLevel ?? 100) / 100,
                      strokeWidth: 5,
                      backgroundColor: kdarkOffWhite,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary),
                    ),
                  ),
                Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        createCard ? Border.all(color: kneon, width: 2) : null,
                    image: createCard || (personImage?.isNotEmpty ?? false)
                        ? const DecorationImage(
                            image: AssetImage(bizcardBgImage),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage(dummyPersonImage),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: createCard
                      ? const Icon(Icons.add, color: kwhite)
                      : (personImage?.isNotEmpty ?? false)
                          ? NetworkImageWithLoader(
                              personImage!,
                              radius: 100,
                              errorWidget: const Icon(
                                Icons.person,
                                color: kwhite,
                                size: 30,
                              ),
                            )
                          : null,
                ),
              ],
            ),
            createCard
                ? Column(
                    children: [
                      kHeight10,
                      Text(
                          (accessController.userRole.value == 'user')
                              ? 'Create a Business card'
                              : 'Request Organisation',
                          style: Theme.of(context).textTheme.bodyMedium),
                      kHeight10,
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                              textAlign: TextAlign.center,
                              'Create a sharable Business Card to showcase your achievements, connect with others, and grow your network seamlessly.',
                              style: Theme.of(context).textTheme.bodySmall)),
                    ],
                  )
                : Column(
                    children: [
                      adjustHieght(5.h),
                      if (completeLevel == 100)
                        kempty
                      else
                        Text(
                          '${completeLevel ?? 0}%',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 8),
                        ),
                      adjustHieght(2.h),
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
                        onTap: () {
                          _flipCardController.toggleCard();
                          Get.find<CardController>().changeAutoScroll();
                        },
                        child: decodedQrImage == null
                            ? null
                            : FadeInImage(
                                placeholder: const AssetImage(bizcardBgImage),
                                height: 40.h,
                                fit: BoxFit.cover,
                                placeholderFit: BoxFit.cover,
                                fadeInDuration: const Duration(seconds: 1),
                                image: MemoryImage(decodedQrImage!),
                              ),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _flipCardController.toggleCard();
        Get.find<CardController>().changeAutoScroll();
      },
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
          child: decodedQrImage == null
              ? Text(
                  'QR Code Not Available',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : Container(
                  width: width * 0.8,
                  height: width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius25,
                    image: DecorationImage(
                      image: MemoryImage(decodedQrImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
