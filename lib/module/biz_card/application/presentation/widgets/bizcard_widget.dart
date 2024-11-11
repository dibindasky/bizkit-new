import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BizcardWidget extends StatelessWidget {
  const BizcardWidget(
      {super.key,
      required this.designation,
      required this.name,
      required this.personImage,
      required this.qrScanner,
      required this.width,
      required this.height});

  final String personImage;
  final String qrScanner;
  final String name;
  final String designation;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius25,
        image: const DecorationImage(
          image: AssetImage(bizcardBgImage),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(1, 1),
          ),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-1, -1),
              blurRadius: 2,
              spreadRadius: 0),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              kWidth10,
              Text(
                'Business Card',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(bizcardMoreIcon),
              )
            ],
          ),
          adjustHieght(18.h),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kneon, width: 2),
              image: DecorationImage(
                image: AssetImage(personImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          adjustHieght(10.h),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          adjustHieght(4.h),
          Text(
            designation,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          adjustHieght(10.h),
          Container(
            width: 80,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(qrScanner), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
