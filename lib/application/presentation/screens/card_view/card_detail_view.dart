import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/application/presentation/screens/card_view/widgets/card_bottom_part.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/commen/card_id_model/card_id_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCardDetailView extends StatelessWidget {
  const ScreenCardDetailView(
      {super.key, this.cardId, this.myCard = false, this.userId});
  final int? cardId;
  final int? userId;
  final bool myCard;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (cardId != null) {
        print("card id $cardId");
        context.read<CardBloc>().add(CardEvent.getCardyCardId(id: cardId!));
        context.read<ReminderBloc>().add(ReminderEvent.getCardReminder(
            cardIdModel: CardIdModel(cardId: cardId!)));
      } else if (userId != null) {
        context.read<CardBloc>().add(CardEvent.getCardyUserId(id: userId!));
      }
    });

    return BlocBuilder<CardBloc, CardState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
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
            title: state.isLoading
                ? null
                : Text(state.anotherCard?.personalDetails?.name ?? '',
                    style: textHeadStyle1),
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: neonShade),
                )
              : state.anotherCard == null
                  ? const Center(child: Text('Bizkit card not found'))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            adjustHieght(20),
                            // image carosal view
                            BlocBuilder<CardBloc, CardState>(
                              builder: (context, state) {
                                List<String> images = [];
                                if (state.anotherCard != null &&
                                    state.anotherCard!.personalDetails !=
                                        null &&
                                    state.anotherCard!.personalDetails!
                                            .photos !=
                                        null) {
                                  images.add(state
                                          .anotherCard!.personalDetails!.photos!
                                          .startsWith('data:')
                                      ? state
                                          .anotherCard!.personalDetails!.photos!
                                          .substring(22)
                                      : state.anotherCard!.personalDetails!
                                          .photos!);
                                }
                                if (state.anotherCard != null &&
                                    state.anotherCard!.logoCard != null &&
                                    state.anotherCard!.logoCard!.logo != null) {
                                  images.add(state.anotherCard!.logoCard!.logo!
                                          .startsWith('data:')
                                      ? state.anotherCard!.logoCard!.logo!
                                          .substring(22)
                                      : state.anotherCard!.logoCard!.logo!);
                                }
                                return SizedBox(
                                  height: 200,
                                  child: PreviewPageviewImageBuilder(
                                    imagesList: images,
                                  ),
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
                                      state.anotherCard?.isVerified == false
                                          ? state.anotherCard?.personalDetails
                                                  ?.name ??
                                              'Name'
                                          : state.anotherCard?.businessDetails
                                                  ?.company ??
                                              'Company',
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          custumText(fontSize: kwidth * 0.06),
                                    ),
                                    Text(
                                      state.anotherCard?.isVerified == false
                                          ? state.anotherCard?.personalDetails
                                                  ?.designation ??
                                              'Designation'
                                          : state.anotherCard?.personalDetails
                                                  ?.name ??
                                              'Name',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      state.anotherCard?.isVerified == false
                                          ? state.anotherCard?.businessDetails
                                                  ?.company ??
                                              'Company'
                                          : state.anotherCard?.personalDetails
                                                  ?.name ??
                                              'Name',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    adjustHieght(khieght * .02),
                                  ],
                                );
                              },
                            ),
                            // card details
                            CardDetailScreenSecondHalf(
                                myCard: myCard, cardId: state.anotherCard!.id!)
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
