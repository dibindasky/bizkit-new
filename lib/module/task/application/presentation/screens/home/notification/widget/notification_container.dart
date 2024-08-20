import 'package:bizkit/module/task/domain/model/requests/send_requests_responce/assigned_user.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: lightGrey,
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
                          style: const TextStyle(color: kwhite),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        createdAtDateTime != null
                            ? timeago.format(createdAtDateTime)
                            : 'Unknown time',
                        style: const TextStyle(
                          color: klightgrey,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                  adjustHieght(4),
                  Text(
                    description ?? 'Task Description',
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: klightgrey, fontSize: 12.0),
                  ),
                  adjustHieght(4),
                  Text(
                    'New project task assigned to ${assignedUsers?.first.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kwhite,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
