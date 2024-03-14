import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileItem extends StatelessWidget {
  const TileItem({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        splashColor: kblack,
        onTap: onTap,
        child: SizedBox(
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 12.sp),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                  color: kwhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
