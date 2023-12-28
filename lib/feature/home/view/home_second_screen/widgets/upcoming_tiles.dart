import 'package:bizkit/core/const.dart';
import 'package:flutter/material.dart';

class UpcomingTiles extends StatelessWidget {
  const UpcomingTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => adjustHieght(khieght * .02),
      itemCount: 5,
      itemBuilder: (context, index) {
        List names = [
          'Sebin',
          'Jibin',
          'Dibin',
          'Helan',
          'Santhosh',
        ];
        List image = [
          'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE4g-3ZH_1TjfN-zOuCRru2LrfrGtPbwaCsQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoKJPxxwPeNvISnBbZsZHe887Ws0FnrL7o0w&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm3gg3rbRr7rpvpYvr5viM9Bi1L3LglCYQ7w&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2fU6VWMdDDAYhNv6NQiHuGeXP3KKtPwVHew&usqp=CAU',
        ];
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          height: 100,
          child: Row(
            children: [
              Container(
                width: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      image[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: kblack,
                ),
              ),
              adjustWidth(kwidth * .03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Upcoming Discussion with \n${names[index]}',
                    style: const TextStyle(
                      color: kwhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      const Text('11 Nov'),
                      adjustWidth(kwidth * .02),
                      const Text('11:45 AM'),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 15,
                backgroundColor: neonShade,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 25,
                  color: kblack,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
