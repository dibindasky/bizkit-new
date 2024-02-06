import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/first_half_sction/my_connections/view_all_connection_contacts.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyConnectionContainer extends StatelessWidget {
  const MyConnectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My connections', style: textHeadStyle1),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  fadePageRoute(const MyConnectionsViewAllContacts()),
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
        adjustHieght(khieght * .03),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
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
    );
  }
}
