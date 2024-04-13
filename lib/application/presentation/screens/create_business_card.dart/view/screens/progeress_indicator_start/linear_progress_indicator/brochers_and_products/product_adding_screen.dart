import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPrductsScreen extends StatefulWidget {
  const AddPrductsScreen({
    Key? key,
  }) : super(key: key);

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
                  ColoredBox(
                    color: neonShade.withOpacity(0.1),
                    child: InkWell(
                      onTap: () async {
                        image = await ImagePickerClass.getImage(camera: false);
                        setState(() {});
                      },
                      child: SizedBox(
                          width: 270.dm,
                          height: 170.dm,
                          child: image != null
                              ? Image.file(image!.fileImage, fit: BoxFit.cover)
                              : const Icon(Icons.add_a_photo_rounded)),
                    ),
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
                              image == null) {
                            showSnackbar(context,
                                message: image == null
                                    ? 'Add Image'
                                    : productTitleController.text.isEmpty
                                        ? 'Add title'
                                        : 'Add Description',
                                textColor: kwhite,
                                backgroundColor: kred);
                            return;
                          }
                          final product = Product(
                              description:
                                  productDescriptionController.text.trim(),
                              label: productTitleController.text.trim(),
                              image: [ImageCard(image: image!.base64)],
                              enquiry: switchValue,
                              cardId: state.currentCard!.id);
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
