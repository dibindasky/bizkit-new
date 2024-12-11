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
  return showModalBottomSheet(
    context: context,
    builder: (context) => const AccountSwitcherBottomSheet(),
    showDragHandle: true,
    elevation: 10,
    backgroundColor: Theme.of(context).colorScheme.onTertiary,
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
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
                  margin: EdgeInsets.only(bottom: 5.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: kBorderRadius20,
                  ),
                  child: Card(
                    elevation: 0,
                    child: ListTile(
                      onTap: () {
                     
                        GoRouter.of(context)
                            .pushReplacementNamed(Routes.accountSwitching);
                        controller.switchAccountLogin(context,
                            userId: data.uid ?? '');
                              //  GoRouter.of(context).pop();
                      },
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(chatSectionPersonDummyImg2),
                      ),
                      title: Text(
                        data.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 14),
                      ),
                      // subtitle: const Text(
                      //   '',
                      //   style: TextStyle(color: kgrey),
                      // ),
                      trailing: Obx(() {
                        return controller.currentUserId.value == data.uid
                            ? const Icon(
                                Icons.check_circle,
                                color: kneon,
                                size: 27,
                              )
                            : const Icon(
                                Icons.circle_outlined,
                                color: kwhite,
                                size: 27,
                              );
                      }),
                    ),
                  ),
                );
              },
            );
          }),
          Card(
            elevation: 0,
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: kBorderRadius20,
              ),
              child: ListTile(
                onTap: () {
                  // logout from application with out clalling logout to server
                  // user account will be avilable for account switching
                  controller.logOut(context, false);
                },
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(bizcardBgImage),
                  child: Icon(Icons.add, color: kwhite),
                ),
                title: Text(
                  'Login to Account',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 14),
                ),
              ),
            ),
          ),
          kHeight50,
          kHeight10,
        ],
      ),
    );
  }
}
