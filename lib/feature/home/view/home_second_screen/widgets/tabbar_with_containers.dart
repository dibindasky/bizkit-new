import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/bank_person_achived.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/show_model_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarHomeScreen extends StatelessWidget {
  const TabBarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(),
              child: TabBar(
                dividerHeight: 0,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(6, 199, 172, 1),
                      Color.fromRGBO(6, 199, 172, 1),
                      Color.fromRGBO(6, 199, 172, .34),
                    ],
                  ),
                ),
                tabs: const [
                  SizedBox(
                    width: 120,
                    child: Tab(
                      child: Text(
                        "History/Log",
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Tab(
                      child: Text(
                        "Profile",
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      child: ListView(
                        children: [
                          historyLog(
                            'asset/images/meeting profile png1.png',
                            '1-10-23 | 11:40 AM',
                            'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
                          ),
                          historyLog(
                            'asset/images/meeting profile png2.png',
                            '22-10-23 | 1:40 PM',
                            'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
                          ),
                          historyLog(
                            'asset/images/meeting profile png3.png',
                            '16-10-23 | 7:40 PM',
                            'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
                          ),
                          historyLog(
                            'asset/images/meeting profile png4.png',
                            '19-10-23 | 5:40 PM',
                            'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => bottomSheet(context),
                                child: Container(
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      color: textFieldFillColr),
                                  child: Image.asset(
                                      'asset/images/preview phone.png'),
                                ),
                              ),
                              rowItems(
                                  asset:
                                      'asset/images/preview messages gif.gif'),
                              rowItems(asset: 'asset/images/preview globe.gif'),
                              rowItems(
                                  asset: 'asset/images/preview_spinner.png'),
                              rowItems(
                                  asset:
                                      'asset/images/preview location gif.gif'),
                            ],
                          ),
                          adjustHieght(khieght * .01),
                          const BankPersonAchivedRows(
                            first: 'asset/images/banking.png',
                            scnd: 'asset/images/persona.png',
                            third: 'asset/images/achieved.png',
                          ),
                          adjustHieght(khieght * .02),
                          Container(
                            decoration: const BoxDecoration(
                              color: textFieldFillColr,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            width: double.infinity,
                            height: 140,
                            child: Column(
                              children: [
                                adjustHieght(khieght * .01),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Products / Brands'),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: neonShade,
                                        ),
                                        child: const Icon(
                                            Icons.arrow_right_outlined),
                                      ),
                                    ],
                                  ),
                                ),
                                adjustHieght(khieght * .01),
                                SizedBox(
                                  width: double.infinity,
                                  height: 80,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      List listImages = [
                                        'asset/images/preview image 0.png',
                                        'asset/images/preview list image 2.png',
                                        'asset/images/preview list image 3.png',
                                        'asset/images/previewlist image 1.png',
                                        'asset/images/preview list image 3.png',
                                        'asset/images/preview list image 2.png',
                                      ];
                                      return SizedBox(
                                        width: 75.dm,
                                        height: 80.dm,
                                        child: Image.asset(
                                          listImages[index],
                                        ),
                                      );
                                    },
                                    itemCount: 6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          adjustHieght(khieght * .02),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rowItems({required String asset}) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Color.fromRGBO(53, 53, 53, 0.42),
      ),
      height: 40,
      child: Image.asset(asset),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ModelSheetItems(),
    );
  }

  Widget historyLog(String image, String date, String detail) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(image),
              adjustWidth(kwidth * .004),
              Text(
                date,
                style: TextStyle(fontSize: 11.sp),
              ),
            ],
          ),
          adjustHieght(khieght * .006),
          Text(
            detail,
            style: TextStyle(fontSize: 11.sp),
          ),
        ],
      ),
    );
  }
}
