import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/screen_detail_editing/card_detail_editing_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/widgets/card_bottom_part.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenCardDetailView extends StatefulWidget {
  const ScreenCardDetailView(
      {super.key, required this.myCard, required this.cardId});
  final String? cardId;
  //final int? userId;
  final bool myCard;

  @override
  State<ScreenCardDetailView> createState() => _ScreenCardDetailViewState();
}

class _ScreenCardDetailViewState extends State<ScreenCardDetailView> {
  final cardController = Get.find<CardController>();

  @override
  void initState() {
    getCard();
    super.initState();
  }

  Future getCard() async {
    if (widget.cardId != null) {
      cardController.cardDetail(cardId: widget.cardId!);
      //   // context
      //   //     .read<CardBloc>()
      //   //     .add(CardEvent.getCardyCardId(id: widget.cardId!));
      //   // context.read<ReminderBloc>().add(ReminderEvent.getCardReminder(
      //   //     cardIdModel: CardIdModel(cardId: widget.cardId!)));
    }
    //if (widget.userId != null) {
    // context
    //     .read<CardBloc>()
    //     .add(CardEvent.getCardyUserId(id: widget.userId!));
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kwhite,
            size: 18,
          ),
        ),
        backgroundColor: knill,
        title: const Text('Card'),
        actions: [
          IconButton(
            onPressed: () {
              // if (state.anotherCard!.percentage! == 10) {
              //   companySearchNotifier.value = 2;
              // } else if (state.anotherCard!.isCompanyAutofilled!) {
              //   companySearchNotifier.value = 1;
              // } else {
              //   companySearchNotifier.value = 0;
              // }
              // companySearchNotifier.notifyListeners();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ScreenCardDetailEditingList()));

              // context.read<UserDataBloc>().add(
              //     UserDataEvent.getCurrentCard(
              //         card: state.anotherCard!));
              // context.read<BusinessDataBloc>().add(
              //     BusinessDataEvent.getCurrentCard(
              //         card: state.anotherCard!));
            },
            icon: const Icon(Icons.edit),
          ),
          kWidth10
        ],
      ),
      body: Obx(
        () {
          if (cardController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(color: neonShade));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RefreshIndicator(
              onRefresh: () async {
                //getCard();
              },
              child: ListView(
                children: [
                  kHeight20,
                  // Image carosal view
                  SizedBox(
                    height: 200.h,
                    child: const PreviewPageviewImageBuilder(
                      imagesList: [dummyPersonImage],
                      //sisStory: false,
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        cardController.personalDetails.value?.name != null
                            ? cardController.personalDetails.value?.name ?? ''
                            : cardController
                                        .businessDetails.value?.businessName !=
                                    null
                                ? cardController
                                        .businessDetails.value?.businessName ??
                                    ""
                                : 'Name',
                        overflow: TextOverflow.ellipsis,
                        style: custumText(fontSize: kwidth * 0.06),
                      ),
                      Text(
                        cardController.personalDetails.value?.email != null
                            ? cardController.personalDetails.value?.email ?? ''
                            : cardController
                                        .businessDetails.value?.designation !=
                                    null
                                ? cardController
                                        .businessDetails.value?.designation ??
                                    ""
                                : 'Designation',
                        overflow: TextOverflow.ellipsis,
                      ),
                      adjustHieght(khieght * .02),
                    ],
                  ),
                  // card details
                  const ScreenCardDetailSecondHalf()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
