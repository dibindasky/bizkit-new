import 'package:bizkit/application/business_logic/card_creation/card_screation_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/profile_creation/profile_creation.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:dotted_border/dotted_border.dart';
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
            child: BlocConsumer<CardScreationBloc, CardScreationState>(
              listener: (context, state) {
                if (state.success == true) {
                  print('state success or not ${state.success}');
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
                }
              },
              builder: (context, state) {
                if (state.scanimages == null) {
                  return const Center(
                    child: Text('Null emPty'),
                  );
                }
                return Column(
                  children: [
                    adjustHieght(khieght * .05),
                    ListView.separated(
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
                    ),
                    adjustHieght(khieght * .02),
                    DottedBorder(
                      dashPattern: const [8, 8],
                      color: neonShade,
                      strokeWidth: 2.5,
                      child: SizedBox(
                        width: double.infinity,
                        height: 110.dm,
                        child: GestureDetector(
                          onTap: () {
                            state.scanimages!.length >= 2
                                ? showSnackbar(
                                    message: "You can't add more than 2 files",
                                    context)
                                : context.read<CardScreationBloc>().add(
                                    CardScreationEvent.pickImage(camera: true));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32.dm,
                                height: 32.dm,
                                child: CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add),
                                  ),
                                ),
                              ),
                              Text(
                                'Add more images',
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    adjustHieght(khieght * .02),
                    state.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(color: neonShade),
                          )
                        : AuthButton(
                            text: 'Continue',
                            onTap: () async {
                              context.read<CardScreationBloc>().add(
                                    CardScreationEvent.processImage(
                                      images: state.scanimages!,
                                    ),
                                  );
                            },
                          ),
                    adjustHieght(khieght * .02),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
