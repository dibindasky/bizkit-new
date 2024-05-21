import 'package:bizkit/module/biz_card/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_business_card/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/module/biz_card/domain/model/card/card/dates_to_remember/dates_to_remember.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatesToRememberScreen extends StatefulWidget {
  const DatesToRememberScreen({super.key, required this.cardId});

  final int cardId;

  @override
  State<DatesToRememberScreen> createState() => _DatesToRememberScreenState();
}

class _DatesToRememberScreenState extends State<DatesToRememberScreen> {
  final dateController = TextEditingController();
  final labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: kwhite,
          ),
          backgroundColor: knill,
          title: Text(
            'Date to remember',
            style: textHeadStyle1,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.check,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: kwhite,
            ),
            adjustWidth(20)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocConsumer<UserDataBloc, UserDataState>(
              listenWhen: (previous, current) =>
                  !previous.datesToRememberAdded &&
                  current.datesToRememberAdded,
              listener: (context, state) =>
                  showSnackbar(context, message: 'Date added successfully'),
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    adjustHieght(40),
                    const Text('Select Date'),
                    adjustHieght(20),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DatePickingBottomSheet(
                            year: 500,
                            last: 500,
                            onPressed: (date) {
                              setState(() {
                                dateController.text = date;
                              });
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
                          border: Border.all(color: klightgrey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                dateController.text.isEmpty
                                    ? 'Choose Date'
                                    : dateController.text,
                                style: dateController.text.isEmpty
                                    ? const TextStyle(color: kwhite)
                                    : const TextStyle(color: kwhite),
                              ),
                            ),
                            const Icon(
                              Icons.calendar_month,
                              color: neonShade,
                            ),
                          ],
                        ),
                      ),
                    ),
                    adjustHieght(20),
                    const Text('Message  *'),
                    CustomTextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      maxlegth: 250,
                      maxLines: 7,
                      labelText: 'Write your message here',
                      controller: labelController,
                    ),
                    adjustHieght(40),
                    state.datesToRememberLoading
                        ? const LoadingAnimation()
                        : Center(
                            child: AuthButton(
                              text: 'Add',
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                if (dateController.text.isEmpty ||
                                    labelController.text.isEmpty) {
                                  showSnackbar(context,
                                      message: dateController.text.isEmpty
                                          ? 'choose date'
                                          : 'add message',
                                      backgroundColor: kred);
                                  return;
                                }
                                final DatesToRemember model = DatesToRemember(
                                    cardId: widget.cardId,
                                    label: labelController.text,
                                    date: dateController.text);
                                context.read<UserDataBloc>().add(
                                    UserDataEvent.addDateToRemember(
                                        datesToRemember: model));
                                labelController.text = '';
                                dateController.text = '';
                              },
                            ),
                          ),
                    adjustHieght(40),
                    Wrap(
                      children: List.generate(
                        state.datesToRemember.length,
                        (index) => Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: neonShade),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Text(
                                  '${state.datesToRemember[index].date ?? 'date $index'}  =  ${state.datesToRemember[index].label ?? 'label $index'}'),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: InkWell(
                                onTap: () {
                                  showCustomConfirmationDialogue(
                                      context: context,
                                      title: 'are you sure want to delete ?',
                                      buttonText: 'Delete',
                                      onTap: () {
                                        context.read<UserDataBloc>().add(
                                            UserDataEvent.removeDateToRemember(
                                                id: state.datesToRemember[index]
                                                    .id!));
                                      });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const ColoredBox(
                                    color: neonShade,
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(Icons.close, size: 12),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
