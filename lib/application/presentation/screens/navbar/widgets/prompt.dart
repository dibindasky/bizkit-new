import 'package:bizkit/application/business_logic/promt/promt_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/connections/add_connection_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromptHomePage extends StatelessWidget {
  const PromptHomePage({
    super.key,
    required this.showPrompt,
  });
  final bool showPrompt;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromtBloc, PromtState>(
      builder: (context, state) {
        if (state.show && showPrompt) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    // height: 50,
                    width: kwidth * 0.80,
                    decoration: BoxDecoration(
                        border: Border.all(color: neonShade),
                        color: kblack,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        Expanded(flex: 3, child: Text(state.message ?? '')),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: neonShade,
                              foregroundColor: kwhite,
                            ),
                            onPressed: () {
                              if (!state.hasCard) {
                                Navigator.of(context).push(
                                  fadePageRoute(
                                    const StartingBusinessCardCreation(
                                        fromHome: true),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  fadePageRoute(
                                    ScreenAddConnections(),
                                  ),
                                );
                              }
                              context.read<PromtBloc>().add(
                                    const PromtEvent.closePrompt(),
                                  );
                            },
                            child: const FittedBox(child: Text('Go')),
                          ),
                        ),
                        adjustWidth(10),
                        InkWell(
                          onTap: () => context
                              .read<PromtBloc>()
                              .add(const PromtEvent.closePrompt()),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            child: ColoredBox(
                              color: neonShade.withOpacity(0.5),
                              child: const Icon(
                                Icons.clear,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
