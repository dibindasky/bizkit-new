import 'package:bizkit/core/model/bizcard_id_parameter_model/bizcard_id_parameter_model.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/widgets/bizcard_views_list_popup.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/bizcard_widget.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_all_cards/bizcard.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key, required this.bizcard});

  final Bizcard bizcard;

  @override
  Widget build(BuildContext context) {
    final bizcardController = Get.find<CardController>();
    return Column(
      children: [
        Center(
          child: BizcardWidget(
            bizcardId: bizcard.bizcardId ?? "",
            onTap: () {
              GoRouter.of(context).pushNamed(Routes.cardDetailView,
                  pathParameters: {
                    'cardId': '66d1acb6128a4e4cb982580f',
                    'myCard': 'true'
                  });
            },
            width: 362.w,
            height: 260.h,
            designation: bizcard.designation ?? 'Designation',
            name: bizcard.name ?? 'Name',
            personImage: personDemoImg,
            qrScanner: bizcard.qRLink ?? "",
          ),
        ),
        adjustHieght(10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        bizcardEditIcon,
                        width: 30,
                      ),
                      adjustHieght(3.h),
                      Text(
                        'Edit',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        bizcardPreviewIcon,
                        width: 30,
                      ),
                      adjustHieght(3.h),
                      Text(
                        'Preview',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        bizcardShareIcon,
                        width: 30,
                      ),
                      adjustHieght(3.h),
                      Text(
                        'Share',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        adjustHieght(15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (bizcard.views != 0) {
                    bizcardController.fetchCardViews(
                      bizcardIdParameterModel: BizcardIdParameterModel(
                          bizcardId: bizcard.bizcardId ?? ''),
                    );
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      showDragHandle: true,
                      backgroundColor: kblack,
                      builder: (context) => const BizCardViewsListPopUp(),
                    );
                  }
                },
                child: Container(
                  height: 30.h,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: kBorderRadius10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.remove_red_eye_outlined),
                      Text(
                        '${bizcard.views ?? 0}',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        'views',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ),
            ),
            adjustWidth(5.w),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30.h,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: kBorderRadius10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.share_outlined),
                      Text(
                        '2,110',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        'shared',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
