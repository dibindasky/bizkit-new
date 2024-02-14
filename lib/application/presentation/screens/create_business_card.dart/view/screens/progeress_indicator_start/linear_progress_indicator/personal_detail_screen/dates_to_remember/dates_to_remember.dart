import 'package:bizkit/application/business_logic/card/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/card/create_card/dates_to_remember/dates_to_remember.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatesToRememberScreen extends StatefulWidget {
  const DatesToRememberScreen({super.key});

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
        appBar: PreferredSize(
          preferredSize: Size(kwidth, 70),
          child: const AppbarCommen(
            tittle: 'Date to remember',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Selected date'),
                    adjustHieght(20),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DatePickingBottomSheet(
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
                                    ? 'Choose date'
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
                    const Text('Message'),
                    TTextFormField(
                      maxLines: 7,
                      text: 'Write your message here',
                      controller: labelController,
                    ),
                    adjustHieght(40),
                    Center(
                      child: AuthButton(
                        text: 'Add',
                        onTap: () {
                          if (dateController.text.isEmpty ||
                              labelController.text.isEmpty) {
                            showSnackbar(context,
                                message: dateController.text.isEmpty
                                    ? 'choose date'
                                    : 'add message',
                                backgroundColor: kred);
                            return;
                          }
                          final DatesToRememberCreate model =
                              DatesToRememberCreate(
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
                                  context.read<UserDataBloc>().add(
                                      UserDataEvent.removeDateToRemember(
                                          index: index));
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
