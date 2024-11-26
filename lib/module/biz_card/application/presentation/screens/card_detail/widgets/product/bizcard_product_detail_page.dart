import 'dart:developer';

import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:bizkit/utils/animations/pageview_animated_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BizcardProductDetailScreen extends StatefulWidget {
  const BizcardProductDetailScreen({super.key, this.product});
  final Product? product;

  @override
  State<BizcardProductDetailScreen> createState() =>
      _BizcardProductDetailScreenState();
}

class _BizcardProductDetailScreenState
    extends State<BizcardProductDetailScreen> {
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    log('Product details == > ${widget.product?.toJson()}');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.onTertiary,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                      ),
                    ),
                  ),
                  adjustWidth(30.w),
                  Text(
                    widget.product?.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 15),
                  )
                ],
              ),
              adjustHieght(20.h),
              SizedBox(
                height: 220.h,
                child: PagviewAnimateBuilder(
                  pageController: pageController,
                  pageValue: pageValue,
                  pageCount: widget.product?.images != null
                      ? widget.product?.images?.length ?? 0
                      : 0,
                  onpageCallBack: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: (index, context) {
                    return Card(
                      elevation: 1,
                      child: NetworkImageWithLoader(
                          fit: BoxFit.cover,
                          widget.product?.images?[index] ?? ''),
                    );
                  },
                ),
              ),
              adjustHieght(30.h),
              Text(
                widget.product?.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 15),
              ),
              adjustHieght(10.h),
              Text(
                widget.product?.description ?? '',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
