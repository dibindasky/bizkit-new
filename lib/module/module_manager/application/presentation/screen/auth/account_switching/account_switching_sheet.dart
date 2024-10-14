import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

accountSwitchingBottomSheet(BuildContext context) async {
  return showBottomSheet(
    context: context,
    builder: (context) => const AccountSwitcherBottomSheet(),
    showDragHandle: true,
    backgroundColor: klightDarkGrey,
    elevation: 5,
    enableDrag: true,
  );
}

class AccountSwitcherBottomSheet extends StatelessWidget {
  const AccountSwitcherBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAccountList();
    });
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: lightColr,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            if (controller.loadingAccountFetching.value) {
              return ShimmerLoader(
                  seprator: kHeight10,
                  itemCount: 2,
                  height: 30.h,
                  width: double.infinity);
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.accounts.length,
              itemBuilder: (context, index) {
                final data = controller.accounts[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: kblack,
                    borderRadius: kBorderRadius20,
                  ),
                  child: ListTile(
                    onTap: () {
                      // GoRouter.of(context).pop();
                      GoRouter.of(context)
                          .pushReplacementNamed(Routes.accountSwitching);
                      controller.switchAccountLogin(context,
                          userId: data.uid ?? '');
                    },
                    leading: const CircleAvatar(
                      backgroundColor: kgrey,
                    ),
                    title: Text(
                      data.name ?? '',
                      style: const TextStyle(color: kwhite),
                    ),
                    // subtitle: const Text(
                    //   '',
                    //   style: TextStyle(color: kgrey),
                    // ),
                    trailing: Obx(() {
                      return controller.currentUserId.value == data.uid
                          ? const Icon(Icons.check_circle, color: neonShade)
                          : const Icon(Icons.circle_outlined, color: kwhite);
                    }),
                  ),
                );
              },
            );
          }),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kblack,
              borderRadius: kBorderRadius20,
            ),
            child: ListTile(
              onTap: () {
                // logout from application with out clalling logout to server
                // user account will be avilable for account switching
                controller.logOut(context, false);
              },
              leading: const CircleAvatar(
                backgroundColor: kgrey,
                child: Icon(Icons.add, color: kwhite),
              ),
              title: const Text(
                'Add Account',
                style: TextStyle(color: kwhite),
              ),
            ),
          ),
          kHeight10,
        ],
      ),
    );
  }
}
