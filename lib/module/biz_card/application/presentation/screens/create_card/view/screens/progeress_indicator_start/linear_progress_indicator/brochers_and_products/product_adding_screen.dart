import 'dart:convert';

import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPrductsScreen extends StatefulWidget {
  const AddPrductsScreen({Key? key}) : super(key: key);

  //final Product? product;

  @override
  State<AddPrductsScreen> createState() => _AddPrductsScreenState();
}

class _AddPrductsScreenState extends State<AddPrductsScreen> {
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  // List<ImageCard> imageList = [];
  // List<ImageCard> newImageList = [];
  bool switchValue = false;

  @override
  void initState() {
    // if (widget.product != null) {
    //   productTitleController.text = widget.product!.label ?? '';
    //   productDescriptionController.text = widget.product!.description ?? '';
    //   imageList = widget.product!.image ?? <ImageCard>[];
    //   switchValue = widget.product!.enquiry ?? false;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: const CardAppbarCommen(tittle: 'Update product'),
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
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              // final imageProduct =
                              //     imageList[imageList.length - 1 - index];
                              return InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //     cardFadePageRoute(
                                  //         SlidablePhotoGallery(
                                  //             initialIndex: index,
                                  //             images: imageList.reversed
                                  //                 .map((e) => e.image!)
                                  //                 .toList())));
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
                                              imageTestingBase64.substring(22)),
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
                                                  //   if (widget.product !=
                                                  //           null &&
                                                  //       imageList.length ==
                                                  //           1) {
                                                  //     showSnackbar(context,
                                                  //         message:
                                                  //             'Atleast one product image should be there',
                                                  //         backgroundColor:
                                                  //             kred);
                                                  //     return;
                                                  //   }
                                                  //   if (imageList[imageList
                                                  //                   .length -
                                                  //               1 -
                                                  //               index]
                                                  //           .id !=
                                                  //       null) {
                                                  //     context
                                                  //         .read<
                                                  //             BusinessDataBloc>()
                                                  //         .add(BusinessDataEvent
                                                  //             .removeProductIndexImages(
                                                  //                 index: imageList[imageList.length -
                                                  //                         1 -
                                                  //                         index]
                                                  //                     .id!));
                                                  //   }
                                                  //   newImageList.removeWhere(
                                                  //       (element) =>
                                                  //           element ==
                                                  //           imageList[imageList
                                                  //                   .length -
                                                  //               1 -
                                                  //               index]);
                                                  //   imageList.removeAt(
                                                  //       imageList.length -
                                                  //           1 -
                                                  //           index);
                                                  //   setState(() {});
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              size: 30,
                                              color: kwhite,
                                              Icons.delete,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return adjustWidth(10);
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
                                    // if (img != null) {
                                    //   imageList.add(
                                    //       ImageCard(image: img.base64));
                                    //   newImageList.add(
                                    //       ImageCard(image: img.base64));
                                    //   setState(() {});
                                    // }
                                  },
                                  onPressGallery: () async {
                                    final img = await ImagePickerClass.getImage(
                                        camera: false);
                                    // if (img != null) {
                                    //   imageList.add(
                                    //       ImageCard(image: img.base64));
                                    //   newImageList.add(
                                    //       ImageCard(image: img.base64));
                                    //   setState(() {});
                                    // }
                                  });
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              child: Icon(Icons.add_a_photo_outlined),
                            ),
                          ),
                        )
                      ])),
                  adjustHieght(khieght * .02),
                  CustomTextFormField(
                    labelText: 'Name',
                    controller: productTitleController,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    maxlegth: 50,
                  ),
                  CustomTextFormField(
                    labelText: 'Description',
                    maxLines: 10,
                    controller: productDescriptionController,
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
                        const Text('Add Enquire Button'),
                        Switch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  adjustHieght(khieght * .03),
                  EventButton(
                    text: 'Save product',
                    onTap: () {
                      if (productDescriptionController.text.isEmpty ||
                          productTitleController.text.isEmpty) {
                        // showSnackbar(context,
                        //     message: imageList.isEmpty
                        //         ? 'Add atleast one product Image'
                        //         : productTitleController.text.isEmpty
                        //             ? 'Add product title'
                        //             : 'Add product Description',
                        //     textColor: kwhite,
                        //     backgroundColor: kred);
                        return;
                      }

                      // final product = Product(
                      //   id: widget.product?.id,
                      //   description:
                      //       productDescriptionController.text.trim(),
                      //   label: productTitleController.text.trim(),
                      //   image: widget.product?.id == null
                      //       ? imageList
                      //       : newImageList,
                      //   //[ImageCard(image: image!.base64)],
                      //   enquiry: switchValue,
                      //   cardId: state.currentCard!.id,
                      // );
                      // context.read<BusinessDataBloc>().add(
                      //     BusinessDataEvent.addProduct(
                      //         product: product,
                      //         edit: widget.product != null));
                      // Navigator.pop(context);
                    },
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
