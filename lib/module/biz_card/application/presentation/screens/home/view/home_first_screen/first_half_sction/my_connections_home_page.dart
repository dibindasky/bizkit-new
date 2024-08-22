import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/card_detail_view.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/add_connection_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/view_all_connection_contacts.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/show_case_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardMyConnectionContainerHomePage extends StatelessWidget {
  const CardMyConnectionContainerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context
      //     .read<ConnectionRequestBloc>()
      //     .add(const ConnectionRequestEvent.getBizkitConnections(query: ''));
    });
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My connections', style: textHeadStyle1),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      cardFadePageRoute(const MyConnectionsViewAllContacts()));
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(1)),
                  child: ColoredBox(
                    color: backgroundColour,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: CustomShowCaseView(
                        image: personImage,
                        globalKey: globalKeyViewAllConnections,
                        tittle: 'View your added conecctions',
                        description: '',
                        child: Text(
                          'View All',
                          style: textThinStyle1.copyWith(
                              decorationColor: kwhite,
                              decorationThickness: 1.5,
                              color: kwhite,
                              fontSize: 10.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        adjustHieght(khieght * .03),
        SizedBox(
          width: double.infinity,
          height: 75,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => adjustWidth(kwidth * .02),
            itemCount: 3,
            //  state.bizkitConnections?.length == null
            //     ? 1
            //     : state.bizkitConnections!.length + 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              //BizkitConnection data = BizkitConnection();
              // if (index != 0) {
              //   data = state.bizkitConnections![index - 1];
              // }
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          cardFadePageRoute(const ScreenCardAddConnections()));
                    },
                    child: CustomShowCaseView(
                      description: '',
                      globalKey: globalKeyaddConnections,
                      tittle: 'Start Add connections from here',
                      image: '',
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ColoredBox(
                              color: textFieldFillColr,
                              child: SizedBox(
                                height: 47.h,
                                width: 50.w,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 18.h,
                                    color: kwhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(child: Text('Add')),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context, cardFadePageRoute(const ScreenCardDetailView()));
                },
                child: Column(
                  children: [
                    Expanded(
                        child: Image.asset(dummyPersonImage,
                            height: 30.h, width: 50.w)),
                    const Text('Name',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
