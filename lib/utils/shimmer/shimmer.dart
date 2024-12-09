import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/add_connection_tail.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridView extends StatelessWidget {
  const ShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: ConnectionTile(index: 0),
        baseColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        highlightColor: Theme.of(context).scaffoldBackgroundColor);
  }
}

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    Key? key,
    required this.itemCount,
    required this.height,
    required this.width,
    this.highlightColor,
    this.baseColor,
    this.seprator = const SizedBox(),
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  final int itemCount;
  final double height;
  final double width;
  final Axis scrollDirection;
  final Widget seprator;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => seprator,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: baseColor ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          highlightColor:
              baseColor ?? Theme.of(context).scaffoldBackgroundColor,
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              color: klightgrey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        );
      },
    );
  }
}

class ShimmerLoaderTile extends StatelessWidget {
  const ShimmerLoaderTile(
      {Key? key,
      this.height,
      this.width,
      this.baseColor,
      this.boxDecoration = const BoxDecoration(
        color: klightgrey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      this.highlightColor})
      : super(key: key);

  final double? width;
  final double? height;
  final Color? baseColor;
  final Color? highlightColor;
  final BoxDecoration? boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // baseColor: baseColor ?? const Color.fromARGB(255, 54, 54, 54),
      // highlightColor: highlightColor ?? const Color.fromARGB(255, 85, 85, 85),
      baseColor:
          baseColor ?? Theme.of(context).colorScheme.secondary.withOpacity(0.3),
      highlightColor: baseColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: height,
        width: width,
        decoration: boxDecoration,
      ),
    );
  }
}

class ShimmerLoaderSearchParticipants extends StatelessWidget {
  const ShimmerLoaderSearchParticipants({
    Key? key,
    required this.itemCount,
    required this.height,
    required this.width,
    this.highlightColor,
    this.baseColor,
    this.seprator = const SizedBox(),
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  final int itemCount;
  final double height;
  final double width;
  final Axis scrollDirection;
  final Widget seprator;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => seprator,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: baseColor ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          highlightColor:
              baseColor ?? Theme.of(context).scaffoldBackgroundColor,
          child: const ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(personDemoImg),
            ),
            title: ShimmerLoaderTile(
              height: 10,
              width: 5,
            ),
            subtitle: ShimmerLoaderTile(
              height: 10,
              width: 5,
            ),
            trailing: ShimmerLoaderTile(
              height: 30,
              width: 45,
            ),
          ),
        );
      },
    );
  }
}

class ShimmerLoaderTaskContainer extends StatelessWidget {
  const ShimmerLoaderTaskContainer({
    Key? key,
    required this.itemCount,
    required this.height,
    required this.width,
    this.highlightColor,
    this.baseColor,
    this.seprator = const SizedBox(),
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  final int itemCount;
  final double height;
  final double width;
  final Axis scrollDirection;
  final Widget seprator;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => seprator,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: baseColor ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          highlightColor:
              baseColor ?? Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: kBorderRadius15,
                  border: Border.all(
                      width: 3, color: const Color.fromARGB(255, 85, 85, 85))),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const ShimmerLoaderTile(
                          height: 13,
                          width: 120,
                        ),
                        adjustWidth(30),
                        Column(
                          children: [
                            const ShimmerLoaderTile(
                              height: 6,
                              width: 6,
                            ),
                            adjustHieght(1),
                            const ShimmerLoaderTile(
                              height: 6,
                              width: 6,
                            ),
                            adjustHieght(1),
                            const ShimmerLoaderTile(
                              height: 6,
                              width: 6,
                            ),
                          ],
                        )
                      ],
                    ),
                    adjustHieght(15),
                    const ShimmerLoaderTile(
                      height: 7,
                      width: 55,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShimmerLoaderCircle extends StatelessWidget {
  const ShimmerLoaderCircle({
    Key? key,
    required this.itemCount,
    this.highlightColor,
    this.baseColor,
    required this.radius,
    this.seprator = const SizedBox(),
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  final int itemCount;
  final Axis scrollDirection;
  final Widget seprator;
  final Color? baseColor;
  final double radius;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => seprator,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: baseColor ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          highlightColor:
              baseColor ?? Theme.of(context).scaffoldBackgroundColor,
          child: CircleAvatar(
            radius: radius,
          ),
        );
      },
    );
  }
}

class BizcardShimmer extends StatelessWidget {
  const BizcardShimmer({
    super.key,
    this.baseColor,
  });
  final Color? baseColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:
          baseColor ?? Theme.of(context).colorScheme.secondary.withOpacity(0.3),
      highlightColor: baseColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Container(
              width: 362.w,
              height: 260.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: kBorderRadius20,
              ),
            ),
            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (index) => Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            // Stats Containers Shimmer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                2,
                (index) => Expanded(
                  child: Container(
                    height: 30.h,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
