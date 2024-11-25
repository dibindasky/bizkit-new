import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SetDurationDialogPolCreation extends StatefulWidget {
  const SetDurationDialogPolCreation({
    super.key,
    required this.onSelection,
    required this.durations,
  });

  final Function(int value) onSelection;
  final List<String> durations;

  @override
  State<SetDurationDialogPolCreation> createState() =>
      _SetDurationDialogPolCreationState();
}

class _SetDurationDialogPolCreationState
    extends State<SetDurationDialogPolCreation> {
  int selection = 1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            kHeight20,
            Text(
              'Set Duration',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 15),
            ),
            adjustHieght(10.h),
            ...List.generate(
              widget.durations.length,
              (index) => RadioListTile(
                  value: index,
                  groupValue: selection,
                  title: Text(widget.durations[index],
                      style: textStyle1.copyWith(color: neonShade)),
                  onChanged: (value) {
                    setState(() {
                      selection = value!;
                    });
                    widget.onSelection(value!);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // TextButton(
                //     onPressed: () {},
                //     child: Text('CANCEL', style: textThinStyle1)),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text('Close', style: textThinStyle1)),
                kWidth30
              ],
            ),
            kHeight10
          ],
        ),
      ),
    );
  }
}
