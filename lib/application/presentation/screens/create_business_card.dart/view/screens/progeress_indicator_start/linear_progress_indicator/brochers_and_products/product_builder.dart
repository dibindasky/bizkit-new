import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({
    super.key,
  });

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
                  Container(
                    height: kwidth * 0.2,
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    width: kwidth * 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(color: neonShade),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: FileImage(data.image![0].image.fileImage),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () => context
                          .read<BusinessDataBloc>()
                          .add(BusinessDataEvent.removeProduct(index: index)),
                      borderRadius: BorderRadius.circular(10),
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
