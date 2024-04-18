import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoStory extends StatefulWidget {
  const LogoStory(
      {super.key, required this.pageController, required this.fromBusiness});

  final bool fromBusiness;
  final PageController pageController;

  @override
  State<LogoStory> createState() => _LogoStoryState();
}

class _LogoStoryState extends State<LogoStory> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode focusScopeNode = FocusScope.of(context);
          if (!focusScopeNode.hasPrimaryFocus) {
            focusScopeNode.unfocus();
          }
        },
        child: ListView(
          children: [
            adjustHieght(khieght * .03),
            const Text(
              'Logo',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            Center(
              child: InkResponse(
                onTap: () => context
                    .read<BusinessDataBloc>()
                    .add(const BusinessDataEvent.addLogo()),
                child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
                  buildWhen: (previous, current) =>
                      previous.logoCard != current.logoCard,
                  builder: (context, state) {
                    return DottedBorder(
                      dashPattern: const [8, 8],
                      color: neonShade,
                      strokeWidth: 2.5,
                      child: SizedBox(
                        width: kwidth * 0.8,
                        height: kwidth * 0.25,
                        child: state.logoCard != null &&
                                state.logoCard!.logo != null
                            ? Image.memory(base64.decode(state.logoCard!.logo!),
                                fit: BoxFit.contain)
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 32.dm,
                                    height: 32.dm,
                                    child: const CircleAvatar(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  Text(
                                    'Add logo from file',
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ],
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
            adjustHieght(khieght * .02),
            // BlocBuilder<UserDataBloc, UserDataState>(
            //   builder: (context, state) {
            //     if (state.scannedImagesCardCreation.isEmpty) {
            //       return const SizedBox();
            //     } else {
            //       return Column(
            //         children: [
            //           const Align(
            //               alignment: Alignment.centerLeft,
            //               child: Text('crop logo from card image')),
            //           adjustHieght(10),
            //           SizedBox(
            //             height: 60,
            //             child: ListView.builder(
            //               itemCount: state.scannedImagesCardCreation.length,
            //               scrollDirection: Axis.horizontal,
            //               itemBuilder: (context, index) => InkWell(
            //                 onTap: () async {
            //                   await state
            //                       .scannedImagesCardCreation[index].fileImage
            //                       .readAsBytes()
            //                       .then((image) async {
            //                     Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (context) =>
            //                                 Croper(imageToCrop: image)));
            //                   });
            //                 },
            //                 child: Container(
            //                   margin:
            //                       const EdgeInsets.symmetric(horizontal: 10),
            //                   height: 60,
            //                   width: 60,
            //                   decoration: BoxDecoration(
            //                     color: neonShade,
            //                     image: DecorationImage(
            //                         image: FileImage(state
            //                             .scannedImagesCardCreation[index]
            //                             .fileImage),
            //                         fit: BoxFit.cover),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           )
            //         ],
            //       );
            //     }
            //   },
            // ),
            // adjustHieght(khieght * .02),
            const Text(
              'Logo story',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            TTextFormField(
              controller: context.read<BusinessDataBloc>().logoStoryController,
              maxLines: 10,
              text: 'logoStory',
              textCapitalization: TextCapitalization.sentences,
              hintText:
                  "Your logo has been made with so much of thoughts and is designed to inspire. I'm sure that there is a story/ deep meaning behind your logo. This is one of the few places where you can impress the receiver of your card about the foundation of your logo",
            ),
            adjustHieght(khieght * .04),
            BlocConsumer<BusinessDataBloc, BusinessDataState>(
              listenWhen: (previous, current) => current.logoAdded,
              listener: (context, state) {
                if (state.logoAdded) {
                  context.read<CardBloc>().add(
                      CardEvent.getCardyCardId(id: state.currentCard!.id!));
                  if (state.isBusiness && widget.fromBusiness) {
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                }
              },
              buildWhen: (previous, current) =>
                  previous.logoLoading != current.logoLoading,
              builder: (context, state) {
                if (state.logoLoading) {
                  return const LoadingAnimation();
                }
                return LastSkipContinueButtons(onTap: () {
                  context
                      .read<BusinessDataBloc>()
                      .add(const BusinessDataEvent.uploadLogo());
                });
              },
            ),
            adjustHieght(khieght * .1),
          ],
        ),
      ),
    );
  }
}
