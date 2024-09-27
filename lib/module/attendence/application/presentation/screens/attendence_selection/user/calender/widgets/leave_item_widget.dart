import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/calender/widgets/upcoming_leaves_widget.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class LeaveItemWidget extends StatelessWidget {
  final Leave leave;

  const LeaveItemWidget({Key? key, required this.leave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: lightColr,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leave.title,
                  style: textThinStyle1.copyWith(
                    color: kwhite,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  leave.names.join(', '),
                  style: textThinStyle1.copyWith(color: kgrey),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatDate(leave),
                  style: textThinStyle1.copyWith(color: kgrey),
                ),
              ],
            ),
          ),
          _buildAvatars(),
        ],
      ),
    );
  }

  String _formatDate(Leave leave) {
    final DateFormat formatter = DateFormat('d MMMM');
    if (leave.startDate != null && leave.endDate != null) {
      return '${formatter.format(leave.startDate!)} - ${formatter.format(leave.endDate!)}';
    } else if (leave.date != null) {
      return formatter.format(leave.date!);
    }
    return '';
  }

  Widget _buildAvatars() {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        children: leave.names
            .take(2)
            .map((name) => Positioned(
                  left: leave.names.indexOf(name) * 24.0,
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundColor: neonShade,
                    backgroundImage: AssetImage(chatSectionPersonDummyImg2),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
