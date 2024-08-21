import 'dart:convert';
import 'package:bizkit/module/biz_card/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/create_card/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/product_adding_screen.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kwidth * 0.2,
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          // final data = state.products[index];
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   cardFadePageRoute(AddPrductsScreen(
                  //     product: data,
                  //   )),
                  // );
                },
                child: Container(
                  height: kwidth * 0.2,
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  width: kwidth * 0.2,
                  decoration: BoxDecoration(
                      border: Border.all(color: neonShade),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: MemoryImage(
                          base64Decode(imageTestingBase64.substring(22)),
                        ),
                        onError: (exception, stackTrace) {
                          const Icon(Icons.image_not_supported_outlined);
                        },
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    showCustomConfirmationDialogue(
                      context: context,
                      title: 'Are you sure want to delete?',
                      buttonText: 'Delete',
                      onTap: () {
                        // context.read<BusinessDataBloc>().add(
                        //     BusinessDataEvent.removeProduct(
                        //         id: state.products[index].id!));
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const ColoredBox(
                      color: neonShade,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.close, size: 12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
