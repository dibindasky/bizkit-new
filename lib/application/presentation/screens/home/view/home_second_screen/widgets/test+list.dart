import 'package:bizkit/application/commen/const.dart';
import 'package:flutter/material.dart';

class TestSecondAnimationPageListView extends StatefulWidget {
  const TestSecondAnimationPageListView({
    this.scrollController,
    this.doTransition = false,
    super.key,
  });
  final ScrollController? scrollController;
  final bool doTransition;

  @override
  State<TestSecondAnimationPageListView> createState() =>
      _TestSecondAnimationPageListViewState();
}

class _TestSecondAnimationPageListViewState
    extends State<TestSecondAnimationPageListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return ListView.separated(
            controller: widget.scrollController,
            separatorBuilder: (context, index) => adjustHieght(khieght * .02),
            itemCount: 5,
            itemBuilder: (context, index) {
              List names = [
                'Joshua',
                'Anagh',
                'Santhosh',
                'Febin',
                'Dibin',
              ];
              List image = [
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoKJPxxwPeNvISnBbZsZHe887Ws0FnrL7o0w&usqp=CAU',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm3gg3rbRr7rpvpYvr5viM9Bi1L3LglCYQ7w&usqp=CAU',
                'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE4g-3ZH_1TjfN-zOuCRru2LrfrGtPbwaCsQ&usqp=CAU',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2fU6VWMdDDAYhNv6NQiHuGeXP3KKtPwVHew&usqp=CAU',
              ];
              if (widget.doTransition && index == 0) {
                return Transform.translate(
                    offset: Offset(0, 100 * _animation.value),
                    child: listTileCard(image[index], names[index]));
              } else if (widget.doTransition && index == 1) {
                return Transform.translate(
                    offset: Offset(0, -100 * _animation.value),
                    child: listTileCard(image[index], names[index]));
              }
              return listTileCard(image[index], names[index]);
            },
          );
        });
  }

  Container listTileCard(String image, String names) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.only(right: 8),
      height: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(3.0, 3.0),
              spreadRadius: -2.0,
            )
          ],
          color: backgroundColour),
      child: Row(
        children: [
          Container(
            width: kwidth * 0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              color: klightgrey,
            ),
          ),
          adjustWidth(kwidth * .03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Archived Discussion with \n$names',
                style: textHeadStyle1,
              ),
              Text(
                '11 Nov  11:45 AM',
                style: textStyle1,
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
  }
}
