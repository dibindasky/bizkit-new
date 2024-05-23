import 'dart:convert';

import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/accolades_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/achivement_detail_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/accolade/accolade.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/accredition/accredition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchivementsScreen extends StatefulWidget {
  const AchivementsScreen({super.key, this.isPreview = true});

  final bool isPreview;

  @override
  State<AchivementsScreen> createState() => _AchivementsScreenState();
}

class _AchivementsScreenState extends State<AchivementsScreen> {
  final eventController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: const AppbarCommen(
          tittle: 'Achievement',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<CardBloc, CardState>(
            builder: (context, state) {
              return BlocBuilder<BusinessDataBloc, BusinessDataState>(
                builder: (context, business) {
                  return BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, user) {
                      for (Accolade acc in state.anotherCard?.accolades ?? []) {
                        print('Accolade ==> ${acc.toJson()}');
                      }
                      for (Accredition acc
                          in state.anotherCard?.accreditation ?? []) {
                        print('Accredition ==> ${acc.toJson()}');
                      }
                      List achivement = widget.isPreview
                          ? [...user.accolades, ...business.accreditions]
                          : [
                              ...state.anotherCard?.accolades ?? [],
                              ...state.anotherCard?.accreditation ?? [],
                            ];
                      if (achivement.isEmpty) {
                        return Center(child: Image.asset(emptyNodata2));
                      }
                      if (dateController.text != '') {
                        achivement = achivement
                            .where((element) =>
                                element.date == dateController.text)
                            .toList();
                      }
                      if (eventController.text != 'All' &&
                          eventController.text != 'Others' &&
                          eventController.text != '') {
                        achivement = achivement
                            .where((element) =>
                                element.event == eventController.text)
                            .toList();
                      } else if (eventController.text == 'Others') {
                        achivement = achivement
                            .where((element) =>
                                !achivementEvents.contains(element.event))
                            .toList();
                      }

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () => showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return DatePickingBottomSheet(
                                          // initialDate: DateTime.now(),
                                          year: 500,
                                          last: 500,
                                          onPressed: (date) {
                                            dateController.text = date;
                                            setState(() {});
                                          },
                                          datePicker: dateController,
                                        );
                                      },
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 12),
                                      height: 50,
                                      // width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: kgrey),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              dateController.text.isEmpty
                                                  ? 'Date '
                                                  : dateController.text,
                                              style: dateController.text.isEmpty
                                                  ? const TextStyle(
                                                      color: kwhite)
                                                  : const TextStyle(
                                                      color: kwhite),
                                            ),
                                          ),
                                          dateController.text != ''
                                              ? InkWell(
                                                  onTap: () => setState(() {
                                                    dateController.text = '';
                                                  }),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: const ColoredBox(
                                                          color: neonShade,
                                                          child: Icon(
                                                            Icons.close,
                                                            color: kblack,
                                                          ))),
                                                )
                                              : const Icon(
                                                  Icons.calendar_month,
                                                  color: neonShade,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                adjustWidth(20),
                                Expanded(
                                    child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 12),
                                  height: 50,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kgrey),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CustomDropDown(
                                      title: 'Event',
                                      icon: Icons.sort,
                                      items: const [
                                        ...achivementEvents,
                                        'Others',
                                        'All'
                                      ],
                                      onTap: (value) {
                                        eventController.text = value ?? '';
                                        setState(() {});
                                      }),
                                ))
                              ],
                            ),
                            adjustHieght(30),
                            achivement.isEmpty
                                ? const Center(
                                    child: Text('No Achivements found'),
                                  )
                                : ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        adjustHieght(kwidth * .09),
                                    itemCount: achivement.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                achivement.length == index + 1
                                                    ? 20
                                                    : 0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                fadePageRoute(
                                                    ScreenAchivementDetail(
                                                  accolade: achivement[index]
                                                          is Accolade
                                                      ? achivement[index]
                                                          as Accolade
                                                      : null,
                                                  accredition: achivement[index]
                                                          is Accredition
                                                      ? achivement[index]
                                                          as Accredition
                                                      : null,
                                                )));
                                          },
                                          child: SizedBox(
                                            height: 250,
                                            width: double.infinity,
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: 230,
                                                  width: double.infinity,
                                                  child: Image.memory(
                                                    base64.decode((achivement[
                                                                    index]
                                                                is Accolade
                                                            ? achivement[index]
                                                                .images[0]
                                                                .image
                                                            : achivement[index]
                                                                .images[0]
                                                                .image)
                                                        .substring(22)),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    color:
                                                        kblack.withOpacity(.5),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          achivement[index]
                                                                  is Accolade
                                                              ? achivement[
                                                                      index]
                                                                  .accolades
                                                              : achivement[
                                                                      index]
                                                                  .label,
                                                          style: textStyle1
                                                              .copyWith(
                                                            fontSize:
                                                                kwidth * .04,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        Text(
                                                          achivement[index]
                                                                  is Accolade
                                                              ? achivement[
                                                                      index]
                                                                  .accoladesDescription
                                                              : achivement[
                                                                      index]
                                                                  .description,
                                                          style: textStyle1
                                                              .copyWith(
                                                            fontSize:
                                                                kwidth * .03,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          )),
    );
  }
}
