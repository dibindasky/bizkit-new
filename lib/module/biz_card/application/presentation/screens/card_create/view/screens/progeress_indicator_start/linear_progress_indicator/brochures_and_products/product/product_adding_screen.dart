import 'dart:convert';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/image_slidable_list.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardAddPrductsScreen extends StatefulWidget {
  const CardAddPrductsScreen({Key? key, this.product}) : super(key: key);

  final Product? product;

  @override
  State<CardAddPrductsScreen> createState() => _CardAddPrductsScreenState();
}

class _CardAddPrductsScreenState extends State<CardAddPrductsScreen> {
  @override
  void initState() {
    if (widget.product != null) {
      final businessController = Get.find<BusinesDetailsController>();
      businessController.businessProductName.text = widget.product!.title ?? '';
      businessController.businessProductDescription.text =
          widget.product!.description ?? '';
      businessController.productExistingImages = widget.product!.images ?? [];
      businessController.productEnquiry.value =
          widget.product!.enquiry ?? false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final businessController = Get.find<BusinesDetailsController>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(kwidth, 70),
          child: CardAppbarCommen(
              // onTap: () => Navigator.pop(context),
              tittle: widget.product?.id == null
                  ? 'Add product'
                  : 'Update product'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  adjustHieght(khieght * .05),
                  SizedBox(
                      height: 200.dm,
                      child: Stack(children: [
                        SizedBox(
                          height: 200.dm,
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount:
                                businessController.productExistingImages.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(cardFadePageRoute(
                                      SlidablePhotoGallery(
                                          initialIndex: index,
                                          images: businessController
                                              .productExistingImages.reversed
                                              .map((e) => e.image!)
                                              .toList())));
                                },
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: 300.dm,
                                      height: 200.dm,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.memory(
                                          base64.decode(
                                            businessController
                                                .productExistingImages
                                                .map((e) => e.image ?? '')
                                                .toList()[index],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: ColoredBox(
                                          color: neonShade,
                                          child: IconButton(
                                            onPressed: () {
                                              showCustomConfirmationDialogue(
                                                context: context,
                                                buttonText: 'Delete',
                                                title:
                                                    'You want to delete product image',
                                                onTap: () {
                                                  if (widget.product != null &&
                                                      businessController
                                                              .productExistingImages
                                                              .length ==
                                                          1) {
                                                    showSnackbar(context,
                                                        message:
                                                            'Atleast one product image should be there',
                                                        backgroundColor: kred);
                                                    return;
                                                  }
                                                  businessController
                                                      .productNewImageList
                                                      .removeWhere((element) =>
                                                          element ==
                                                          businessController
                                                                  .productExistingImages[
                                                              businessController
                                                                      .productExistingImages
                                                                      .length -
                                                                  1 -
                                                                  index]);
                                                  businessController
                                                      .productExistingImages
                                                      .removeAt(businessController
                                                              .productExistingImages
                                                              .length -
                                                          1 -
                                                          index);
                                                  setState(() {});
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                                size: 30,
                                                color: kwhite,
                                                Icons.delete),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return kWidth10;
                            },
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: InkWell(
                            onTap: () {
                              cameraAndGalleryPickImage(
                                  context: context,
                                  onPressCam: () async {
                                    final img = await ImagePickerClass.getImage(
                                        camera: true);
                                    if (img != null) {
                                      businessController.productExistingImages
                                          .add(ImageCard(image: img.base64));
                                      businessController.productNewImageList
                                          .add(ImageCard(image: img.base64));
                                      setState(() {});
                                    }
                                  },
                                  onPressGallery: () async {
                                    final img = await ImagePickerClass.getImage(
                                        camera: false);
                                    if (img != null) {
                                      businessController.productExistingImages
                                          .add(ImageCard(image: img.base64));
                                      businessController.productNewImageList
                                          .add(ImageCard(image: img.base64));
                                      setState(() {});
                                    }
                                  });
                            },
                            child: const CircleAvatar(
                                radius: 30,
                                child: Icon(Icons.add_a_photo_outlined)),
                          ),
                        )
                      ])),
                  adjustHieght(khieght * .02),
                  CustomTextFormField(
                    labelText: 'Name',
                    controller: businessController.businessProductName,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    maxlegth: 50,
                  ),
                  CustomTextFormField(
                    labelText: 'Description',
                    maxLines: 10,
                    controller: businessController.businessProductDescription,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.sentences,
                    maxlegth: 500,
                  ),
                  adjustHieght(khieght * .02),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: textFieldFillColr,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Add Enquiry Button'),
                        Obx(
                          () => Switch(
                            value: businessController.productEnquiry.value,
                            onChanged: (value) {
                              businessController.enquiryValueChange();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  adjustHieght(khieght * .03),
                  Obx(
                    () => businessController.isLoading.value
                        ? const LoadingAnimation()
                        : EventButton(
                            text: widget.product?.id == null
                                ? 'Add product'
                                : 'Update',
                            onTap: () {
                              if (businessController
                                      .businessProductName.text.isEmpty ||
                                  businessController.businessProductDescription
                                      .text.isEmpty) {
                                showSnackbar(context,
                                    message: businessController
                                            .productExistingImages.isEmpty
                                        ? 'Add atleast one product Image'
                                        : businessController.businessProductName
                                                .text.isEmpty
                                            ? 'Add product title'
                                            : 'Add product Description',
                                    textColor: kwhite,
                                    backgroundColor: kred);
                                return;
                              }
                              businessController.productAdding();
                              Navigator.pop(context);
                            },
                          ),
                  ),
                  adjustHieght(khieght * .04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
