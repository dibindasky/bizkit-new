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
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              adjustHieght(khieght * .04),
              ListView.separated(
                separatorBuilder: (context, index) =>
                    adjustHieght(kwidth * .03),
                itemCount: products.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = products[index];
                  return SizedBox(
                    height: 260,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.memory(
                              base64.decode(
                                  data.image![0].image!.startsWith('data')
                                      ? data.image![0].image!.substring(22)
                                      : data.image![0].image!),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image)),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            color: klightgrey.withOpacity(.1),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.label ?? '',
                                        style: textStyle1.copyWith(
                                          fontSize: kwidth * .04,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        data.description ?? '',
                                        style: textStyle1.copyWith(
                                          fontSize: kwidth * .03,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                adjustWidth(kwidth * .02),
                                AuthButton(
                                  hieght: 35,
                                  wdth: 90,
                                  text: 'View',
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(fadePageRoute(ProductViewDetail(
                                      product: data,
                                      fromUpdate: false,
                                    )));
                                  },
                                ),
                                adjustWidth(kwidth * .02),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              adjustHieght(khieght * .03),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductViewDetail extends StatefulWidget {
  const ProductViewDetail(
      {super.key, required this.product, required this.fromUpdate});

  final Product product;
  final bool fromUpdate;

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
    if (widget.product.label != null &&
        widget.product.description != null &&
        widget.product.enquiry != null &&
        widget.product.image != null) {
      updateImageCard = widget.product.image!;
      switchValue = widget.product.enquiry!;
      tittleController.text = widget.product.label!;
      descriptionController.text = widget.product.description!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: !widget.fromUpdate
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
                        return state.pickImageLoading && !widget.fromUpdate
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
                                              .product.image?[index].image,
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
                                  !widget.fromUpdate &&
                                          widget.product.image!.length < 2
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
                adjustHieght(30),
                !widget.fromUpdate
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(tittleController.text),
                      )
                    : TTextFormField(
                        text: 'Tittle',
                        controller: tittleController,
                      ),
                !widget.fromUpdate
                    ? Text(descriptionController.text)
                    : TTextFormField(
                        text: 'Descrrption',
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
                !widget.fromUpdate
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
