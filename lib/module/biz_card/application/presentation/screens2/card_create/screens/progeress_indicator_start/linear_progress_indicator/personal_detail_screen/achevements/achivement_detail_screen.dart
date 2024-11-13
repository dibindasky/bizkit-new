import 'dart:async';
import 'dart:convert';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/utils/images/image_slidable_list.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';

class ScreenAchivementDetail extends StatefulWidget {
  const ScreenAchivementDetail({super.key, this.achievement});

  final Achievement? achievement;

  @override
  State<ScreenAchivementDetail> createState() => _ScreenAchivementDetailState();
}

class _ScreenAchivementDetailState extends State<ScreenAchivementDetail> {
  TextEditingController tittleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  late bool switchValue;
  late List<ImageCard> updateImageCard;
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    updateImageCard = widget.achievement?.images ?? [];
    tittleController.text = widget.achievement?.title ?? '';
    descriptionController.text = widget.achievement?.description ?? '';
    dateController.text = widget.achievement?.date ?? '';
    _pageController = PageController(initialPage: _currentPageIndex);

    bool forward = true;
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPageIndex == updateImageCard.length - 1 ||
          _currentPageIndex == 0) {
        forward = !forward;
      }
      if (forward && _currentPageIndex < updateImageCard.length - 1) {
        _currentPageIndex++;
      } else if (!forward && _currentPageIndex > 0) {
        _currentPageIndex--;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Achievement'),
          backgroundColor: knill,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 17,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kHeight30,
              SizedBox(
                height: khieght * .3,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: updateImageCard.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: khieght * .3,
                          width: khieght * .4,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: neonShade,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(cardFadePageRoute(SlidablePhotoGallery(
                                initialIndex: index,
                                images: updateImageCard
                                    .map((e) => e.image ?? '')
                                    .toList(),
                              )));
                            },
                            child: SizedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: updateImageCard.isNotEmpty
                                    ? Image.memory(
                                        base64.decode(
                                          updateImageCard[index]
                                                  .image!
                                                  .startsWith('data')
                                              ? updateImageCard[index]
                                                  .image!
                                                  .substring(22)
                                              : updateImageCard[index].image!,
                                        ),
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        emptyNodata3,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              kHeight20,
              Text(DateTimeFormater.getDateByDayMonthYear(dateController.text)),
              kHeight10,
              Text(
                tittleController.text,
                style: const TextStyle(fontSize: 20),
              ),
              kHeight10,
              Text(descriptionController.text),
              kHeight20,
            ],
          ),
        ),
      ),
    );
  }
}
