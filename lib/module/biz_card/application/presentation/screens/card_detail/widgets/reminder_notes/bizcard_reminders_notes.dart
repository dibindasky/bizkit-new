
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class BizCardRminderNotes extends StatelessWidget {
  const BizCardRminderNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight10,
          Text('Notes', style: Theme.of(context).textTheme.titleSmall),
          ...List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: ColoredBox(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              imageHistoryList[0],
                              fit: BoxFit.cover,
                            ),
                            kWidth10,
                            Text(
                              'Date',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                        adjustHieght(khieght * .006),
                        Text(
                          'Scheduled on Time to discuss about Mesage.',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}