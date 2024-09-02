import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/image_preview/image_slidable_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardProductDetailView extends StatefulWidget {
  const CardProductDetailView(
      {super.key, required this.myCard, required this.product});

  final Product product;
  final bool myCard;

  @override
  State<CardProductDetailView> createState() => _CardProductDetailViewState();
}

class _CardProductDetailViewState extends State<CardProductDetailView> {
  TextEditingController tittleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late bool switchValue;
  late List<ImageCard> updateImageCard;
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    updateImageCard = widget.product.images ?? [];
    switchValue = widget.product.enquiry ?? false;
    tittleController.text = widget.product.title ?? '';
    descriptionController.text = widget.product.description ?? '';
    _pageController = PageController(initialPage: _currentPageIndex);

    bool forward = true;
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPageIndex == widget.product.images!.length - 1 ||
          _currentPageIndex == 0) {
        forward = !forward;
      }
      if (forward && _currentPageIndex < widget.product.images!.length - 1) {
        _currentPageIndex++;
      } else if (!forward && _currentPageIndex > 0) {
        _currentPageIndex--;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: !widget.myCard
            ? []
            : [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ],
        title: const Text('Product'),
        backgroundColor: knill,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 17,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              adjustHieght(30),
              SizedBox(
                height: khieght * .3,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.product.images?.length,
                  scrollDirection: Axis.horizontal,
                  // physics: const NeverScrollableScrollPhysics(),
                  // separatorBuilder: (context, index) => adjustWidth(10),
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
                              Navigator.of(context).push(cardFadePageRoute(
                                  SlidablePhotoGallery(
                                      initialIndex: index,
                                      images: (widget.product.images ?? [])
                                          .map((e) => e.image ?? '')
                                          .toList())));
                            },
                            child: SizedBox(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.memory(
                                    base64.decode(
                                      widget.product.images?[index].image ?? '',
                                    ),
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              adjustHieght(30),
              !widget.myCard
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        tittleController.text,
                        style: const TextStyle(fontSize: 20),
                      ),
                    )
                  : CustomTextFormField(
                      labelText: 'Tittle',
                      textSize: 0.045,
                      controller: tittleController,
                    ),
              !widget.myCard
                  ? Text(descriptionController.text)
                  : CustomTextFormField(
                      labelText: 'Description',
                      controller: descriptionController,
                      validate: Validate.notNull,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 8,
                    ),
              adjustHieght(30),
            ],
          ),
        ),
      ),
    );
  }
}
