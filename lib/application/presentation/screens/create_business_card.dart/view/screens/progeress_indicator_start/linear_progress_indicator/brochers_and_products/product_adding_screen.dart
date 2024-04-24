import 'dart:convert';

import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/widgets/image_preview.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPrductsScreen extends StatefulWidget {
  const AddPrductsScreen({Key? key}) : super(key: key);

  @override
  State<AddPrductsScreen> createState() => _AddPrductsScreenState();
}

class _AddPrductsScreenState extends State<AddPrductsScreen> {
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  ImageModel? image;

  bool switchValue = false;

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
          child: const AppbarCommen(tittle: 'Add product contents'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  adjustHieght(khieght * .05),
                  BlocBuilder<BusinessDataBloc, BusinessDataState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 200.dm,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (index == state.productImages.length) {
                              return state.pickImageLoading
                                  ? SizedBox(
                                      width: 300.dm,
                                      height: 200.dm,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: neonShade,
                                        ),
                                      ),
                                    )
                                  : ColoredBox(
                                      color: neonShade.withOpacity(0.1),
                                      child: InkWell(
                                        onTap: () async {
                                          cameraAndGalleryPickImage(
                                            tittle: 'Choose image from ?',
                                            context: context,
                                            onPressCam: () {
                                              context
                                                  .read<BusinessDataBloc>()
                                                  .add(const BusinessDataEvent
                                                      .pickProductImage(
                                                      isCam: true));
                                            },
                                            onPressGallery: () {
                                              context
                                                  .read<BusinessDataBloc>()
                                                  .add(const BusinessDataEvent
                                                      .pickProductImage(
                                                      isCam: false));
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 300.dm,
                                          height: 200.dm,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: const ColoredBox(
                                              color: textFieldFillColr,
                                              child: Icon(
                                                Icons.add_a_photo_rounded,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                            } else {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(fadePageRoute(ScreenImagePreview(
                                    image: state.productImages[index].image,
                                  )));
                                },
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: 300.dm,
                                      height: 200.dm,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.memory(
                                          base64.decode(state
                                                  .productImages[index].image
                                                  .startsWith('data')
                                              ? state.productImages[index].image
                                                  .substring(22)
                                              : state
                                                  .productImages[index].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
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
                                                  // context
                                                  //     .read<BusinessDataBloc>()
                                                  //     .add(BusinessDataEvent
                                                  //         .removeProductImages(
                                                  //       id: index,
                                                  //     ));
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
                            }
                          },
                          separatorBuilder: (context, index) {
                            return adjustWidth(10);
                          },
                          itemCount: state.productImages.length + 1,
                        ),
                      );
                    },
                  ),
                  adjustHieght(khieght * .02),
                  TTextFormField(
                    text: 'Name',
                    controller: productTitleController,
                    inputType: TextInputType.name,
                  ),
                  TTextFormField(
                    text: 'Description',
                    maxLines: 10,
                    controller: productDescriptionController,
                    inputType: TextInputType.name,
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
                  BlocConsumer<BusinessDataBloc, BusinessDataState>(
                    listener: (context, state) {
                      if (state.pickImageError) {
                        showSnackbar(
                          context,
                          message: 'Image picking failed',
                          backgroundColor: kred,
                        );
                      }
                      if (state.productAdded) {
                        context.read<CardBloc>().add(CardEvent.getCardyCardId(
                            id: state.currentCard!.id!));
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      if (state.productLoading) {
                        return const LoadingAnimation();
                      }
                      return AuthButton(
                        text: 'Save product',
                        onTap: () {
                          if (productDescriptionController.text.isEmpty ||
                              productTitleController.text.isEmpty ||
                              state.productImages.isEmpty) {
                            showSnackbar(context,
                                message: state.productImages.isEmpty
                                    ? 'Add atleast one product Image'
                                    : productTitleController.text.isEmpty
                                        ? 'Add product title'
                                        : 'Add product Description',
                                textColor: kwhite,
                                backgroundColor: kred);
                            return;
                          }

                          final product = Product(
                            description:
                                productDescriptionController.text.trim(),
                            label: productTitleController.text.trim(),
                            image: state.productImages,
                            //[ImageCard(image: image!.base64)],
                            enquiry: switchValue,
                            cardId: state.currentCard!.id,
                          );
                          context.read<BusinessDataBloc>().add(
                              BusinessDataEvent.addProduct(product: product));
                          // Navigator.pop(context);
                        },
                      );
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
