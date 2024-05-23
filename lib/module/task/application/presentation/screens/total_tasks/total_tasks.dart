import 'package:bizkit/module/task/application/presentation/screens/total_tasks/tabbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TotalTasksScreen extends StatefulWidget {
  const TotalTasksScreen({super.key});

  @override
  State<TotalTasksScreen> createState() => _TotalTasksScreenState();
}

class _TotalTasksScreenState extends State<TotalTasksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showCustomMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      color: lightGrey,
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Self to Self    ',
            onTap: () {
              Navigator.of(context).pop();
              // Handle 'Self to Self' action
            },
          ),
        ),
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Self to others',
            onTap: () {
              Navigator.of(context).pop();
              // Handle 'Self to others' action
            },
          ),
        ),
        PopupMenuItem(
          child: CustomPopupMenuItem(
            text: 'Others to self',
            onTap: () {
              Navigator.of(context).pop();
              // Handle 'Others to self' action
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: knill,
        title: Row(
          children: [
            const Text('Total Tasks'),
            IconButton(
              onPressed: () {
                _showCustomMenu(context);
              },
              icon: const Icon(Icons.arrow_drop_down),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: kBorderRadius15,
                  color: kgrey,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
              ),
              TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: neonShade,
                  borderRadius: BorderRadius.circular(10),
                ),
                unselectedLabelColor: kwhite,
                labelColor: kwhite,
                indicatorColor: knill,
                tabs: [
                  SizedBox(
                    width: kwidth * 0.5,
                    child: const Tab(text: 'Pinned tasks'),
                  ),
                  SizedBox(
                    width: kwidth * 0.5,
                    child: const Tab(text: 'Total Tasks'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          TaskListView(),
          TaskListView(),
        ],
      ),
    );
  }
}

class CustomPopupMenuItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomPopupMenuItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        onTap;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [neonShade, neonShade, lightGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: kBorderRadius10,
        ),
        child: Text(
          text,
          style: const TextStyle(color: kwhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
