import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/add_connection/widgets/add_connection_tail.dart';

import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddConnectionScreen extends StatelessWidget {
  const AddConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: false,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 23,
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                title: Text(
                  'New Connection',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 16),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // connectionController.fetchAllSendConnectionRequests();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) =>
                      //         const ConnectionPendingRequests()));
                    },
                    icon: const Icon(Icons.person_2_outlined),
                  ),
                  kWidth10
                ],
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverSearchBarDelegate(
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: CustomTextFormField(
                      onChanaged: (value) {},
                      labelText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.3,
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return GridTileAddRequestConnection(
                        index: index,
                        fromPendingRequests: false,
                      );
                    },
                    childCount: 17,
                  ),
                ),
              ),
            ],
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
