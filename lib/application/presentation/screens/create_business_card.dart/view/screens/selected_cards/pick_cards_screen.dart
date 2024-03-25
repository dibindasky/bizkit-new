import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/profile_creation/profile_creation.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/card_uploading_showdailogue.dart';
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
            child: BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
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
                      itemCount: state.scannedImagesCardCreation.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            SizedBox(
                              width: 200.dm,
                              height: 120.dm,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  state.scannedImagesCardCreation[index]
                                      .fileImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    onPressed: () {
                                      context.read<UserDataBloc>().add(
                                          UserDataEvent.removeImageScanning(
                                              index: index));
                                    },
                                    icon: const Icon(Icons.delete)))
                          ],
                        );
                      },
                    ),
                    adjustHieght(khieght * .02),
                    state.scannedImagesCardCreation.length < 2
                        ? DottedBorder(
                            dashPattern: const [8, 8],
                            color: neonShade,
                            strokeWidth: 2.5,
                            child: SizedBox(
                              width: double.infinity,
                              height: 110.dm,
                              child: GestureDetector(
                                onTap: () {
                                  state.scannedImagesCardCreation.length >= 2
                                      ? showSnackbar(
                                          message:
                                              "You can't add more than 2 files",
                                          context)
                                      : cardscanimagesSelectingDailogue(
                                          context);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 32.dm,
                                      height: 32.dm,
                                      child: const CircleAvatar(
                                        child: Center(child: Icon(Icons.add)),
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
                          )
                        : const SizedBox(),
                    adjustHieght(khieght * .02),
                    state.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(color: neonShade),
                          )
                        : AuthButton(
                            text: 'Continue',
                            onTap: () {
                              context.read<UserDataBloc>().add(
                                    UserDataEvent.processImageScanning(
                                      images: state.scannedImagesCardCreation,
                                    ),
                                  );
                              context
                                  .read<UserDataBloc>()
                                  .add(UserDataEvent.getUserDetail());
                              context
                                  .read<UserDataBloc>()
                                  .add(UserDataEvent.getBusinessCategories());
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfileCreationScreen()));
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
