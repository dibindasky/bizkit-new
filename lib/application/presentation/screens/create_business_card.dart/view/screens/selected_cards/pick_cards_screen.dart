import 'package:bizkit/application/business_logic/card_creation/card_screation_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickCardsScreen extends StatelessWidget {
  const PickCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: knill,
        title: Text(
          'Selecetd Images',
          style: textHeadStyle1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                adjustHieght(khieght * .05),
                BlocBuilder<CardScreationBloc, CardScreationState>(
                  builder: (context, state) {
                    if (state.scanimages == null) {
                      return const Text('No images');
                    }
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return adjustHieght(khieght * .02);
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.scanimages!.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 200.dm,
                          height: 120.dm,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              state.scanimages![index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                adjustHieght(khieght * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AuthButton(
                      text: 'Process image',
                      onTap: () {},
                    ),
                    AuthButton(
                      text: 'Add more images',
                      onTap: () {
                        context
                            .read<CardScreationBloc>()
                            .add(CardScreationEvent.pickImage(camera: true));
                      },
                    ),
                  ],
                ),
                adjustHieght(khieght * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
