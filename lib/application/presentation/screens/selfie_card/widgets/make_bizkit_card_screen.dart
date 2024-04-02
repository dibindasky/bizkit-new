import 'dart:convert';

import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/card_second/card_second_create_request_model/card_second_create_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardSecondScannedDatas extends StatelessWidget {
  const CardSecondScannedDatas({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: adjustWidth(0),
          title: const Text(
            'Make a Bizkit Card',
            style: TextStyle(
                fontFamily: 'Euclid',
                fontWeight: FontWeight.bold,
                color: kwhite),
          ),
          backgroundColor: knill,
        ),
        body: BlocBuilder<CardSecondBloc, CardSecondState>(
          builder: (context, state) {
            return ListView(
              children: [
                Container(
                  height: kwidth * 0.60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                            state.scannedImagesSecondCardCreation.first
                                .fileImage,
                          ),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Form(
                    key: context.read<CardSecondBloc>().autoFillDataKey,
                    child: Column(
                      children: [
                        adjustHieght(khieght * 0.008),
                        AutocompleteTextField(
                            autocompleteItems:
                                state.scannedImageDatasModel?.names ?? [],
                            validate: Validate.notNull,
                            label: 'Name',
                            controller:
                                context.read<CardSecondBloc>().nameController,
                            inputType: TextInputType.name),
                        AutocompleteTextField(
                          autocompleteItems:
                              state.scannedImageDatasModel?.names ?? [],
                          validate: Validate.notNull,
                          label: 'Company',
                          controller:
                              context.read<CardSecondBloc>().copanyController,
                          inputType: TextInputType.emailAddress,
                        ),
                        AutocompleteTextField(
                            autocompleteItems:
                                state.scannedImageDatasModel?.emails ?? [],
                            validate: Validate.email,
                            label: 'Email',
                            controller:
                                context.read<CardSecondBloc>().emailController,
                            inputType: TextInputType.emailAddress),
                        AutocompleteTextField(
                            maxLength: 10,
                            autocompleteItems:
                                state.scannedImageDatasModel?.phone ?? [],
                            validate: Validate.phone,
                            label: 'Phone number',
                            controller:
                                context.read<CardSecondBloc>().phoneController,
                            inputType: TextInputType.number),
                        AutocompleteTextField(
                          autocompleteItems:
                              state.scannedImageDatasModel?.emails ?? [],
                          validate: Validate.email,
                          label: 'Website',
                          controller:
                              context.read<CardSecondBloc>().webSiteController,
                          inputType: TextInputType.emailAddress,
                        ),
                        AutocompleteTextField(
                          autocompleteItems:
                              state.scannedImageDatasModel?.names ?? [],
                          validate: Validate.notNull,
                          label: 'Designation',
                          controller: context
                              .read<CardSecondBloc>()
                              .designationController,
                          inputType: TextInputType.name,
                        ),
                        adjustHieght(khieght * .02),
                        LastSkipContinueButtons(
                          onTap: () {
                            if (context
                                .read<CardSecondBloc>()
                                .autoFillDataKey
                                .currentState!
                                .validate()) {
                              context
                                  .read<CardSecondBloc>()
                                  .add(CardSecondEvent.autoFillTExtfieldItems(
                                    name: context
                                        .read<CardSecondBloc>()
                                        .nameController
                                        .text,
                                    scannedImage: state
                                        .scannedImagesSecondCardCreation
                                        .first
                                        .base64,
                                    email: context
                                        .read<CardSecondBloc>()
                                        .emailController
                                        .text,
                                    company: context
                                        .read<CardSecondBloc>()
                                        .copanyController
                                        .text,
                                    number: context
                                        .read<CardSecondBloc>()
                                        .phoneController
                                        .text,
                                    website: context
                                        .read<CardSecondBloc>()
                                        .webSiteController
                                        .text,
                                    designation: context
                                        .read<CardSecondBloc>()
                                        .designationController
                                        .text,
                                  ));
                              Navigator.of(context).push(
                                  fadePageRoute(const MakeABizkitCardScreen()));
                            }
                          },
                        ),
                        adjustHieght(20)
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class MakeABizkitCardScreen extends StatefulWidget {
  const MakeABizkitCardScreen({super.key});

  @override
  State<MakeABizkitCardScreen> createState() => _MakeABizkitCardScreenState();
}

class _MakeABizkitCardScreenState extends State<MakeABizkitCardScreen> {
  final GlobalKey<FormState> meetingDataKey = GlobalKey<FormState>();
  String time = '';
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: adjustWidth(0),
          title: const Text(
            'Make a Bizkit Card',
            style: TextStyle(
                fontFamily: 'Euclid',
                fontWeight: FontWeight.bold,
                color: kwhite),
          ),
          backgroundColor: knill,
        ),
        body: BlocBuilder<CardSecondBloc, CardSecondState>(
          builder: (context, state) {
            return ListView(
              children: [
                state.selfieImageModel == null
                    ? Container(
                        height: kwidth * 0.60,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asset/images/person4.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: kwidth * 0.60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(state.selfieImageModel!.fileImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Form(
                    key: meetingDataKey,
                    child: Column(
                      children: [
                        adjustHieght(khieght * 0.008),
                        TTextFormField(
                            validate: Validate.notNull,
                            text: 'Occation',
                            controller: context
                                .read<CardSecondBloc>()
                                .occationController,
                            inputType: TextInputType.name),
                        TTextFormField(
                            validate: Validate.notNull,
                            text: 'Location',
                            controller: context
                                .read<CardSecondBloc>()
                                .locatioNController,
                            inputType: TextInputType.name),
                        TTextFormField(
                            validate: Validate.notNull,
                            text: 'Occupation',
                            controller: context
                                .read<CardSecondBloc>()
                                .occupationController,
                            inputType: TextInputType.name),
                        // adjustHieght(5),
                        // InkWell(
                        //   onTap: () => showModalBottomSheet(
                        //     context: context,
                        //     isScrollControlled: true,
                        //     builder: (BuildContext context) {
                        //       return DatePickingBottomSheet(
                        //         year: 500,
                        //         last: 500,
                        //         onPressed: (date) {
                        //           setState(() {
                        //             context
                        //                 .read<CardSecondBloc>()
                        //                 .dateControler
                        //                 .text = date;
                        //           });
                        //         },
                        //         datePicker: context
                        //             .read<CardSecondBloc>()
                        //             .dateControler,
                        //       );
                        //     },
                        //   ),
                        //   child: Material(
                        //     elevation: 3,
                        //     color: textFieldFillColr,
                        //     child: Container(
                        //       padding:
                        //           const EdgeInsets.only(left: 13, right: 12),
                        //       height: 60,
                        //       width: double.infinity,
                        //       decoration: BoxDecoration(
                        //         color: textFieldFillColr,
                        //         borderRadius: BorderRadius.circular(7),
                        //       ),
                        //       child: Row(
                        //         children: [
                        //           Expanded(
                        //             child: Text(
                        //               context
                        //                       .read<CardSecondBloc>()
                        //                       .dateControler
                        //                       .text
                        //                       .isEmpty
                        //                   ? 'Select Date'
                        //                   : context
                        //                       .read<CardSecondBloc>()
                        //                       .dateControler
                        //                       .text,
                        //               style: custumText(
                        //                 colr: context
                        //                         .read<CardSecondBloc>()
                        //                         .dateControler
                        //                         .text
                        //                         .isEmpty
                        //                     ? klightgrey
                        //                     : kwhite,
                        //                 fontSize: kwidth * 0.04,
                        //               ),
                        //             ),
                        //           ),
                        //           const Icon(
                        //             Icons.calendar_month,
                        //             color: neonShade,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // adjustHieght(15),
                        // InkWell(
                        //   onTap: () async {
                        //     final selectedTime = await showTimePicker(
                        //       context: context,
                        //       initialTime: TimeOfDay.now(),
                        //     );
                        //     if (selectedTime != null) {
                        //       setState(() {
                        //         time =
                        //             '${'${selectedTime.hour}'.length == 1 ? '0${selectedTime.hour}' : selectedTime.hour}:${'${selectedTime.minute}'.length == 1 ? '0${selectedTime.minute}' : selectedTime.minute}';
                        //       });
                        //     }
                        //   },
                        //   child: Material(
                        //     elevation: 3,
                        //     color: textFieldFillColr,
                        //     child: Container(
                        //       padding:
                        //           const EdgeInsets.only(left: 13, right: 12),
                        //       height: 60,
                        //       width: double.infinity,
                        //       decoration: BoxDecoration(
                        //         color: textFieldFillColr,
                        //         borderRadius: BorderRadius.circular(7),
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             time == '' ? 'Select time' : time,
                        //             style: custumText(
                        //               colr: time == '' ? klightgrey : kwhite,
                        //               fontSize: kwidth * 0.04,
                        //             ),
                        //           ),
                        //           const Icon(
                        //             Icons.alarm_add_sharp,
                        //             color: neonShade,
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // adjustHieght(5),
                        // TTextFormField(
                        //   text: 'Time & Date',
                        //   controller: TextEditingController(),
                        //   inputType: TextInputType.name,
                        // ),
                        TTextFormField(
                          validate: Validate.notNull,
                          maxLines: 3,
                          text: 'Notes',
                          controller:
                              context.read<CardSecondBloc>().notesController,
                          inputType: TextInputType.name,
                        ),
                        adjustHieght(khieght * .02),
                        state.isLoading
                            ? const LoadingAnimation()
                            : LastSkipContinueButtons(
                                onTap: () {
                                  if (meetingDataKey.currentState!.validate()) {
                                    context
                                        .read<CardSecondBloc>()
                                        .add(CardSecondEvent.meetingRelatedInfo(
                                          selfieImage:
                                              state.selfieImageModel?.base64 ??
                                                  'No image',
                                          occation: context
                                              .read<CardSecondBloc>()
                                              .occationController
                                              .text,
                                          location: context
                                              .read<CardSecondBloc>()
                                              .locatioNController
                                              .text,
                                          occupation: context
                                              .read<CardSecondBloc>()
                                              .occupationController
                                              .text,
                                          notes: context
                                              .read<CardSecondBloc>()
                                              .notesController
                                              .text,
                                        ));

                                    context.read<CardSecondBloc>().add(
                                          const CardSecondEvent
                                              .secondCardCreation(),
                                        );
                                  }
                                },
                              ),
                        // const CustomButtonSelfie(
                        //   navigate:
                        //       HomeFirstViewAllContactTileDetailView(userId: null),
                        // ), //should give next navigation here i add SelfieScreen For demo
                        adjustHieght(khieght * .02),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
