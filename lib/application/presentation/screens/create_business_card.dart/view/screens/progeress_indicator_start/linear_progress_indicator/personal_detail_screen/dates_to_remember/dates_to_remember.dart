import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';

class DatesToRemember extends StatefulWidget {
  const DatesToRemember({super.key});

  @override
  State<DatesToRemember> createState() => _DatesToRememberState();
}

class _DatesToRememberState extends State<DatesToRemember> {
  final dateController = TextEditingController();
  String selectedTime = 'Time';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
              const TTextFormField(
                maxLines: 7,
                text: 'Write your message here',
                // controller: birthDaycontroller,
                inputType: TextInputType.name,
              ),
              const Spacer(),
              Center(
                child: AuthButton(
                  text: 'Save',
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
              adjustHieght(40)
            ],
          ),
        ),
      ),
    );
  }
}
