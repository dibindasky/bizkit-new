import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
          baseColor: baseColor ?? const Color.fromARGB(255, 54, 54, 54),
          highlightColor:
              highlightColor ?? const Color.fromARGB(255, 85, 85, 85),
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
      required this.height,
      required this.width,
      this.baseColor,
      this.highlightColor})
      : super(key: key);

  final double height;
  final double width;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? const Color.fromARGB(255, 54, 54, 54),
      highlightColor: highlightColor ?? const Color.fromARGB(255, 85, 85, 85),
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: klightgrey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
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
          baseColor: baseColor ?? const Color.fromARGB(255, 54, 54, 54),
          highlightColor:
              highlightColor ?? const Color.fromARGB(255, 85, 85, 85),
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
          baseColor: baseColor ?? const Color.fromARGB(255, 54, 54, 54),
          highlightColor:
              highlightColor ?? const Color.fromARGB(255, 85, 85, 85),
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
                        adjustWidth(10),
                        const ShimmerLoaderTile(
                          height: 20,
                          width: 50,
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
