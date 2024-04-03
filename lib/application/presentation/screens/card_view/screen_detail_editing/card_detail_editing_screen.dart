import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCardDetailEditingList extends StatelessWidget {
  const ScreenCardDetailEditingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: backgroundColour,
        title: const Text('Bizzkit Details '),
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DetailCustomTile(
                    onTap: () {
                      context.read<UserDataBloc>().add(
                          UserDataEvent.getCurrentCard(
                              card: state.anotherCard!));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LinearProgressIndicatorStarting(index: 0),
                          ));
                    },
                    title: 'Personal Details',
                    subTitle: ''),
                DetailCustomTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LinearProgressIndicatorStarting(index: 1),
                          ));
                    },
                    title: 'Business Details',
                    subTitle: ''),
                DetailCustomTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LinearProgressIndicatorStarting(index: 2),
                          ));
                    },
                    title: 'Logo, Logo Story',
                    subTitle: ''),
                DetailCustomTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LinearProgressIndicatorStarting(index: 3),
                          ));
                    },
                    title: 'Products & Brochers',
                    subTitle: ''),
                DetailCustomTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LinearProgressIndicatorStarting(index: 4),
                          ));
                    },
                    title: 'Banking Details',
                    subTitle: ''),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DetailCustomTile extends StatelessWidget {
  const DetailCustomTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.subTitle,
  });
  final String title;
  final VoidCallback onTap;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: smallBigGrey,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(title),
            adjustWidth(10),
            Text(
              subTitle,
              style:
                  textStyle1.copyWith(fontSize: kwidth * 0.0245, color: kred),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right_rounded)
          ],
        ),
      ),
    );
  }
}
