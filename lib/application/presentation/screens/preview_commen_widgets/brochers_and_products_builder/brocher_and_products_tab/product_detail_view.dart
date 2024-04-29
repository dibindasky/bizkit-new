import 'dart:async';
import 'dart:convert';

import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/widgets/image_slidable_list.dart';
import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:flutter/material.dart';

class ProductViewDetail extends StatefulWidget {
  const ProductViewDetail(
      {super.key, required this.product, required this.myCard});

  final Product product;
  final bool myCard;

  @override
  State<ProductViewDetail> createState() => _ProductViewDetailState();
}

class _ProductViewDetailState extends State<ProductViewDetail> {
  TextEditingController tittleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late bool switchValue;
  late List<ImageCard> updateImageCard;
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    updateImageCard = widget.product.image ?? [];
    switchValue = widget.product.enquiry ?? false;
    tittleController.text = widget.product.label ?? '';
    descriptionController.text = widget.product.description ?? '';
    _pageController = PageController(initialPage: _currentPageIndex);

    bool forward = true;
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPageIndex == widget.product.image!.length - 1 ||
          _currentPageIndex == 0) {
        forward = !forward;
      }
      if (forward && _currentPageIndex < widget.product.image!.length - 1) {
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
                  itemCount: widget.product.image!.length,
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
                              Navigator.of(context).push(fadePageRoute(
                                  SlidablePhotoGallery(
                                      images: updateImageCard
                                          .map((e) => e.image!)
                                          .toList())));
                            },
                            child: SizedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: widget.product.image != null &&
                                        widget.product.image!.isNotEmpty
                                    ? Image.memory(
                                        base64.decode(
                                          widget.product.image![index].image!
                                                  .startsWith('data')
                                              ? widget
                                                  .product.image![index].image!
                                                  .substring(22)
                                              : widget
                                                  .product.image![index].image!,
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
              adjustHieght(30),
              !widget.myCard
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        tittleController.text,
                        style: const TextStyle(fontSize: 20),
                      ),
                    )
                  : TTextFormField(
                      text: 'Tittle',
                      textSize: 0.045,
                      controller: tittleController,
                    ),
              !widget.myCard
                  ? Text(descriptionController.text)
                  : TTextFormField(
                      text: 'Description',
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
