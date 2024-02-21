import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/my_connections/my_connection_inner_second_half_setions/my_connection_detail_second_half_first.dart';
import 'package:bizkit/application/presentation/screens/navbar/navba.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/my_connections/my_connection_inner_second_half_setions/add_tag/add_tag_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Changing {
  first,
  second,
}

ValueNotifier changeScreenNotifier = ValueNotifier(Changing.first);

class HomeFirstViewAllContactTileDetailView extends StatelessWidget {
  const HomeFirstViewAllContactTileDetailView(
      {super.key, this.userId, this.cardId});
  final int? userId;
  final int? cardId;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (userId != null) {
        context.read<CardBloc>().add(CardEvent.getCardyUserId(id: userId!));
      } else if (cardId != null) {
        context.read<CardBloc>().add(CardEvent.getCardyCardId(id: cardId!));
      }
    });
    return BlocBuilder<CardBloc, CardState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: neonShade),
          );
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.canPop(context)
                    ? Navigator.of(context).pop()
                    : Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BizkitBottomNavigationBar(),
                        ),
                        (route) => false);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kwhite,
                size: 18,
              ),
            ),
            backgroundColor: knill,
            title: Text(state.anotherCard?.personalDetails?.name ?? 'Name',
                style: textHeadStyle1),
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
                  // image carosal view
                  BlocBuilder<CardBloc, CardState>(
                    builder: (context, state) {
                      List<String> images = [];
                      if (state.anotherCard != null &&
                          state.anotherCard!.personalDetails != null &&
                          state.anotherCard!.personalDetails!.photos != null) {
                        images.addAll(state
                            .anotherCard!.personalDetails!.photos!
                            .map((e) => e.photos!));
                      }
                      if (state.anotherCard != null &&
                          state.anotherCard!.businessDetails != null &&
                          state.anotherCard!.businessDetails!.logo != null) {
                        images.add(state.anotherCard!.businessDetails!.logo!);
                      }
                      return SizedBox(
                        height: 200,
                        child: PreviewPageviewImageBuilder(imagesList: images),
                      );
                    },
                  ),
                  // name and designation
                  BlocBuilder<CardBloc, CardState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            state.anotherCard?.personalDetails?.name ?? 'Name',
                            style: custumText(fontSize: kwidth * 0.06),
                          ),
                          Text(
                              state.anotherCard?.businessDetails?.designation ??
                                  'Designation'),
                          adjustHieght(khieght * .02),
                        ],
                      );
                    },
                  ),
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
      },
    );
  }
}
