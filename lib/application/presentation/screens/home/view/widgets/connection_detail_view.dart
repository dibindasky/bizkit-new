import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/my_connections/my_connection_second_half_setions/my_connection_detail_second_half_first.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/business_card_preview/view/widgets/image_offset_container.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_second_screen/add_tag/add_tag_screen.dart';
import 'package:flutter/material.dart';

enum Changing { first, second }

ValueNotifier changeScreenNotifier = ValueNotifier(Changing.first);

class ListTileDetailView extends StatelessWidget {
  const ListTileDetailView({super.key, this.name});
  final String? name;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      changeScreenNotifier.value = Changing.first;
      changeScreenNotifier.notifyListeners();
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kwhite,
            size: 18,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          name ?? 'Alex Tyler',
          style: custumText(fontSize: kwidth * 0.06),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 24,
              color: kwhite,
            ),
            onSelected: (value) {
              if (value == 'Add Tag') {
                changeScreenNotifier.value = Changing.second;
                changeScreenNotifier.notifyListeners();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Add Tag',
                child: Text('Add Tag'),
              ),
              const PopupMenuItem(
                value: 'Emergency',
                child: Text('Emergency'),
              ),
              const PopupMenuItem(
                value: 'Remove Connection',
                child: Text('Remove Connection'),
              ),
              const PopupMenuItem(
                value: 'Block Connection',
                child: Text('Block Connection'),
              ),
              const PopupMenuItem(
                value: 'Report Connection',
                child: Text('Report Connection'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
                child: ImageOffsetContainers(),
              ),
              const SizedBox(height: 20),
              Text(
                name ?? "Alex Tyler",
                style: custumText(fontSize: kwidth * 0.06),
              ),
              const Text('Mobile app developer - Flutter'),
              adjustHieght(khieght * .02),
              ValueListenableBuilder(
                valueListenable: changeScreenNotifier,
                builder: (context, value, child) {
                  if (value == Changing.first) {
                    return const MyConnectionDetailScreenSecondHalf();
                  }
                  return AddTagScreen();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
