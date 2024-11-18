import 'dart:convert';

import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/request.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridTileAddRequestConnection extends StatefulWidget {
  const GridTileAddRequestConnection({
    super.key,
    this.data,
    required this.index,
    this.allSendRequests,
    this.fromPendingRequests = false,
  });

  final BizCardUsers? data;
  final SendConnectionRequet? allSendRequests;
  final int index;
  final bool fromPendingRequests;

  @override
  State<GridTileAddRequestConnection> createState() =>
      _GridTileAddRequestConnectionState();
}

class _GridTileAddRequestConnectionState
    extends State<GridTileAddRequestConnection> {
  bool requested = false;

  @override
  Widget build(BuildContext context) {
    // final connectionController = Get.find<ConnectionsController>();

    return Card(
      elevation: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: kwidth * 0.08,
            backgroundColor: textFieldFillColr,
            backgroundImage: MemoryImage(
              base64.decode(imageTestingBase64.startsWith('data')
                  ? imageTestingBase64.substring(22)
                  : imageTestingBase64),
            ),
          ),
          adjustHieght(15.h),
          Text(
            'Name',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            'Designation',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          adjustHieght(7),
          GestureDetector(
            onTap: () {
              // Add your connection logic here
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: FittedBox(
                child: Text(
                  widget.data?.connectionRequestId != null
                      ? 'Remove Connection'
                      : 'Add Connection',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
