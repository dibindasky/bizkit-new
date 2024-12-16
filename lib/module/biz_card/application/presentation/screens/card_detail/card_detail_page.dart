import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_detail_edit_button.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_detail_top_portion.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/bizcard_details_icons.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/product/bizcard_products_brand.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/widgets/reminder_notes/bizcard_reminders_notes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BizCardDetailScreen extends StatelessWidget {
  const BizCardDetailScreen(
      {super.key, this.cardId, required this.myCard, this.fromPreview = false});
  final String? cardId;
  final bool myCard;
  final bool fromPreview;

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          if ((cardId != null && myCard )|| fromPreview) {
            cardController.cardDetail(cardId: cardId ?? '', refresh: true);
          } else if (!myCard) {
            Get.find<ConnectionsController>()
                .getConnectionCardDetail(cardId: cardId ?? '', refresh: true,uid: cardController.toUserId);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // card user data and images
              BizcardDetailTopPotion(myCard: myCard, fromPreview: fromPreview),
              Column(
                children: [
                  // ImageSlideWidget(images: [imageDummyNetwork,imageDummyNetwork,imageDummyNetwork,imageDummyNetwork,imageDummyNetwork,imageDummyNetwork,imageDummyNetwork,imageDummyNetwork],),
                  // card details icons and gifs
                  const BizCardDetailsIconsWidgets(),
                  // products and brands
                  const BizCardProductsOrBrands(),
                  myCard
                      // edit button
                      ? const BizcardDetailEditButton()
                      : fromPreview
                          ? kempty
                          // notes section
                          : const BizCardRminderNotes(),
                  kHeight50,
                  kHeight50,
                  kHeight50,
                  kHeight50,
                  kHeight50,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSlideWidget extends StatefulWidget {
  final List<String> images;

  const ImageSlideWidget({Key? key, required this.images}) : super(key: key);

  @override
  _ImageSlideWidgetState createState() => _ImageSlideWidgetState();
}

class _ImageSlideWidgetState extends State<ImageSlideWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 300,
      color: kred.withOpacity(0.1),
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < widget.images.length; i++)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              left: getLeftPosition(i),
              top: getTopPosition(i),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = i;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: i == currentIndex ? 120 : 60,
                  height: i == currentIndex ? 120 : 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(widget.images[i]),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: i == currentIndex
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  double getLeftPosition(int index) {
    if (index == currentIndex)
      return MediaQuery.of(context).size.width / 2 - 60;
    return MediaQuery.of(context).size.width /
            4 *
            (index < currentIndex ? 1 : 3) -
        30;
  }

  double getTopPosition(int index) {
    if (index == currentIndex)
      return MediaQuery.of(context).size.height / 2 - 60;
    return MediaQuery.of(context).size.height / 2 - 30;
  }
}
