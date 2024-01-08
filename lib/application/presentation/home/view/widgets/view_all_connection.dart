import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/home/view/widgets/connection_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewAllConnections extends StatelessWidget {
  ViewAllConnections({super.key});

  List<String> list = [
    'Angel',
    'Bubbles',
    'Shimmer',
    'Angelic',
    'Bubbly',
    'Glimmer',
    'Baby',
    'Pink',
    'Little',
    'Butterfly',
    'Sparkly',
    'Doll',
    'Sweet',
    'Sparkles',
    'Dolly',
    'Sweetie',
    'Sprinkles',
    'Lolly',
    'Princess',
    'Dairy',
    'Honey',
    'Snowflake',
    'Pretty',
    'Sugar',
    'Cherub',
    'Lovely',
    'Blossom',
    'Ecophobia',
    'Hippophobia',
    'Scolionophobia',
    'Ergophobia',
    'Musophobia',
    'Zemmiphobia',
    'Geliophobia',
    'Tachophobia',
    'Hadephobia',
    'Radiophobia',
    'Turbo Slayer',
    'Cryptic Hatter',
    'Crash TV',
    'W',
    'Blue Defender',
    'Toxic Headshot'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    list.sort();
    Map<String, List<String>> groupedNames = {};

    for (String name in list) {
      String firstLetter = name[0].toUpperCase();
      if (!groupedNames.containsKey(firstLetter)) {
        groupedNames[firstLetter] = [];
      }
      groupedNames[firstLetter]?.add(name);
    }
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
        title: Text(
          'My Connections',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CupertinoTextField(
              prefix: const Icon(
                Icons.search,
                color: kwhite,
              ),
              style: const TextStyle(
                color: kwhite,
              ),
              placeholder: 'Search Connection',
              placeholderStyle: const TextStyle(
                fontSize: 16,
                color: klightgrey,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: textFieldFillColr,
              ),
              cursorColor: kwhite,
              suffix: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.mic),
                    color: kwhite,
                    onPressed: () {},
                  ),
                  RotatedBox(quarterTurns: 1,
                    child: IconButton(
                      icon: const Icon(Icons.compare_arrows_rounded),
                      color: kwhite,
                      onPressed: () {},
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_alt),
                    color: kwhite,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            adjustHieght(kwidth * .02),
            Container(
              height: 20,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                gradient: neonShadeGradient,
              ),
              child: const Row(
                children: [
                  Text("A"),
                ],
              ),
            ),
            adjustHieght(kwidth * .05),
            Expanded(
              child: AlphabetScrollView(
                list: list.map((e) => AlphaModel(e)).toList(),
                alignment: LetterAlignment.right,
                itemExtent: 50,
                unselectedTextStyle: TextStyle(
                  fontSize: kwidth * .042,
                  color: smallBigGrey,
                ),
                selectedTextStyle:
                    TextStyle(fontSize: kwidth * .049, color: kwhite),
                overlayWidget: (value) => Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.star_border_sharp,
                      size: 50,
                      color: neonShade,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        value.toUpperCase(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                itemBuilder: (context, index, __) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      fadePageRoute(ListTileDetailView(name: list[index])),
                    ),
                    child: ListTile(
                      leading: const Stack(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage(
                              'asset/images/person2.jpeg',
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Icon(
                              Icons.circle,
                              size: 10,
                              color: kgreen,
                            ),
                          ),
                        ],
                      ),
                      title: Row(
                        children: [
                          Text(
                            list[index],
                            style: TextStyle(
                              fontSize: kwidth * .040,
                            ),
                          ),
                          adjustWidth(kwidth * .03),
                          Text(
                            'Developer',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: kwidth * .031,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
