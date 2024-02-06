import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyCardsAndAddCardSection extends StatelessWidget {
  const MyCardsAndAddCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Cards', style: textHeadStyle1),
          adjustHieght(khieght * .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: kwidth * 0.35,
                width: kwidth * 0.55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: neonShade,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Alex Tyler', style: textHeadStyle1),
                        Text(
                          'UIxUX Designer',
                          style: TextStyle(fontSize: kwidth * .037),
                        ),
                        Image.asset('asset/images/home logo 1.png'),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right,
                      color: kwhite,
                    )
                  ],
                ),
              ),
              adjustWidth(kwidth * .03),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    fadePageRoute(const StartingBusinessCardCreation()),
                  ),
                  child: Container(
                    height: kwidth * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: backgroundColour,
                      boxShadow: const [
                        BoxShadow(
                          color: kblack,
                          blurRadius: 2,
                          blurStyle: BlurStyle.outer,
                        )
                      ],
                    ),
                    width: 140,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(
                            'asset/images/home add circl.png',
                          ),
                        ),
                        Text('Add Card'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
