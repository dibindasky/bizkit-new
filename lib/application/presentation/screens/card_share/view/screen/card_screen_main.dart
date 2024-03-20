import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/card_share/view/widgets/custom_bottom_sheet.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/domain/model/card/get_card_response/card_response.dart'
    as card;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';

class CardShareMainScreen extends StatefulWidget {
  const CardShareMainScreen({super.key});

  @override
  State<CardShareMainScreen> createState() => _CardShareMainScreenState();
}

class _CardShareMainScreenState extends State<CardShareMainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
    context.read<CardBloc>().add(const CardEvent.getCards(call: false));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FadeTransition(
            opacity: animation,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                adjustHieght(khieght * .05),
                BlocBuilder<CardBloc, CardState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const LoadingAnimation();
                    } else if (state.cards.isEmpty) {
                      return const Center(
                        child: Text(
                            'You have not created any card yet\nCreate your first card now.',
                            textAlign: TextAlign.center),
                      );
                    } else {
                      return SizedBox(
                        height: 340,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.cards.length,
                          separatorBuilder: (context, index) =>
                              adjustWidth(kwidth * .05),
                          itemBuilder: (context, index) {
                            final card = state.cards[index];
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
                                            // Navigator.push(
                                            //     context,
                                            //     fadePageRoute(
                                            //         HomeFirstViewAllContactTileDetailView(
                                            //             cardId: state
                                            //                 .cards[index].id)));
                                            final map =
                                                state.cards[index].id != null
                                                    ? {
                                                        'myCard': 'true',
                                                        'cardId': state
                                                            .cards[index].id!
                                                            .toString()
                                                      }
                                                    : <String, String>{};
                                            GoRouter.of(context).pushNamed(
                                                Routes.cardDetailView,
                                                pathParameters: map);
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(20),
                                            ),
                                            child:
                                                card.businessDetails == null ||
                                                        card.logo == null
                                                    ? Image.network(
                                                        imageDummyNetwork,
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
                                              value: 'Edit Card',
                                              child: Text('Edit Card'),
                                            ),
                                            PopupMenuItem(
                                              onTap: () => context
                                                  .read<CardBloc>()
                                                  .add(CardEvent.setDefault(
                                                      id: card.id!)),
                                              value: 'Default',
                                              child:
                                                  const Text('Set as default'),
                                            ),
                                            PopupMenuItem(
                                              onTap: () =>
                                                  showConfirmationDialog(
                                                actionButton: 'Arcieve',
                                                heading:
                                                    'Are you want to archieve your card',
                                                context,
                                                onPressed: () => context
                                                    .read<CardBloc>()
                                                    .add(CardEvent.archiveCard(
                                                        id: card.id!)),
                                              ),
                                              value: 'Archive',
                                              child: const Text('Archive'),
                                            ),
                                            PopupMenuItem(
                                              onTap: () =>
                                                  showConfirmationDialog(
                                                heading:
                                                    'Are you want to Delete your card',
                                                context,
                                                onPressed: () => context
                                                    .read<CardBloc>()
                                                    .add(CardEvent.deleteCard(
                                                        id: card.id!)),
                                              ),
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
                                        '${state.cards[index].name ?? ''}\n${state.cards[index].designation}',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () => bottomSheet(context, card),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: kblue,
                                          ),
                                          width: 100,
                                          height: 30,
                                          child: Center(
                                            child: Text('Share',
                                                style: textStyle1),
                                          ),
                                        ),
                                      ),
                                      adjustWidth(kwidth * .02)
                                    ],
                                  ),
                                  adjustHieght(khieght * .02),
                                  Row(
                                    children: [
                                      adjustWidth(kwidth * .02),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: kwhite),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              adjustWidth(kwidth * .01),
                                              const Icon(
                                                Icons.remove_red_eye,
                                                size: 19,
                                                color: kwhite,
                                              ),
                                              adjustWidth(kwidth * .01),
                                              Text(
                                                state.cards[index].views
                                                    .toString(),
                                              ),
                                              adjustWidth(kwidth * .01),
                                              const Expanded(
                                                child: Text('views',
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              adjustWidth(kwidth * .01),
                                            ],
                                          ),
                                        ),
                                      ),
                                      adjustWidth(kwidth * .04),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: kwhite),
                                          ),
                                          child: Row(
                                            children: [
                                              adjustWidth(kwidth * .01),
                                              const Icon(
                                                Icons.share,
                                                color: kwhite,
                                                size: 19,
                                              ),
                                              adjustWidth(kwidth * .01),
                                              Text(
                                                state.cards[index].share
                                                    .toString(),
                                              ),
                                              adjustWidth(kwidth * .01),
                                              const Expanded(
                                                child: Text('share',
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              adjustWidth(kwidth * .01),
                                            ],
                                          ),
                                        ),
                                      ),
                                      adjustWidth(kwidth * .02),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bottomSheet(BuildContext context, card.CardResponse card) {
    showBottomSheet(
      context: context,
      builder: (context) => CustomBottomSheet(
        card: card,
      ),
    );
  }
}
