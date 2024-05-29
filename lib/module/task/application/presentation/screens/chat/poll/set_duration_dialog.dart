import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetDurationDialogPolCreation extends StatefulWidget {
  const SetDurationDialogPolCreation({
    super.key,
  });

  @override
  State<SetDurationDialogPolCreation> createState() =>
      _SetDurationDialogPolCreationState();
}

class _SetDurationDialogPolCreationState
    extends State<SetDurationDialogPolCreation> {
  List<String> durations = ['Next 1 hour', '24 hours', '1 week', 'Alwase'];
  int selection = 1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            kHeight20,
            Text('Set Duration', style: textHeadStyle1),
            adjustHieght(10.h),
            ...List.generate(
              durations.length,
              (index) => RadioListTile(
                  value: index,
                  groupValue: selection,
                  title: Text(durations[index],
                      style: textStyle1.copyWith(color: neonShade)),
                  onChanged: (value) {
                    setState(() {
                      selection = value!;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text('CANCEL', style: textThinStyle1)),
                TextButton(
                    onPressed: () {},
                    child: Text('DONE', style: textThinStyle1)),
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
