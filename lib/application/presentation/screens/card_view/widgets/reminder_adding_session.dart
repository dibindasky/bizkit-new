import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/reminder/reminder_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/connections/create_connection_with_card_id_model/create_connection_with_card_id_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardViewAddReminderContainer extends StatelessWidget {
  const CardViewAddReminderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, cardState) {
        return GestureDetector(
          onTap: () {
            if (cardState.anotherCard?.connectionId != null) {
              Navigator.push(
                context,
                fadePageRoute(PreviewHomeAddReminderScreen()),
              );
            } else {
              context.read<ConnectionRequestBloc>().add(
                  ConnectionRequestEvent.addConnection(
                      createConnectionWithCardIdModel:
                          CreateConnectionWithCardIdModel(
                              cardId: cardState.anotherCard?.id)));
            }
          },
          child: BlocBuilder<ConnectionRequestBloc, ConnectionRequestState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                    child: CircularProgressIndicator(color: neonShade));
              } else {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    border: Border.all(
                      color: textFieldFillColr,
                    ),
                  ),
                  height: 70,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(
                          'asset/images/addButtunIconImage.png',
                        ),
                      ),
                      adjustWidth(kwidth * .03),
                      Text(
                          cardState.anotherCard!.connectionId != null
                              ? 'Add Reminder'
                              : 'Add Connection',
                          style: textHeadStyle1),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
