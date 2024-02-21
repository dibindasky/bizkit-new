import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/brocher_builder.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/product_adding_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/product_builder.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrochersAndProductsScreen extends StatelessWidget {
  const BrochersAndProductsScreen({Key? key, required this.pageController})
      : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              adjustHieght(khieght * .03),
              const Text(
                'Products / Brochures',
                style: TextStyle(fontSize: 20),
              ),
              adjustHieght(30),
              Center(
                child: InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      fadePageRoute(const AddPrductsScreen()),
                    );
                  },
                  child: DottedBorder(
                    dashPattern: const [8, 8],
                    color: neonShade,
                    strokeWidth: 2.5,
                    child: SizedBox(
                      width: 290.dm,
                      height: 81.dm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 32.dm,
                            height: 32.dm,
                            child: const CircleAvatar(
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                          Text(
                            'Add Products',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              adjustHieght(30),
              Center(
                child: InkWell(
                  onTap: () async {
                    context
                        .read<BusinessDataBloc>()
                        .add(const BusinessDataEvent.addBrochures());
                  },
                  child: DottedBorder(
                    dashPattern: const [8, 8],
                    color: neonShade,
                    strokeWidth: 2.5,
                    child: SizedBox(
                      width: 290.dm,
                      height: 81.dm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 32.dm,
                            height: 32.dm,
                            child: const CircleAvatar(
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                          Text(
                            'Add brochers',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              adjustHieght(30),
              const Text('Added Products'),
              const ProductBuilder(),
              adjustHieght(30),
              const Text('Added Brochers'),
              adjustHieght(10),
              const BrocherBuilder(),
            ],
          ),
          adjustHieght(khieght * .03),
          BlocConsumer<BusinessDataBloc, BusinessDataState>(
            listenWhen: (previous, current) =>
                previous.businessDetailsCreateId !=
                current.businessDetailsCreateId,
            listener: (context, state) {
              if (state.businessDetailsCreateId != null) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingAnimation();
              }
              return LastSkipContinueButtons(
                onTap: () {
                  context
                      .read<BusinessDataBloc>()
                      .add(const BusinessDataEvent.createBusinessData());
                },
              );
            },
          ),
          adjustHieght(30),
        ],
      ),
    );
  }
}
