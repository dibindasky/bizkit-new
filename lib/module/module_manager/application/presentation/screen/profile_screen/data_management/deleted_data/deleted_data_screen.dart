import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/module_manager/application/presentation/screen/profile_screen/data_management/widgets/custom_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeletedCardScreen extends StatefulWidget {
  const DeletedCardScreen({super.key});

  @override
  State<DeletedCardScreen> createState() => _DeletedCardScreenState();
}

class _DeletedCardScreenState extends State<DeletedCardScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController firstCardscrollController = ScrollController();
  late ScrollController secondcardscrollController = ScrollController();

  final cardController = Get.find<CardController>();
  Future<void> onRefresh() async {
    cardController.fetchDeletedAndArchivedCards();

    await Future.delayed(const Duration(milliseconds: 500));
  }

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    firstCardscrollController.addListener(() {
      if (firstCardscrollController.position.pixels ==
          firstCardscrollController.position.maxScrollExtent) {
        //context.read<CardBloc>().add(const CardEvent.getdeleteCardsEvent());
      }
    });
    secondcardscrollController.addListener(() {
      if (secondcardscrollController.position.pixels ==
          secondcardscrollController.position.maxScrollExtent) {
        // context
        //     .read<CardSecondBloc>()
        //     .add(const CardSecondEvent.getDeleteCardSecondEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kblack,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Deleted Cards',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: kneon,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(23),
          ),
        ),
        child: TabBar(
          indicatorPadding: const EdgeInsets.all(3),
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          indicator: BoxDecoration(
            color: kneon,
            borderRadius: kBorderRadius20,
          ),
          labelStyle: textThinStyle1.copyWith(color: kwhite),
          labelColor: kwhite,
          tabs: [
            Tab(
              child: Text(
                'My Cards',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Tab(
              child: Text(
                'Reciver Cards',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      ),
    ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: khieght * 0.8,
                      child: GetBuilder<CardController>(
                        builder: (controller) {
                          if (controller.isLoading.value) {
                            return const Center(
                                child: CircularProgressIndicator(
                                    color: neonShade));
                          } else if (controller.deletedCards.isEmpty) {
                            return SizedBox(
                              height: 400.h,
                              child: ErrorRefreshIndicator(
                                image: emptyNodata2,
                                errorMessage: 'No deleted cards',
                                onRefresh: () {
                                  controller.fetchDeletedAndArchivedCards();
                                },
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: ListView.separated(
                                controller: firstCardscrollController,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.deletedCards.length,
                                separatorBuilder: (context, index) =>
                                    adjustHieght(khieght * .01),
                                itemBuilder: (context, index) {
                                  final card = controller.deletedCards[index];
                                  return InkWell(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: 362.w,
                                        height: 100.h,
                                        child: CustomCard(
                                          designation: card.designation,
                                          companyName: card.companyName,
                                          name: card.deletedUserName,
                                          logo: card.logo,
                                          ontap: () {
                                            showConfirmationDialog(
                                              actionButton: 'Restore',
                                              heading: 'Restore Deleted cards',
                                              context,
                                              onPressed: () {
                                                controller.deleteACard(
                                                    context: context,
                                                    cardDelete: CardDeleteModel(
                                                        bizcardId: controller
                                                                .deletedCards[
                                                                    index]
                                                                .bizcardId ??
                                                            '',
                                                        isDisabled: false));
                                              },
                                            );
                                          },
                                        ),
                                      ));
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    SizedBox(
                        height: khieght * 0.8,
                        child: GetBuilder<ReceivedCardController>(
                          builder: (controller) {
                            if (controller.isLoading.value) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: neonShade));
                            } else if (controller
                                .deletedVisitingCards.isEmpty) {
                              return SizedBox(
                                height: 400.h,
                                child: ErrorRefreshIndicator(
                                  image: emptyNodata2,
                                  errorMessage: 'No deleted cards',
                                  onRefresh: () {
                                    controller.fetchAllDeletedVisitingCards();
                                  },
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Obx(() => ListView.separated(
                                      controller: firstCardscrollController,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller
                                          .deletedVisitingCards.length,
                                      separatorBuilder: (context, index) =>
                                          adjustHieght(khieght * .01),
                                      itemBuilder: (context, index) {
                                        final visitingCards = controller
                                            .deletedVisitingCards[index];
                                        return InkWell(
                                            onTap: () {},
                                            child: SizedBox(
                                              width: 362.w,
                                              height: 100.h,
                                              child: CustomCard(
                                                companyName:
                                                    visitingCards.company,
                                                designation:
                                                    visitingCards.designation,
                                                name: visitingCards.name,
                                                logo: visitingCards.cardImage,
                                                ontap: () {
                                                  showConfirmationDialog(
                                                    actionButton: 'Restore',
                                                    heading:
                                                        'Restore Deleted cards',
                                                    context,
                                                    onPressed: () {
                                                      controller.deleteVisitingCard(
                                                          visitingCardDeleteModel:
                                                              VisitingCardDeleteModel(
                                                                  cardId: visitingCards
                                                                          .id ??
                                                                      '',
                                                                  isDisabled:
                                                                      false),
                                                          context: context);
                                                    },
                                                  );
                                                },
                                              ),
                                            ));
                                      },
                                    )),
                              );
                            }
                          },
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
