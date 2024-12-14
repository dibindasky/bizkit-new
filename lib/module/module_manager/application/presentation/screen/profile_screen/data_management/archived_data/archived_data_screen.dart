import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/data_management/widgets/custom_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ArchivedCardScreen extends StatefulWidget {
  const ArchivedCardScreen({super.key});

  @override
  State<ArchivedCardScreen> createState() => _ArchivedCardScreenState();
}

class _ArchivedCardScreenState extends State<ArchivedCardScreen> {
  final cardController = Get.find<CardController>();

  Future<void> onRefresh() async {
    cardController.fetchDeletedAndArchivedCards();
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Archived Cards',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: GetBuilder<CardController>(
            builder: (controller) {
              if (controller.isLoading.value) {
                return SizedBox(
                    height: 550.h,
                    child: const Center(child: CircularProgressIndicator()));
              } else if (controller.archivedCards.isEmpty) {
                return SizedBox(
                  height: 400.h,
                  child: ErrorRefreshIndicator(
                    image: emptyNodata2,
                    errorMessage: 'No archived cards',
                    onRefresh: () {
                      controller.fetchDeletedAndArchivedCards();
                    },
                  ),
                );
              } else {
                return Obx(() => ListView.separated(
                      // controller: scrollController,
                      shrinkWrap: true,
                      itemCount: controller.archivedCards.length,
                      separatorBuilder: (context, index) =>
                          adjustHieght(khieght * .01),
                      itemBuilder: (context, index) {
                        final card = controller.archivedCards[index];
                        return SizedBox(
                          width: 362.w,
                          height: 100.h,
                          child: CustomCard(
                              companyName: card.companyName,
                              designation: card.designation,
                              name: card.name,
                              logo: card.logo,
                              ontap: () {
                                showConfirmationDialog(
                                  heading: 'Restore Card',
                                  actionButton: 'Restore',
                                  context,
                                  onPressed: () {
                                    controller.archiveACard(
                                      context: context,
                                      cardArchive: CardArchiveModel(
                                          bizcardId: card.bizcardId ?? '',
                                          isArchived: false),
                                    );
                                  },
                                );
                              }),
                        );
                      },
                    ));
              }
            },
          ),
        ),
      ),
    );
  }
}
