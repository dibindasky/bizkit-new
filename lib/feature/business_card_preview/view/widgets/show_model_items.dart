import 'package:bizkit/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModelSheetItems extends StatelessWidget {
  const ModelSheetItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      color: kblack,
      child: ListView(
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 5.dm,
              width: 85,
            ),
          ),
          adjustHieght(khieght * .03),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: klightgrey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      adjustWidth(kwidth * .03),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Mobile number'),
                          Text('+91 0000 0000 00'),
                        ],
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        backgroundColor: textFieldFillColr,
                        radius: 10,
                        backgroundImage:
                            AssetImage('asset/images/copy number image.png'),
                      ),
                      adjustWidth(kwidth * .08),
                      const CircleAvatar(
                        backgroundColor: textFieldFillColr,
                        radius: 10,
                        backgroundImage:
                            AssetImage('asset/images/phone image.png'),
                      ),
                      adjustWidth(kwidth * .04),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
