import 'dart:convert';

import 'package:bizkit/module/biz_card/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/achevements/accolades_create_screen.dart';
import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/accolade/accolade.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/accredition/accredition.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccolodesScreen extends StatefulWidget {
  const AccolodesScreen({super.key, this.accolade = true});

  final bool? accolade;
  //final int cardId;

  @override
  State<AccolodesScreen> createState() => _AccolodesScreenState();
}

class _AccolodesScreenState extends State<AccolodesScreen> {
  final dateController = TextEditingController(text: '');
  final eventController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: CardAppbarCommen(
          tittle: widget.accolade == null
              ? 'Achivement'
              : widget.accolade!
                  ? 'Personal Achievements'
                  : 'Company Achievements',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.accolade == null
                  ? const SizedBox()
                  : Text(
                      "Add your ${widget.accolade == null ? '' : widget.accolade! ? 'Personal' : 'Company'} Achievements here for people to know about you",
                      style: TextStyle(fontSize: kwidth * .043),
                    ),
              widget.accolade == null
                  ? const SizedBox()
                  : adjustHieght(khieght * .02),
              widget.accolade == null
                  ? const SizedBox()
                  : Center(
                      child: InkWell(
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const AccoladesAddCreateScreen(),
                          ));
                        },
                        child: DottedBorder(
                          dashPattern: const [8, 8],
                          color: neonShade,
                          strokeWidth: 2.5,
                          child: SizedBox(
                            width: double.infinity,
                            height: kwidth * 0.25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 32.dm,
                                  height: 32.dm,
                                  child: const CircleAvatar(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                                Text(
                                  'Add Achievements',
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              adjustHieght(khieght * .04),
              BlocBuilder<BusinessDataBloc, BusinessDataState>(
                  builder: (context, business) {
                return BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, user) {
                  bool achivement = (widget.accolade ?? true
                          ? user.accolades
                          : business.accreditions)
                      .isEmpty;
                  if (achivement) {
                    return const SizedBox();
                  }
                  return SizedBox(
                    height: 50,
                    child: Row(
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 12),
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
                                          ? const TextStyle(color: kwhite)
                                          : const TextStyle(color: kwhite),
                                    ),
                                  ),
                                  dateController.text != ''
                                      ? InkWell(
                                          onTap: () => setState(() {
                                            dateController.text = '';
                                          }),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
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
                          padding: const EdgeInsets.only(left: 10, right: 12),
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
                  );
                });
              }),
              adjustHieght(khieght * .04),
              BlocBuilder<BusinessDataBloc, BusinessDataState>(
                builder: (context, business) {
                  return BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, user) {
                      List<Accolade> accolade =
                          widget.accolade ?? true ? user.accolades : [];
                      List<Accredition> accredition =
                          widget.accolade ?? true ? [] : business.accreditions;
                      if (dateController.text != '') {
                        accolade = accolade
                            .where((element) =>
                                element.date == dateController.text.trim())
                            .toList();
                        accredition = accredition
                            .where((element) =>
                                element.date == dateController.text.trim())
                            .toList();
                      }
                      if (eventController.text != '') {
                        accolade = accolade.where((element) {
                          if (eventController.text == 'All') return true;
                          if (eventController.text == element.event) {
                            return true;
                          } else if (eventController.text == 'Others' &&
                              !achivementEvents
                                  .contains(eventController.text)) {
                            return true;
                          }
                          return false;
                        }).toList();
                        accredition = accredition.where((element) {
                          if (eventController.text == 'All') return true;
                          if (eventController.text == element.event) {
                            return true;
                          } else if (eventController.text == 'Others' &&
                              !achivementEvents
                                  .contains(eventController.text)) {
                            return true;
                          }
                          return false;
                        }).toList();
                      }
                      if (widget.accolade == true && accolade.isEmpty) {
                        return const Text('No Personal Achivements found');
                      }
                      if (widget.accolade == false && accredition.isEmpty) {
                        return const Text('No Business Achivements found');
                      }
                      return AchivementListViewCreation(
                        accolades: widget.accolade == true ? accolade : null,
                        accreditions:
                            widget.accolade == true ? null : accredition,
                        cardId: user.currentCard!.id!,
                      );
                    },
                  );
                },
              ),
              adjustHieght(khieght * .03),
              // EventButton(
              //   hieght: 48,
              //   text: 'Continue',
              //   onTap: () => Navigator.of(context).pop(),
              // ),
              adjustHieght(khieght * .02),
            ],
          ),
        ),
      ),
    );
  }
}

class AchivementListViewCreation extends StatelessWidget {
  const AchivementListViewCreation(
      {super.key, this.accolades, this.accreditions, required this.cardId});

  final List<Accolade>? accolades;
  final List<Accredition>? accreditions;
  final int cardId;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => adjustHieght(kwidth * .03),
      itemCount: accolades != null
          ? accolades!.length
          : accreditions != null
              ? accreditions!.length
              : 0,
      key: UniqueKey(),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (accolades != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AccoladesAddCreateScreen(accolade: accolades![index]),
                  ));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccoladesAddCreateScreen(
                        accredition: accreditions![index]),
                  ));
            }
          },
          child: SizedBox(
            height: 260,
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.memory(
                    base64.decode((accolades != null
                            ? accolades![index].images![0].image!
                            : accreditions![index].images![0].image!)
                        .substring(22)),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    color: kblack.withOpacity(.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          accolades != null
                              ? accolades![index].accolades ?? ''
                              : accreditions![index].label ?? '',
                          style: textStyle1.copyWith(
                            fontSize: kwidth * .04,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          accolades != null
                              ? accolades![index].accoladesDescription ?? ''
                              : accreditions![index].description ?? '',
                          style: textStyle1.copyWith(
                            fontSize: kwidth * .03,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                accolades != null
                    ? const SizedBox()
                    : Positioned(
                        right: 10,
                        top: 10,
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              showCustomConfirmationDialogue(
                                  context: context,
                                  title: 'Are you sure want to delete ?',
                                  buttonText: 'Delete',
                                  onTap: () {
                                    accolades != null
                                        ? context.read<UserDataBloc>().add(
                                              UserDataEvent.removeAccolade(
                                                  id: accolades![index].id!),
                                            )
                                        : context.read<BusinessDataBloc>().add(
                                              BusinessDataEvent
                                                  .removeAccredition(
                                                      id: accreditions![index]
                                                          .id!),
                                            );
                                  });
                            },
                            icon: const Icon(
                              Icons.delete,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.title,
      required this.icon,
      this.showError = false,
      required this.items,
      required this.onTap});
  final String title;
  final bool showError;
  final IconData icon;
  final List<String> items;
  final Function(String? value) onTap;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  void initState() {
    title = widget.title;
    super.initState();
  }

  String title = '';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton(
            hint: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(color: kwhite)),
              ],
            ),
            items: widget.items.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  onTap: () => setState(() {
                    title = value;
                  }),
                  value: value,
                  child: Text(
                    value,
                    // style: textHeadSemiBold1.copyWith(
                    //   fontSize: sWidth * 0.04,
                    // ),
                  ),
                );
              },
            ).toList(),
            onChanged: widget.onTap));
  }
}
