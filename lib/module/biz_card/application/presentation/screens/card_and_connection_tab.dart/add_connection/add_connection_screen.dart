import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/add_connection_tail.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/shimmer/shimmer.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AddConnectionScreen extends StatelessWidget {
  const AddConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionController = Get.find<ConnectionsController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            connectionController.searchBizkitUsers();
          },
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: false,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18.sp,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                  title: Text(
                    'New Connection',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        connectionController.fetchAllSendConnectionRequests();
                        GoRouter.of(context)
                            .pushNamed(Routes.pendingConnectionRequests);
                      },
                      child: Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: klightgrey),
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        child: const Icon(
                          Iconsax.profile_2user,
                        ),
                      ),
                    ),
                    kWidth10
                  ],
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverSearchBarDelegate(
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: CustomTextFormField(
                        controller:
                            connectionController.searchBizkitUsersController,
                        onChanaged: (value) {
                          connectionController.searchBizkitUsers();
                        },
                        labelText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Obx(
              () {
                if (!internetConnectinController.isConnectedToInternet.value) {
                  return Center(
                    child: SizedBox(
                      width: 300.w,
                      child: InternetConnectionLostWidget(
                        onTap: () {
                          connectionController.searchBizkitUsers();
                        },
                      ),
                    ),
                  );
                }
                if (connectionController.searchBizkitUsersLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (connectionController.bizkitUsers.isEmpty) {
                  return ErrorRefreshIndicator(
                    onRefresh: () {
                      connectionController.searchBizkitUsers();
                    },
                    errorMessage: 'bizkit users not available ',
                    image: emptyNodata2,
                  );
                } else {
                  return Obx(() => CustomScrollView(
                        controller:
                            connectionController.userSearchScrollController,
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.all(8.0),
                            sliver: SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1 / 1.3,
                                crossAxisCount: 2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  if (index >=
                                      connectionController.bizkitUsers.length) {
                                    return const ShimmerGridView();
                                  }
                                  return ConnectionTile(
                                    index: index,
                                    fromPendingRequests: false,
                                    data:
                                        connectionController.bizkitUsers[index],
                                  );
                                },
                                childCount: connectionController
                                        .bizkitUsers.length +
                                    (connectionController.usersLoadMore.value
                                        ? (connectionController
                                                        .bizkitUsers.length %
                                                    2 ==
                                                0)
                                            ? 1
                                            : 2
                                        : 0),
                              ),
                            ),
                          ),
                        ],
                      ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverSearchBarDelegate({
    required this.child,
  });

  @override
  double get minExtent => 70.0;

  @override
  double get maxExtent => 70.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverSearchBarDelegate oldDelegate) {
    return false;
  }
}
