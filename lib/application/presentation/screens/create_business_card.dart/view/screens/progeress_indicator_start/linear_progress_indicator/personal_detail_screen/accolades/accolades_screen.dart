import 'dart:convert';

import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_create_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/widgets/image_preview.dart';
import 'package:bizkit/domain/model/card/card/accolade/accolade.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccolodesScreen extends StatefulWidget {
  const AccolodesScreen(
      {super.key, this.accolade = true, required this.cardId});

  final bool? accolade;
  final int cardId;

  @override
  State<AccolodesScreen> createState() => _AccolodesScreenState();
}

class _AccolodesScreenState extends State<AccolodesScreen> {
  final dateController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: AppbarCommen(
          tittle: widget.accolade == null
              ? 'Achivement'
              : widget.accolade!
                  ? 'Accolades'
                  : 'Accredition',
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
                      "Add your achievements here for people to know about you",
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
                            builder: (context) => AccoladesAddCreateScreen(
                                accolade: widget.accolade!,
                                cardId: widget.cardId),
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
                  return InkWell(
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
                      padding: const EdgeInsets.only(left: 10, right: 12),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: kgrey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              dateController.text.isEmpty
                                  ? 'Sort By Date '
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
                                      borderRadius: BorderRadius.circular(50),
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
                  );
                });
              }),
              adjustHieght(khieght * .04),
              BlocBuilder<BusinessDataBloc, BusinessDataState>(
                builder: (context, business) {
                  return BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, user) {
                      List achivement = widget.accolade ?? true
                          ? user.accolades
                          : business.accreditions;
                      if (dateController.text != '') {
                        achivement = achivement
                            .where((element) =>
                                element.date as String ==
                                dateController.text.trim())
                            .toList();
                      }
                      if (achivement.isEmpty && dateController.text != '') {
                        return Text(
                            'No Achivements found in ${dateController.text}');
                      }
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            adjustHieght(kwidth * .03),
                        itemCount: achivement.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 260,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      fadePageRoute(ScreenImagePreview(
                                          image: (widget.accolade == null
                                                  ? achivement[index]
                                                          is Accolade
                                                      ? achivement[index]
                                                          .accoladesImage
                                                      : achivement[index].image
                                                  : widget.accolade!
                                                      ? user.accolades[index]
                                                          .accoladesImage
                                                      : business
                                                          .accreditions[index]
                                                          .images?[0]
                                                          .image)
                                              .substring(22),
                                          isFileIamge: false))),
                                  child: SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: Image.memory(
                                      base64.decode((widget.accolade == null
                                              ? achivement[index] is Accolade
                                                  ? achivement[index]
                                                      .accoladesImage
                                                  : achivement[index].image
                                              : widget.accolade!
                                                  ? user.accolades[index]
                                                      .accoladesImage
                                                  : business.accreditions[index]
                                                      .images?[0].image)
                                          .substring(22)),
                                      fit: BoxFit.cover,
                                    ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.accolade == null
                                              ? achivement[index] is Accolade
                                                  ? achivement[index].accolades
                                                  : achivement[index].label
                                              : widget.accolade!
                                                  ? user.accolades[index]
                                                          .accolades ??
                                                      ''
                                                  : business.accreditions[index]
                                                          .label ??
                                                      '',
                                          style: textStyle1.copyWith(
                                            fontSize: kwidth * .04,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          widget.accolade == null
                                              ? achivement[index] is Accolade
                                                  ? achivement[index]
                                                      .accoladesDescription
                                                  : achivement[index]
                                                      .description
                                              : widget.accolade!
                                                  ? user.accolades[index]
                                                          .accoladesDescription ??
                                                      ''
                                                  : business.accreditions[index]
                                                          .description ??
                                                      '',
                                          style: textStyle1.copyWith(
                                            fontSize: kwidth * .03,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                widget.accolade == null
                                    ? const SizedBox()
                                    : Positioned(
                                        right: 10,
                                        top: 10,
                                        child: CircleAvatar(
                                          child: IconButton(
                                            onPressed: () {
                                              showCustomConfirmationDialogue(
                                                  context: context,
                                                  title:
                                                      'Are you sure want to delete ?',
                                                  buttonText: 'Delete',
                                                  onTap: () {
                                                    widget.accolade!
                                                        ? context
                                                            .read<
                                                                UserDataBloc>()
                                                            .add(
                                                              UserDataEvent
                                                                  .removeAccolade(
                                                                      id: user
                                                                          .accolades[
                                                                              index]
                                                                          .id!),
                                                            )
                                                        : context
                                                            .read<
                                                                BusinessDataBloc>()
                                                            .add(
                                                              BusinessDataEvent
                                                                  .removeAccredition(
                                                                      id: business
                                                                          .accreditions[
                                                                              index]
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
                          );
                        },
                      );
                    },
                  );
                },
              ),
              adjustHieght(khieght * .03),
              widget.accolade == null
                  ? const SizedBox()
                  : AuthButton(
                      hieght: 48,
                      text: 'Continue',
                      onTap: () => Navigator.of(context).pop(),
                    ),
              adjustHieght(khieght * .02),
            ],
          ),
        ),
      ),
    );
  }
}
