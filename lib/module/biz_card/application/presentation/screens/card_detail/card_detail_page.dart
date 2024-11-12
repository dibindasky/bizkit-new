import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizCardDetailScreen extends StatefulWidget {
  const BizCardDetailScreen({super.key, this.cardId, required this.myCard});
  final String? cardId;
  final bool myCard;

  @override
  State<BizCardDetailScreen> createState() => _BizCardDetailScreenState();
}

class _BizCardDetailScreenState extends State<BizCardDetailScreen> {
  // final cardController = Get.find<CardController>();
  // final personalDetailsController = Get.find<PersonalDetailsController>();
  // final businessDetailsController = Get.find<BusinesDetailsController>();
  // final connectionController = Get.find<ConnectionsController>();

  // @override
  // void initState() {
  //   getCard();
  //   super.initState();
  // }

  // Future getCard() async {
  //   if (widget.cardId != null && widget.myCard) {
  //     cardController.cardDetail(cardId: widget.cardId ?? '');
  //   } else if (!widget.myCard) {
  //     connectionController.getConnectionCardDetail(cardId: widget.cardId ?? '');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 250.h,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'asset/module/bizcard/bizcard_bg_img.png'),
                            fit: BoxFit.cover)),
                    height: 125.h,
                    child: Column(
                      children: [
                        kHeight5,
                        widget.myCard
                            ? Row(
                                children: [
                                  kWidth20,
                                  GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        size: 15.sp,
                                      ),
                                    ),
                                  ),
                                  kWidth10,
                                  Text('Edit Card',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium)
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                    CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      child:
                                          const Icon(Icons.more_vert_rounded),
                                    ),
                                    kWidth10,
                                  ]),
                        kHeight5,
                      ],
                    ),
                  ),
                  const Align(
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(dummyPersonImage)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Jasai Gopisetty',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          'UXUI Designer',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        kHeight20,
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                FittedBox(
                    child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    gifListCardDetail.length,
                    (index) => DetailSharingIconBizcardDetail(
                        image: gifListCardDetail[index], onTap: () {}),
                  ),
                )),
                kHeight20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      iconBizcardDetailsText.length,
                      (index) => DeatailRowIconTextBizcardDetail(
                          text: iconBizcardDetailsText[index],
                          image: iconBizcardDetails[index],
                          onTap: () {}),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight20,
                        Text('Products/Brochures',
                            style: Theme.of(context).textTheme.displaySmall),
                        kHeight5,
                        SizedBox(
                          height: 100.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => AspectRatio(
                              aspectRatio: 0.9,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    color: kred, borderRadius: kBorderRadius10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text('Notes',
                          style: Theme.of(context).textTheme.displaySmall),
                      kHeight10,
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: ColoredBox(
                            color: smallBigGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        imageHistoryList[index % 4],
                                        fit: BoxFit.cover,
                                      ),
                                      adjustWidth(kwidth * .004),
                                      Text(
                                        'Date',
                                        style:
                                            TextStyle(fontSize: kwidth * .035),
                                      ),
                                    ],
                                  ),
                                  adjustHieght(khieght * .006),
                                  Text(
                                    'Scheduled on Time to discuss about Mesage.',
                                    style: TextStyle(fontSize: kwidth * .035),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DeatailRowIconTextBizcardDetail extends StatelessWidget {
  const DeatailRowIconTextBizcardDetail(
      {super.key,
      required this.image,
      required this.onTap,
      required this.text});
  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(left: 5, right: 7),
          height: 45,
          decoration: BoxDecoration(
            // color: Theme.of(context).,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: kgrey),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Image.asset(image,
                      color: Theme.of(context).colorScheme.onPrimary)),
              Expanded(
                  child: FittedBox(
                child:
                    Text(text, style: Theme.of(context).textTheme.labelSmall),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailSharingIconBizcardDetail extends StatelessWidget {
  const DetailSharingIconBizcardDetail(
      {super.key, required this.image, required this.onTap});
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius5,
          color: kblack,
        ),
        height: kwidth * 0.13,
        width: kwidth * 0.13,
        child: Image.asset(image),
      ),
    );
  }
}
