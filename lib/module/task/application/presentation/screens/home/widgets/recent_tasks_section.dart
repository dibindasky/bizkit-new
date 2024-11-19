import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTasksSection extends StatelessWidget {
  const RecentTasksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Tasks',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14),
            ),
            Text(
              'See all',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14),
            ),
          ],
        ),
        adjustHieght(10.h),
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Recent task title",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 13),
                      ),
                      Text(
                        "2024-07-13",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 10),
                      ),
                      adjustHieght(15.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Progress",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        fontSize: 9,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                              adjustWidth(8.w),
                              SizedBox(
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: LinearProgressIndicator(
                                    minHeight: 8,
                                    value: 45.toDouble() / 100,
                                    backgroundColor: klightGrey,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        index == 0 || index == 2
                                            ? kred
                                            : kneon),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          adjustHieght(10.h),
                          Text('Created by Mac ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 8)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
