import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/bottom_sheets_and_pop_up/bizcard_logo_story_bottom_sheet.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/module/module_manager/application/controller/module_controller.dart';
import 'package:bizkit/utils/animations/word_by_word_text_animation.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizcardDetailTopPotion extends StatelessWidget {
  const BizcardDetailTopPotion({
    super.key,
    required this.myCard,
    this.scanPage = false,
  });

  final bool myCard;
  final bool scanPage;

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return SizedBox(
      height: 260.h,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(bizcardBgImage), fit: BoxFit.cover)),
            height: 170.h,
            child: Column(
              children: [
                kHeight10,
                myCard
                    // back and menu button for my card
                    ? Row(
                        children: [
                          kWidth20,
                          GestureDetector(
                            onTap: () {
                              if (scanPage) {
                                if (scanPage) {
                                  Get.find<ModuleController>().chooseModule(
                                      context,
                                      module: Module.card);
                                }
                              }
                              GoRouter.of(context).pop();
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 15.sp,
                              ),
                            ),
                          ),
                          kWidth10,
                          Text('Card',
                              style: Theme.of(context).textTheme.bodyMedium),
                          const Spacer(),
                          Obx(
                            () => cardController.isLoading.value
                                ? kempty
                                : PopupMenuButton<String>(
                                    icon: CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      child: Icon(
                                        Icons.more_vert,
                                        size: 18.sp,
                                      ),
                                    ),
                                    onSelected: (value) {},
                                    itemBuilder: (context) {
                                      List<PopupMenuEntry<String>> items = [];
                                      items.add(
                                        PopupMenuItem(
                                          onTap: () {
                                            showConfirmationDialog(
                                              actionButton: 'Default',
                                              heading:
                                                  'Are you sure you want to set as defult card',
                                              context,
                                              onPressed: () {
                                                cardController.setDefaultCard(
                                                    context: context,
                                                    cardId: cardController
                                                            .bizcardDetail
                                                            .value
                                                            .bizcardId ??
                                                        '');
                                              },
                                            );
                                          },
                                          value: 'Default',
                                          child: const Text('Set as default'),
                                        ),
                                      );
                                      items.addAll([
                                        PopupMenuItem(
                                            onTap: () {
                                              showConfirmationDialog(
                                                actionButton: 'Archive',
                                                heading:
                                                    'Are you sure you want to archive your card',
                                                context,
                                                onPressed: () {
                                                  cardController.archiveACard(
                                                      context: context,
                                                      cardArchive:
                                                          CardArchiveModel(
                                                        bizcardId: cardController
                                                                .bizcardDetail
                                                                .value
                                                                .bizcardId ??
                                                            '',
                                                        isArchived: true,
                                                      ));
                                                },
                                              );
                                            },
                                            value: 'Archive',
                                            child: const Text('Archive')),
                                        PopupMenuItem(
                                            onTap: () => showConfirmationDialog(
                                                  heading:
                                                      'Are you sure you want to delete your card',
                                                  context,
                                                  onPressed: () {
                                                    cardController.deleteACard(
                                                        context: context,
                                                        cardDelete:
                                                            CardDeleteModel(
                                                          bizcardId: cardController
                                                                  .bizcardDetail
                                                                  .value
                                                                  .bizcardId ??
                                                              '',
                                                          isDisabled: true,
                                                        ));
                                                  },
                                                ),
                                            value: 'Delete Card',
                                            child: const Text('Delete Card')),
                                      ]);
                                      return items;
                                    },
                                  ),
                          ),
                          kWidth10,
                        ],
                      )
                    // back and menu button for others card
                    : Row(children: [
                        kWidth10,
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 15.sp,
                            ),
                          ),
                        ),
                        const Spacer(),
                        PopupMenuButton<String>(
                          icon: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: Icon(
                              Icons.more_vert,
                              size: 18.sp,
                            ),
                          ),
                          onSelected: (value) {},
                          itemBuilder: (context) {
                            List<PopupMenuEntry<String>> items = [];
                            items.addAll([
                              PopupMenuItem(
                                  onTap: () {
                                    showConfirmationDialog(
                                      actionButton: 'Unfollow',
                                      heading:
                                          'Are you sure you want to unfollw this card',
                                      context,
                                      onPressed: () {
                                        // TODO: unfollow controller call
                                      },
                                    );
                                  },
                                  value: 'Unfollow',
                                  child: const Text('Unfollow')),
                              PopupMenuItem(
                                  onTap: () {
                                    GoRouter.of(context).pushNamed(
                                        Routes.reminderCreation,
                                        extra: {
                                          'cardId': cardController.bizcardDetail
                                                  .value.bizcardId ??
                                              '',
                                          'connectionId': cardController
                                                  .bizcardDetail
                                                  .value
                                                  .connectionId ??
                                              ''
                                        });
                                  },
                                  value: 'Add Reminder',
                                  child: const Text('Add Reminder')),
                            ]);
                            return items;
                          },
                        ),
                        kWidth10,
                      ]),
                kHeight5,
                Obx(() => cardController.isLoading.value
                    ? kempty
                    : Expanded(
                        child: WordByWordTextAnimation(
                          text: cardController.bizcardDetail.value
                                  .businessDetails?.logoStory ??
                              '',
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              enableDrag: true,
                              isDismissible: true,
                              showDragHandle: true,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              builder: (context) =>
                                  BizcardLogoStoryViewBottomSheet(
                                logoNetworkImage: cardController.bizcardDetail
                                        .value.businessDetails?.businessLogo ??
                                    '',
                                logoStory: cardController.bizcardDetail.value
                                    .businessDetails?.logoStory,
                                compnayStory: cardController.bizcardDetail.value
                                    .businessDetails?.companyStory,
                                myStory: cardController.bizcardDetail.value
                                    .personalDetails?.personalStory,
                                showMyStory: cardController.bizcardDetail.value
                                        .personalDetails?.showPersonalStory ??
                                    true,
                              ),
                            );
                          },
                        ),
                      ))
              ],
            ),
          ),
          Align(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  kHeight40,
                  Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: kBorderRadius360),
                    child: (cardController.bizcardDetail.value.personalDetails
                                ?.images?.isEmpty ??
                            true)
                        ? Image.asset(
                            iconPersonOutline,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : NetworkImageWithLoader(
                            (cardController.bizcardDetail.value.personalDetails
                                        ?.images?.isNotEmpty ??
                                    false)
                                ? (cardController.bizcardDetail.value
                                    .personalDetails!.images!.first)
                                : imageDummyNetwork,
                            radius: 100.h,
                          ),
                  ),
                  kHeight10,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        cardController.bizcardDetail.value.personalDetails
                                    ?.name !=
                                null
                            ? cardController.bizcardDetail.value.personalDetails
                                    ?.name ??
                                ''
                            : cardController.bizcardDetail.value.businessDetails
                                        ?.businessName !=
                                    null
                                ? cardController.bizcardDetail.value
                                        .businessDetails?.businessName ??
                                    ""
                                : '',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        cardController.bizcardDetail.value.businessDetails
                                    ?.designation !=
                                null
                            ? cardController.bizcardDetail.value.businessDetails
                                    ?.designation ??
                                ""
                            : '',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  kHeight20,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
