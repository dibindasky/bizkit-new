import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/assigned_user.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    this.title,
    this.description,
    this.assignedUsers,
    this.createdAt,
  });

  final String? title;
  final String? description;
  final List<AssignedUser>? assignedUsers;
  final String? createdAt;

  @override
  Widget build(BuildContext context) {
    final DateTime? createdAtDateTime =
        createdAt != null ? DateTime.parse(createdAt!) : null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: kBorderRadius15,
          ),
          child: Row(
            children: [
              SizedBox(
                width: kwidth * .7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: kred,
                          radius: 6.0,
                        ),
                        adjustWidth(8),
                        Flexible(
                          child: Text(
                            title ?? 'Task Title',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          createdAtDateTime != null
                              // ? DateTimeFormater.timeAgo(createdAtDateTime)
                              ? DateTimeFormater.timeAgo(createdAtDateTime)
                              : 'Unknown time',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    adjustHieght(4),
                    Text(
                      description ?? 'Task Description',
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 10),
                    ),
                    adjustHieght(4),
                    Text(
                      'New project task assigned to ${assignedUsers?.first.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
