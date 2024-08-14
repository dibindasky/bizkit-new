import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/module/biz_card/application/business_logic/reminder/reminder_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/screen_detail_editing/card_detail_editing_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/widgets/card_bottom_part.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/preview_commen_widgets/preview_pageview_image_builder/preview_pageview_image_builder.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/module/biz_card/domain/model/commen/card_id_model/card_id_model.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCardDetailView extends StatefulWidget {
  const ScreenCardDetailView({super.key});
  // final int? cardId;
  //final int? userId;
  // final bool myCard;

  @override
  State<ScreenCardDetailView> createState() => _ScreenCardDetailViewState();
}

class _ScreenCardDetailViewState extends State<ScreenCardDetailView> {
  @override
  // void initState() async {
  //   await getCard();
  //   super.initState();
  // }

  // Future getCard() async {
  //   // if (widget.cardId != null) {
  //   //   // context
  //   //   //     .read<CardBloc>()
  //   //   //     .add(CardEvent.getCardyCardId(id: widget.cardId!));
  //   //   // context.read<ReminderBloc>().add(ReminderEvent.getCardReminder(
  //   //   //     cardIdModel: CardIdModel(cardId: widget.cardId!)));
  //   // }
  //   if (widget.userId != null) {
  //     // context
  //     //     .read<CardBloc>()
  //     //     .add(CardEvent.getCardyUserId(id: widget.userId!));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Card'),
        actions: [
          IconButton(
            onPressed: () {
              // if (state.anotherCard!.percentage! == 10) {
              //   companySearchNotifier.value = 2;
              // } else if (state.anotherCard!.isCompanyAutofilled!) {
              //   companySearchNotifier.value = 1;
              // } else {
              //   companySearchNotifier.value = 0;
              // }
              // companySearchNotifier.notifyListeners();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ScreenCardDetailEditingList()));
              // context.read<UserDataBloc>().add(
              //     UserDataEvent.getCurrentCard(
              //         card: state.anotherCard!));
              // context.read<BusinessDataBloc>().add(
              //     BusinessDataEvent.getCurrentCard(
              //         card: state.anotherCard!));
            },
            icon: const Icon(Icons.edit),
          ),
          adjustWidth(20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: [
              kHeight20,
              // image carosal view
              const SizedBox(
                height: 200,
                child: PreviewPageviewImageBuilder(
                  imagesList: [dummyPersonImage],
                  //sisStory: false,
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Name',
                    overflow: TextOverflow.ellipsis,
                    style: custumText(fontSize: kwidth * 0.06),
                  ),
                  const Text(
                    'Designation',
                    overflow: TextOverflow.ellipsis,
                  ),
                  adjustHieght(khieght * .02),
                ],
              ),
              // card details
              const ScreenCardDetailSecondHalf()
            ],
          ),
        ),
      ),
    );
  }
}
