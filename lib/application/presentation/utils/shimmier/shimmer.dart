import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    Key? key,
    required this.itemCount,
    required this.height,
    required this.width,
    this.seprator = const SizedBox(),
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  final int itemCount;
  final double height;
  final double width;
  final Axis scrollDirection;
  final Widget seprator;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => seprator,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 54, 54, 54),
          highlightColor: const Color.fromARGB(255, 85, 85, 85),
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
  const ShimmerLoaderTile({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 54, 54, 54),
      highlightColor: const Color.fromARGB(255, 85, 85, 85),
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
