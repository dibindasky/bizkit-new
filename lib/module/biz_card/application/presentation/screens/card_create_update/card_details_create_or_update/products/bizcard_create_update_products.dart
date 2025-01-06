import 'dart:convert';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/product.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BizcardProductCreateUpdateScreen extends StatefulWidget {
  const BizcardProductCreateUpdateScreen(
      {Key? key, this.product, this.selctedIndex})
      : super(key: key);

  final Product? product;
  final int? selctedIndex;

  @override
  State<BizcardProductCreateUpdateScreen> createState() =>
      _BizcardProductCreateUpdateScreenState();
}

class _BizcardProductCreateUpdateScreenState
    extends State<BizcardProductCreateUpdateScreen> {
  final businessController = Get.find<BusinesDetailsController>();
  @override
  void initState() {
    if (widget.product != null) {
      businessController.businessProductName.text = widget.product!.title ?? '';
      businessController.businessProductDescription.text =
          widget.product!.description ?? '';
      businessController.businessProductLink.text =
          widget.product!.productLink ?? '';
      businessController.productImages.assignAll(widget.product?.images
              ?.map((e) => ImageCard(image: e, networkImage: true)) ??
          []);
      businessController.productEnquiry.value =
          widget.product!.enquiry ?? false;
    }
    super.initState();
  }

  @override
  void dispose() {
    businessController.productImages.value = [];
    super.dispose();
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  kHeight10,
                  Row(
                    children: [
                     
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 15.sp,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                      kWidth10,
                      Text(
                          widget.product?.id == null
                              ? 'Add product'
                              : 'Update product',
                          style: Theme.of(context).textTheme.displayMedium)
                    ],
                  ),
                  kHeight10,
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: kGreyNormal ),
                        borderRadius: BorderRadius.circular(20)),
                          height: 200.dm,
                          width: double.infinity,
                          child: businessController.productImages.isEmpty
                              ? Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      splashRadius: 1,
                                      splashColor: knill,
                                      onPressed: () {
                                        chooseImageProduct(
                                            context, businessController);
                                      },
                                      icon: const Icon(
                                        Icons.add_a_photo_outlined,
                                        color: neonShade,
                                      )),
                                      Text('Add Product Images',style: Theme.of(context).textTheme.titleSmall,)
                                ],
                              )
                              : Stack(children: [
                                  SizedBox(
                                    height: 200.dm,
                                    width: double.infinity,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: businessController
                                          .productImages.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final data = businessController
                                            .productImages.reversed
                                            .toList()[index];
                                        return InkWell(
                                          onTap: () {
                                            GoRouter.of(context).pushNamed(
                                                Routes.slidablePhotoGallery,
                                                extra: {
                                                  'images':[data.image!] ,
                                                  'initial': index,
                                                  'memory':data.networkImage?false:true ,
                                                });
                                          },
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                width: 250.dm,
                                                height: 200.dm,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: data.networkImage
                                                      ? NetworkImageWithLoader(
                                                          data.image ?? '')
                                                      : Image.memory(
                                                          base64.decode(
                                                            data.image ?? '',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 10,
                                                right: 20,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                            if (widget.product !=
                                                                    null &&
                                                                businessController
                                                                        .productImages
                                                                        .length ==
                                                                    1) {
                                                              showSnackbar(
                                                                  context,
                                                                  message:
                                                                      'Atleast one product image should be there',
                                                                  backgroundColor:
                                                                      kred);
                                                              return;
                                                            }
                                                            businessController
                                                                .productImages
                                                                .removeWhere((e) =>
                                                                    e.image ==
                                                                        data
                                                                            .image &&
                                                                    e.networkImage ==
                                                                        data.networkImage);
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
                                ])),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () =>
                              chooseImageProduct(context, businessController),
                          child: const CircleAvatar(
                            backgroundColor: neonShade,
                            child: Icon(Icons.add),
                          ),
                        ),
                      )
                    ],
                  ),
                  adjustHieght(khieght * .02),
                  CustomTextFormField(
                    labelText: 'Name',
                    controller: businessController.businessProductName,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.sentences,
                    maxlegth: 50,
                  ),
                  kHeight10,
                  CustomTextFormField(
                    labelText: 'Product Prolio link',
                    controller: businessController.businessProductLink,
                    inputType: TextInputType.url,
                    maxlegth: 50,
                  ),
                  kHeight10,
                  CustomTextFormField(
                    labelText: 'Description',
                    maxLines: 5,
                    controller: businessController.businessProductDescription,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.sentences,
                    maxlegth: 500,
                  ),
                  adjustHieght(khieght * .02),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: kgrey),
                     
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Enable Enquiry',
                            style: Theme.of(context).textTheme.displaySmall),
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
                            showGradiant: false,
                            text: widget.product?.id == null
                                ? 'Add product'
                                : 'Update',
                            onTap: () {
                              if (businessController.productImages.isEmpty ||
                                  businessController
                                      .businessProductName.text.isEmpty ||
                                  businessController.businessProductDescription
                                      .text.isEmpty) {
                                showSnackbar(context,
                                    message:
                                        businessController.productImages.isEmpty
                                            ? 'Add atleast one Product Image'
                                            : businessController
                                                    .businessProductName
                                                    .text
                                                    .isEmpty
                                                ? 'Add Product Title'
                                                : 'Add Product Description',
                                    textColor: kwhite,
                                    backgroundColor: kred);
                                return;
                              }
                              if (widget.product?.id == null) {
                                businessController.productAdding(context);
                              } else {
                                businessController.productUpdating(
                                    context: context,
                                    productIndex: widget.selctedIndex ?? 0);
                              }
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

  Future<dynamic> chooseImageProduct(
      BuildContext context, BusinesDetailsController businessController) {
    return cameraAndGalleryPickImage(
        tittle: 'Choose product image',
        context: context,
        onPressCam: () async {
          final img = await ImagePickerClass.getImage(camera: true);
          if (img != null) {
            businessController.productImages
                .add(ImageCard(image: img.base64 ?? ''));
            setState(() {});
          }
        },
        onPressGallery: () async {
          final img = await ImagePickerClass.getImage(camera: false);
          if (img != null) {
            businessController.productImages
                .add(ImageCard(image: img.base64 ?? ''));
            setState(() {});
          }
        });
  }
}
