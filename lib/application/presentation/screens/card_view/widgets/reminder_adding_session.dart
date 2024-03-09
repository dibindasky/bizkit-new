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
    int? createdConnectionID;
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, cardState) {
        return GestureDetector(
          onTap: () {
            if (createdConnectionID != null) {
              Navigator.push(
                context,
                fadePageRoute(PreviewHomeAddReminderScreen(
                    cardId: cardState.anotherCard!.id!,
                    connectionId: createdConnectionID!)),
              );
            } else if (cardState.anotherCard?.connectionId != null) {
              Navigator.push(
                context,
                fadePageRoute(PreviewHomeAddReminderScreen(
                    cardId: cardState.anotherCard!.id!,
                    connectionId: cardState.anotherCard!.connectionId!)),
              );
            } else if (cardState.anotherCard?.connectionRequestId == null) {
              context.read<ConnectionRequestBloc>().add(
                  ConnectionRequestEvent.addConnection(
                      createConnectionWithCardIdModel:
                          CreateConnectionWithCardIdModel(
                              cardId: cardState.anotherCard?.id)));
            }else{print('not in conditions');}
          },
          child: BlocConsumer<ConnectionRequestBloc, ConnectionRequestState>(
            listenWhen: (previous, current) => current.connected,
            listener: (context, state) {
              createdConnectionID = state.connectedId;
            },
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
                      cardState.anotherCard!.connectionRequestId != null
                          ? const SizedBox()
                          : const CircleAvatar(
                              radius: 10,
                              backgroundImage: AssetImage(
                                'asset/images/addButtunIconImage.png',
                              ),
                            ),
                      adjustWidth(kwidth * .03),
                      Text(
                          cardState.anotherCard!.connectionId != null ||createdConnectionID!=null
                              ? 'Add Reminder'
                              : cardState.anotherCard!.connectionRequestId !=
                                      null
                                  ? 'Connection Requsted'
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
