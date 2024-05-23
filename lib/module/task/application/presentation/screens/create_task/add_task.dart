import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/dropdown_items.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/radio_buttons.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/tag_contaner.dart';
import 'package:bizkit/module/task/application/presentation/screens/create_task/widgets/task_bulder.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: knill,
        title: const Text('New Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commenText('Tittle',
                    style: const TextStyle(
                      fontSize: 16,
                      color: neonShade,
                    )),
                adjustHieght(10),
                const TaskTextField(
                  hintText: 'Tittle',
                ),
                adjustHieght(10),
                commenText('Description',
                    style: const TextStyle(
                      fontSize: 16,
                      color: neonShade,
                    )),
                adjustHieght(10),
                const TaskTextField(
                  maxLines: 3,
                  hintText: 'Description',
                ),
                adjustHieght(15),
                commenText(
                  'Task Type',
                  style: const TextStyle(
                    fontSize: 16,
                    color: neonShade,
                  ),
                ),
                adjustHieght(15),
                const RadioButtons(),
                adjustHieght(20),
                const DropDownItems(),
                adjustHieght(20),
                commenText(
                  'Deadline',
                  style: const TextStyle(
                    fontSize: 16,
                    color: neonShade,
                  ),
                ),
                adjustHieght(10),
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
                      color: lightGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            dateController.text.isEmpty
                                ? 'Choose Deadline'
                                : dateController.text,
                            style: const TextStyle(fontSize: 16),
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
                const TagsContainer(),
                adjustHieght(20),
                const Text(
                  'Attachments',
                  style: TextStyle(
                    color: neonShade,
                    fontSize: 16,
                  ),
                ),
                adjustHieght(10),
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: kBorderRadius15,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_outlined, color: neonShade),
                      Text('Browse File or upload')
                    ],
                  ),
                ),
                adjustHieght(16),
                const Text(
                  'Subtasks',
                  style: TextStyle(
                    fontSize: 16,
                    color: neonShade,
                  ),
                ),
                TaskBuilder(),
                adjustHieght(5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ClipRRect(
                    borderRadius: kBorderRadius5,
                    child: const ColoredBox(
                      color: neonShade,
                      child: Icon(
                        Icons.add,
                        color: kblack,
                      ),
                    ),
                  ),
                ),
                adjustHieght(10),
                Center(
                    child: EventButton(
                  color: const LinearGradient(colors: [neonShade, neonShade]),
                  wdth: 300,
                  text: 'Create Task',
                  onTap: () {},
                )),
                adjustHieght(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
