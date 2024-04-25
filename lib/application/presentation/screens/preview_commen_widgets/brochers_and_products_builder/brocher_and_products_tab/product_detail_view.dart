import 'dart:convert';

import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/widgets/image_preview.dart';
import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  void initState() {
    updateImageCard = widget.product.image ?? [];
    switchValue = widget.product.enquiry ?? false;
    tittleController.text = widget.product.label ?? '';
    descriptionController.text = widget.product.description ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: !widget.myCard
            ? []
            : [
                IconButton(
                  onPressed: () {
                    cameraAndGalleryPickImage(
                      tittle: 'Choose image',
                      context: context,
                      onPressCam: () {
                        context.read<BusinessDataBloc>().add(
                            BusinessDataEvent.productUpdatePickImage(
                                productId: widget.product.id!,
                                isCam: true,
                                isFront: true));
                      },
                      onPressGallery: () {
                        context
                            .read<BusinessDataBloc>()
                            .add(BusinessDataEvent.productUpdatePickImage(
                              isCam: false,
                              isFront: false,
                              productId: widget.product.id!,
                            ));
                      },
                    );
                  },
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // if (widget.product.image != null)
                BlocConsumer<BusinessDataBloc, BusinessDataState>(
                  listener: (context, state) {
                    if (state.productImageupdated) {
                      // context.read<CardBloc>().add(
                      //     CardEvent.getCardyCardId(id: state.currentCard!.id!));
                    }
                  },
                  builder: (context, state) {
                    // if (state.productUpdateImages.isNotEmpty) {
                    //   updateImageCard.addAll(state.productUpdateImages);
                    // }
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return adjustHieght(10);
                      },
                      itemCount: widget.product.image!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return state.pickImageLoading && !widget.myCard
                            ? SizedBox(
                                height: khieght * .3,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: neonShade,
                                  ),
                                ),
                              )
                            : Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: neonShade,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            fadePageRoute(ScreenImagePreview(
                                          image: widget
                                              .product.image![index].image!,
                                        )));
                                      },
                                      child: SizedBox(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: widget.product.image != null
                                              ? Image.memory(
                                                  base64.decode(
                                                    widget.product.image![index]
                                                            .image!
                                                            .startsWith('data')
                                                        ? widget
                                                            .product
                                                            .image![index]
                                                            .image!
                                                            .substring(22)
                                                        : widget
                                                            .product
                                                            .image![index]
                                                            .image!,
                                                  ),
                                                  filterQuality:
                                                      FilterQuality.high,
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
                                  !widget.myCard
                                      ? kempty
                                      : Positioned(
                                          bottom: 10,
                                          right: 10,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: ColoredBox(
                                              color: neonShade,
                                              child: IconButton(
                                                onPressed: () {
                                                  showCustomConfirmationDialogue(
                                                    context: context,
                                                    buttonText: 'Delete',
                                                    title:
                                                        'You want to remove your product image',
                                                    onTap: () {
                                                      context
                                                          .read<
                                                              BusinessDataBloc>()
                                                          .add(BusinessDataEvent
                                                              .removeProductImages(
                                                                  id: widget
                                                                      .product
                                                                      .image![
                                                                          index]
                                                                      .id!));
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
                              );
                      },
                    );
                  },
                ),
                // product.image != null
                //     ? Image.memory(base64.decode(
                //         product.image![0].image!.startsWith('data')
                //             ? product.image![0].image!.substring(22)
                //             : product.image![0].image!))
                //     : Image.asset(emptyNodata3),
                adjustHieght(30),
                !widget.myCard
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(tittleController.text),
                      )
                    : TTextFormField(
                        text: 'Tittle',
                        controller: tittleController,
                      ),
                !widget.myCard
                    ? Text(descriptionController.text)
                    : TTextFormField(
                        text: 'Description',
                        controller: descriptionController,
                        validate: Validate.notNull,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 7,
                      ),
                // Container(
                //   padding: const EdgeInsets.only(left: 10),
                //   decoration: BoxDecoration(
                //     color: textFieldFillColr,
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const Text('Add Enquire Button'),
                //       Switch(
                //         value: switchValue,
                //         onChanged: (value) {
                //           setState(() {
                //             switchValue = value;
                //           });
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                adjustHieght(30),
                !widget.myCard
                    ? kempty
                    : BlocConsumer<BusinessDataBloc, BusinessDataState>(
                        listener: (context, state) {
                          if (state.pickImageError) {
                            showSnackbar(
                              context,
                              message: 'Image picking failed',
                              backgroundColor: kred,
                            );
                          }
                          if (state.productUpdated) {
                            showSnackbar(context,
                                message: 'Product Successfully updated');
                            context.read<CardBloc>().add(
                                CardEvent.getCardyCardId(
                                    id: state.currentCard!.id!));
                            Navigator.pop(context);
                          }
                          if (state.productImageupdated) {
                            context.read<CardBloc>().add(
                                CardEvent.getCardyCardId(
                                    id: state.currentCard!.id!));
                          }
                        },
                        builder: (context, state) {
                          // if (state.productLoading) {
                          //   return const LoadingAnimation();
                          // }
                          return state.productUpdateLoading
                              ? const LoadingAnimation()
                              : AuthButton(
                                  text: 'Save product',
                                  onTap: () {
                                    if (tittleController.text.isEmpty ||
                                        descriptionController.text.isEmpty ||
                                        updateImageCard.isEmpty) {
                                      showSnackbar(context,
                                          message: updateImageCard.isEmpty
                                              ? 'Add atleast one product Image'
                                              : tittleController.text.isEmpty
                                                  ? 'Add product title'
                                                  : 'Add product Description',
                                          textColor: kwhite,
                                          backgroundColor: kred);
                                      return;
                                    }
                                    final product = Product(
                                      description:
                                          descriptionController.text.trim(),
                                      label: tittleController.text.trim(),
                                      image: updateImageCard,
                                      //[ImageCard(image: image!.base64)],
                                      enquiry: switchValue,
                                      cardId: state.currentCard!.id,
                                    );
                                    context.read<BusinessDataBloc>().add(
                                        BusinessDataEvent.updateProduct(
                                            product: product,
                                            id: widget.product.id!));
                                    // Navigator.pop(context);
                                  },
                                );
                        },
                      ),
                adjustHieght(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
