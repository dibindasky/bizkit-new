import 'package:bizkit/feature/card_share/view/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/core/const.dart';

class CardShareMainScreen extends StatelessWidget {
  const CardShareMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              adjustHieght(khieght * .05),
              SizedBox(
                height: 340,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    List<String> images = [
                      'asset/images/person.jpeg',
                      'asset/images/person2.jpeg',
                      'asset/images/person3.jpeg',
                      'asset/images/person4.jpeg',
                      'asset/images/person5.jpeg',
                    ];
                    return Container(
                      decoration: BoxDecoration(
                        color: textFieldFillColr,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 300,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: 300,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 10,
                                child: PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.more_vert,
                                    size: 35,
                                    color: kblack,
                                  ),
                                  onSelected: (value) {
                                    if (value == 'Add Tag') {}
                                    print('Selected: $value');
                                  },
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 'Edit Card',
                                      child: Text('Edit Card'),
                                    ),
                                    const PopupMenuItem(
                                      value: 'Archive',
                                      child: Text('Archive'),
                                    ),
                                    const PopupMenuItem(
                                      value: 'Delete Card',
                                      child: Text('Delete Card'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          adjustHieght(khieght * .02),
                          Row(
                            children: [
                              adjustWidth(kwidth * .02),
                              Text(
                                'Business card',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () =>
                                    bottomSheet(context, images[index]),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: kblue,
                                  ),
                                  width: 100,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      'Share',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              adjustWidth(kwidth * .02)
                            ],
                          ),
                          adjustHieght(khieght * .02),
                          Row(
                            children: [
                              adjustWidth(kwidth * .02),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kwhite),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      adjustWidth(kwidth * .01),
                                      const Icon(
                                        Icons.remove_red_eye,
                                        size: 19,
                                        color: kwhite,
                                      ),
                                      adjustWidth(kwidth * .01),
                                      const Text('3,24,300'),
                                      adjustWidth(kwidth * .01),
                                      const Expanded(child: Text('views')),
                                    ],
                                  ),
                                ),
                              ),
                              adjustWidth(kwidth * .04),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kwhite),
                                  ),
                                  child: Row(
                                    children: [
                                      adjustWidth(kwidth * .01),
                                      const Icon(
                                        Icons.share,
                                        color: kwhite,
                                        size: 19,
                                      ),
                                      adjustWidth(kwidth * .01),
                                      const Expanded(child: Text('3,24,300')),
                                      const Text('views'),
                                      adjustWidth(kwidth * .01),
                                    ],
                                  ),
                                ),
                              ),
                              adjustWidth(kwidth * .02),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      adjustWidth(kwidth * .05),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bottomSheet(BuildContext context, String image) {
    showBottomSheet(
      context: context,
      builder: (context) => CustomBottomSheet(
        image: image,
      ),
    );
  }
}
