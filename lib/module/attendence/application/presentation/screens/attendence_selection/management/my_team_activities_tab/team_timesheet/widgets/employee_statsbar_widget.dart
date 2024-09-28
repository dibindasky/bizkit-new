import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeStatsBar extends StatelessWidget {
  const EmployeeStatsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildStatsCard(
                title: 'Total working days',
                value: '200',
                total: '204',
                valueColor: Colors.teal,
                borderColor: kred,
              ),
              adjustWidth(12),
              _buildStatsCard(
                  title: 'Overtime',
                  value: '22 hrs',
                  valueColor: Colors.amber,
                  borderColor: kyellow),
              adjustWidth(12),
              _buildStatsCard(
                valueColor: neonShade,
                title: 'Late Login',
                value: '18 Hrs',
                isDashed: true,
              ),
              adjustWidth(12),
              _buildStatsCard(
                title: 'Penalty',
                value: '1600',
                valueColor: neonShade,
              ),
              adjustWidth(12),
              _buildStatsCard(
                title: 'Overtime Bonus',
                value: '1900',
                valueColor: neonShade,
              ),
              adjustWidth(12),
              _buildStatsCard(
                title: 'Overall Bonus',
                value: '300',
                valueColor: neonShade,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCard({
    required String title,
    required String value,
    String? total,
    required Color valueColor,
    Color? borderColor,
    bool isDashed = false,
  }) {
    return Container(
      width: 190.w,
      height: 70.h,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: lightColr,
        border: borderColor != null
            ? Border.all(color: borderColor)
            : isDashed
                ? Border.all(
                    color: Colors.transparent,
                    style: BorderStyle.solid,
                    width: 1,
                  )
                : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textThinStyle1.copyWith(color: kwhite),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(value,
                  style: textThinStyle1.copyWith(
                      color: valueColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              if (total != null)
                Text(
                  '/$total',
                  style: const TextStyle(color: kred, fontSize: 13),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
