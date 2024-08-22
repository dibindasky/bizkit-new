import 'package:bizkit/module/biz_card/application/presentation/screens/connections/my_connections/my_connection_inner_second_half_setions/add_tag/add_tag_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/my_connections/my_connection_inner_second_half_setions/my_connection_detail_second_half_first.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/navbar/navbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

enum Changing {
  first,
  second,
}

ValueNotifier changeScreenNotifier = ValueNotifier(Changing.first);

class CardDetailViewDeeplinkScreen extends StatelessWidget {
  const CardDetailViewDeeplinkScreen({super.key, this.userId, this.cardId});
  final int? userId;
  final int? cardId;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (userId != null) {
        //context.read<CardBloc>().add(CardEvent.getCardyUserId(id: userId!));
      } else if (cardId != null) {
        //context.read<CardBloc>().add(CardEvent.getCardyCardId(id: cardId!));
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.canPop(context)
                  ? Navigator.of(context).pop()
                  : Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardBottomNavigationBar(),
                      ),
                      (route) => false);
            },
            icon: const Icon(Icons.arrow_back_ios, color: kwhite, size: 18)),
        backgroundColor: knill,
        title: Text('Name', style: textHeadStyle1),
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
              adjustHieght(20),
              // image carosal view
              const SizedBox(
                  height: 200,
                  child: PreviewPageviewImageBuilder(imagesList: [])),
              // name and designation
              Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Name',
                    style: custumText(fontSize: kwidth * 0.06),
                  ),
                  const Text('Designation'),
                  adjustHieght(khieght * .02),
                ],
              ),
              // card details
              ValueListenableBuilder(
                valueListenable: changeScreenNotifier,
                builder: (context, value, child) {
                  if (value == Changing.first) {
                    return const CardMyConnectionDetailScreenSecondHalf();
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
