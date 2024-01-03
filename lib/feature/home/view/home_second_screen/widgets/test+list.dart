import 'package:bizkit/core/const.dart';
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
                'Febin',
                'Dibin',
                'Anagh',
                'Santhosh',
                'Joshua',
              ];
              List image = [
                'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE4g-3ZH_1TjfN-zOuCRru2LrfrGtPbwaCsQ&usqp=CAU',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2fU6VWMdDDAYhNv6NQiHuGeXP3KKtPwVHew&usqp=CAU',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm3gg3rbRr7rpvpYvr5viM9Bi1L3LglCYQ7w&usqp=CAU',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoKJPxxwPeNvISnBbZsZHe887Ws0FnrL7o0w&usqp=CAU',
              ];
              if (widget.doTransition && index == 0) {
                return Transform.translate(
                    offset: Offset(0, 100 * _animation.value),
                    child: listTileCard(image, index, names));
              } else if (widget.doTransition && index == 1) {
                return Transform.translate(
                    offset: Offset(0, -100 * _animation.value),
                    child: listTileCard(image, index, names));
              }
              return listTileCard(image, index, names);
            },
          );
        });
  }

  Container listTileCard(List<dynamic> image, int index, List<dynamic> names) {
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
                'Archived Discussion with \n${names[index]}',
                style: TextStyle(fontSize: kwidth * .038),
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
  }
}
