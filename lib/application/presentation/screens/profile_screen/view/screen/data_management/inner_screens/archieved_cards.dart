import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArchivedCards extends StatelessWidget {
  const ArchivedCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'ArchivedCards',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingAnimation();
              } else if (state.archievedCards!.results!.isEmpty) {
                return const Center(
                  child:
                      Text('No archieved cards.', textAlign: TextAlign.center),
                );
              } else {
                if (state.archievedCards != null &&
                    state.archievedCards!.results != null) {
                  return SizedBox(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      //  scrollDirection: Axis.horizontal,
                      itemCount: state.archievedCards!.count!,
                      separatorBuilder: (context, index) =>
                          adjustWidth(kwidth * .05),
                      itemBuilder: (context, index) {
                        final card = state.archievedCards!.results![index];
                        return Container(
                          decoration: BoxDecoration(
                            color: textFieldFillColr,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 300,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    height: 200,
                                    child: InkWell(
                                      onTap: () {
                                        // // Navigator.push(
                                        // //     context,
                                        // //     fadePageRoute(
                                        // //         HomeFirstViewAllContactTileDetailView(
                                        // //             cardId: state
                                        // //                 .cards[index].id)));
                                        // final map =
                                        //     state.cards[index].id != null
                                        //         ? {
                                        //             'myCard': 'true',
                                        //             'cardId': state
                                        //                 .cards[index].id!
                                        //                 .toString()
                                        //           }
                                        //         : <String, String>{};
                                        // GoRouter.of(context).pushNamed(
                                        //     Routes.cardDetailView,
                                        //     pathParameters: map);
                                      },
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: state.archievedCards == null ||
                                                state.archievedCards!
                                                        .results![index].logo ==
                                                    null
                                            ? Image.network(imageDummyNetwork,
                                                fit: BoxFit.cover)
                                            : Image.network(
                                                card.logo!,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 10,
                                    child: PopupMenuButton<String>(
                                      icon: const Icon(
                                        Icons.more_vert,
                                        size: 35,
                                        color: kblack,
                                      ),
                                      onSelected: (value) {
                                        if (value == 'Add Tag') {}
                                        print('Selected: $value');
                                      },
                                      itemBuilder: (context) => [
                                        const PopupMenuItem(
                                          value: 'Delete Permanently',
                                          child: Text('Delete Permanently'),
                                        ),
                                        PopupMenuItem(
                                          onTap: () => context
                                              .read<CardBloc>()
                                              .add(CardEvent.setDefault(
                                                  id: card.id!)),
                                          value: 'Default',
                                          child: const Text('Set as default'),
                                        ),
                                        PopupMenuItem(
                                          onTap: () => context
                                              .read<CardBloc>()
                                              .add(CardEvent.deleteCard(
                                                  id: card.id!)),
                                          value: 'Delete Card',
                                          child: const Text('Delete Card'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              adjustHieght(khieght * .02),
                              Row(
                                children: [
                                  adjustWidth(kwidth * .02),
                                  Text(
                                    '${state.archievedCards!.results![index].name ?? ''}\n${state.archievedCards!.results![index].designation}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    // onTap: () => bottomSheet(context, card),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kblue,
                                      ),
                                      width: 100,
                                      height: 30,
                                      child: Center(
                                        child:
                                            Text('Restore', style: textStyle1),
                                      ),
                                    ),
                                  ),
                                  adjustWidth(kwidth * .02)
                                ],
                              ),
                              adjustHieght(khieght * .02),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Text('data');
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
