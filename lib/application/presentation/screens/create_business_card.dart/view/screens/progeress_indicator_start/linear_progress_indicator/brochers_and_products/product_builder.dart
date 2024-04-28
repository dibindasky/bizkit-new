import 'dart:convert';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/product_adding_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kwidth * 0.2,
      child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.products.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final data = state.products[index];
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        fadePageRoute(AddPrductsScreen(
                          product: data,
                        )),
                      );
                    },
                    child: Container(
                      height: kwidth * 0.2,
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      width: kwidth * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(color: neonShade),
                        borderRadius: BorderRadius.circular(10),
                        image: data.image != null && data.image!.isNotEmpty
                            ? DecorationImage(
                                image: MemoryImage(
                                  base64Decode(
                                    data.image![0].image!.startsWith('data')
                                        ? data.image![0].image!.substring(22)
                                        : data.image![0].image!,
                                  ),
                                ),
                                onError: (exception, stackTrace) {
                                  const Icon(
                                      Icons.image_not_supported_outlined);
                                },
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
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
                            context.read<BusinessDataBloc>().add(
                                BusinessDataEvent.removeProduct(
                                    id: state.products[index].id!));
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
          );
        },
      ),
    );
  }
}
