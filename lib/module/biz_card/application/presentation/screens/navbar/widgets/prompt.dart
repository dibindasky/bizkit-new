import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/business_logic/promt/promt_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/connections/add_connection_screen.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/create_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardPromptHomePage extends StatelessWidget {
  const CardPromptHomePage({
    super.key,
    required this.showPrompt,
  });
  final bool showPrompt;

  @override
  Widget build(BuildContext context) {
    if (showPrompt) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                width: 300.w,
                decoration: BoxDecoration(
                    border: Border.all(color: neonShade),
                    color: kblack,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    kWidth10,
                    const Expanded(flex: 3, child: Text('Create Card')),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                neonShade.withOpacity(.5))),
                        onPressed: () {
                          Navigator.of(context).push(cardFadePageRoute(
                            const ScreenCardCreationStarting(fromHome: true),
                          ));
                        },
                        child: FittedBox(
                            child: Text('Go',
                                style: textThinStyle1.copyWith(color: kwhite))),
                      ),
                    ),
                    kWidth10,
                    InkWell(
                      // onTap: () => context
                      //     .read<PromtBloc>()
                      //     .add(const PromtEvent.closePrompt()),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: ColoredBox(
                          color: neonShade.withOpacity(0.5),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.clear,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    kWidth10
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return kempty;
    }
  }
}
