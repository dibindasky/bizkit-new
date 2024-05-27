import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddParticipentBottomSheet extends StatelessWidget {
  const AddParticipentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: 500.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          kHeight20,
          Text('Add Participants', style: fontPopinsMedium),
          Divider(
            color: lightGrey,
          ),
          TaskTextField(
              hintText: 'Find your task',
              showBorder: true,
              fillColor: textFieldFillColr,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: neonShade))),
          adjustHieght(20.h),
          Expanded(
            child: ListView.separated(
              itemCount: 30,
              separatorBuilder: (context, index) => Divider(
                endIndent: 30.w,
                indent: 50.w,
                height: 0,
                color: kgrey,
                thickness: 0,
              ),
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(imageDummyAsset),
                ),
                title: const Text('User Name'),
                subtitle: Text('useremail@gmail.com',
                    style: fontPopinsThin.copyWith(
                      fontSize: 10.sp,
                    )),
                trailing: GestureDetector(
                  onTap: () {
                    // handle user add and removel from task
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.w),
                      decoration: BoxDecoration(
                          gradient: index % 2 == 0 ? neonShadeGradient : null,
                          borderRadius: kBorderRadius5,
                          border: Border.all(color: neonShade)),
                      child: Text(index % 2 == 0 ? 'Remove' : 'Add',
                          style: fontPopinsThin.copyWith(fontSize: 10.sp))),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
