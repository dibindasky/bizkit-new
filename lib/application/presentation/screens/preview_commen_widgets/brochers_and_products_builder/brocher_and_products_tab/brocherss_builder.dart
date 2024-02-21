import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/domain/model/card/card/brochure/brochure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrochersBuilder extends StatelessWidget {
  const BrochersBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: BlocBuilder<CardBloc, CardState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingAnimation();
            } else {
              List<Brochure> list = [];
              if (state.anotherCard != null &&
                  state.anotherCard!.businessDetails != null &&
                  state.anotherCard!.businessDetails!.brochure != null) {
                list = state.anotherCard!.businessDetails!.brochure!;
              }
              return GridView.builder(
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Image.asset(pdfImage);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
