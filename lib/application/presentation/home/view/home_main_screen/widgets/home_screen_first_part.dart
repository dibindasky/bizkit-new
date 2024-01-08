import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/card_share/view/widgets/card_sharing.dart';
import 'package:bizkit/application/presentation/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/home/view/widgets/view_all_connection.dart';
import 'package:flutter/material.dart';

class HomeScreenFirstPart extends StatelessWidget {
  const HomeScreenFirstPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kwidth * 1.123,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text('Hello,\nJoi',
                      style: custumText(
                          fontSize: kwidth * 0.05,
                          fontWeight: FontWeight.w700)),
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CardSharingScreen())),
                    child: CircleAvatar(
                      radius: kwidth * 0.080,
                      backgroundColor: textFieldFillColr,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('asset/images/bizkitIcon.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('My Cards', style: textHeadStyle1),
            ),
            adjustHieght(khieght * .02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
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
                                  blurStyle: BlurStyle.outer)
                            ]),
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
            ),
            adjustHieght(khieght * .03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My connections', style: textHeadStyle1),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      fadePageRoute(ViewAllConnections()),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Card(
                        elevation: 4,
                        child: ColoredBox(
                          color: backgroundColour,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Text(
                              'View All',
                              style: TextStyle(
                                decorationColor: kwhite,
                                decorationThickness: 1.5,
                                color: kwhite,
                                fontSize: kwidth * .029,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                // shrinkWrap: true,
                separatorBuilder: (context, index) => adjustWidth(kwidth * .02),
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  List image = [
                    'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE4g-3ZH_1TjfN-zOuCRru2LrfrGtPbwaCsQ&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2fU6VWMdDDAYhNv6NQiHuGeXP3KKtPwVHew&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoKJPxxwPeNvISnBbZsZHe887Ws0FnrL7o0w&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm3gg3rbRr7rpvpYvr5viM9Bi1L3LglCYQ7w&usqp=CAU',
                  ];
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const ColoredBox(
                          color: textFieldFillColr,
                          child: SizedBox(
                            height: 40,
                            width: 60,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: kwhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image[index - 1]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
