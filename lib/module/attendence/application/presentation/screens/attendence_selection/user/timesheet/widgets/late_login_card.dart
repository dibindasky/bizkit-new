import 'package:flutter/material.dart';

class LateLoginCard extends StatelessWidget {
  final int duration;
  final String reason;
  final String approvedBy;

  const LateLoginCard({
    Key? key,
    required this.duration,
    required this.reason,
    required this.approvedBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date'),
                Text('Approved', style: TextStyle(color: Colors.green)),
              ],
            ),
            SizedBox(height: 8),
            Text('Late Login by $duration Mins',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Reason'),
                    Text(reason, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Approved By'),
                    Text(approvedBy,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
