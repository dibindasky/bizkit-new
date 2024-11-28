import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.name,
      this.designation,
      this.ontap,
      this.logo,
      this.companyName});

  final String? name;
  final String? designation;
  final VoidCallback? ontap;
  final String? logo;
  final String? companyName;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
      
          children: [
          
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Center(
                child: Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(dummyPersonImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: (logo?.isNotEmpty ?? false)
                      ? NetworkImageWithLoader(
                          logo!,
                          radius: 100,
                          errorWidget: const Icon(
                            Icons.person,
                            color: kwhite,
                            size: 30,
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20 ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  adjustHieght(10.h),
                  Text(
                    name ?? 'name',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  adjustHieght(5.h),
                  Text(
                    textAlign: TextAlign.center,
                    designation ?? 'designation',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
                  ),
                  adjustHieght(4.h),
                  Text(
                    textAlign: TextAlign.center,
                    companyName ?? 'Company',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
                  ),
                  adjustHieght(10.h),
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: ontap,
                icon: const Icon(
                  Icons.more_vert,
                  color: kwhite,
                )),
          ],
        ));
  }
}
