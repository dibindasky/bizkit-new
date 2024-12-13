import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/add_connection_tail.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class PendingConnectionRequestsScreen extends StatelessWidget {
  const PendingConnectionRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionController = Get.find<ConnectionsController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Pending Connection requests',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: RefreshIndicator(
            onRefresh: () async {
              connectionController.fetchAllSendConnectionRequests();
              await Future.delayed(const Duration(milliseconds: 1500));
            },
            child: Obx(
              () {
                if (!internetConnectinController.isConnectedToInternet.value) {
                  return Center(
                    child: InternetConnectionLostWidget(
                      onTap: () {
                        connectionController.fetchAllSendConnectionRequests();
                      },
                    ),
                  );
                }
                if (connectionController
                    .allSendConnectionRequestsLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (connectionController
                    .allSendConnectionRequests.isEmpty) {
                  return ErrorRefreshIndicator(
                    onRefresh: () {
                      connectionController.fetchAllSendConnectionRequests();
                    },
                    errorMessage: 'No send connection requests',
                    image: emptyNodata2,
                  );
                } else {
                  return GridView.builder(
                    itemCount:
                        connectionController.allSendConnectionRequests.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.20,
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1),
                    itemBuilder: (context, index) {
                      return ConnectionTile(
                        fromPendingRequests: true,
                        index: index,
                        allSendRequests: connectionController
                            .allSendConnectionRequests[index],
                      );
                    },
                  );
                }
              },
            ),
          )),
    );
  }
}
