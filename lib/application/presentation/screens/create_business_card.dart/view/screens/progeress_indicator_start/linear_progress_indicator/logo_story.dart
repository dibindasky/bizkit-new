import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/show_dailogue.dart';
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
  GlobalKey<FormState> logokey = GlobalKey<FormState>();
  bool showLogoError = false;

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
              child: InkWell(
                onTap: () {
                  cameraAndGalleryPickImage(
                    context: context,
                    onPressCam: () {
                      context
                          .read<BusinessDataBloc>()
                          .add(const BusinessDataEvent.addLogo(isCam: true));
                    },
                    onPressGallery: () {
                      context
                          .read<BusinessDataBloc>()
                          .add(const BusinessDataEvent.addLogo(isCam: false));
                    },
                    tittle: 'Chosse image',
                  );
                  // context
                  //     .read<BusinessDataBloc>()
                  //     .add(const BusinessDataEvent.addLogo());
                },
                child: BlocConsumer<BusinessDataBloc, BusinessDataState>(
                  listener: (context, state) {
                    if (state.logoCard?.logo != null) {
                      print('logo eror false');
                      setState(() {
                        showLogoError = false;
                      });
                    }
                  },
                  buildWhen: (previous, current) =>
                      previous.logoCard != current.logoCard,
                  builder: (context, state) {
                    return state.logoImageLoading
                        ? SizedBox(
                            height: kwidth * 0.25,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: neonShade,
                              ),
                            ),
                          )
                        : DottedBorder(
                            dashPattern: const [8, 8],
                            color: showLogoError ? kred : neonShade,
                            strokeWidth: 2.5,
                            child: SizedBox(
                              width: kwidth * 0.8,
                              height: kwidth * 0.25,
                              child: state.logoCard != null &&
                                      state.logoCard!.logo != null
                                  ? Image.memory(
                                      base64.decode(state.logoCard!.logo!),
                                      fit: BoxFit.contain)
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
            adjustHieght(khieght * .01),
            Visibility(
                visible: showLogoError,
                child: const Center(
                    child: Text(
                  'Add Logo',
                  style: TextStyle(color: kred),
                ))),
            adjustHieght(khieght * .01),
            const Text(
              'Logo story',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            Form(
              key: logokey,
              child: TTextFormField(
                validate: Validate.notNull,
                controller:
                    context.read<BusinessDataBloc>().logoStoryController,
                maxLines: 10,
                text: 'Logo Story',
                textCapitalization: TextCapitalization.sentences,
                hintText:
                    "Your logo has been made with so much of thoughts and is designed to inspire. I'm sure that there is a story/ deep meaning behind your logo. This is one of the few places where you can impress the receiver of your card about the foundation of your logo",
              ),
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
                  FocusScope.of(context).unfocus();
                  if (state.logoCard?.logo == null) {
                    print('logo is not there');
                    setState(() {
                      showLogoError = true;
                    });
                    return;
                  }
                  setState(() {
                    showLogoError = false;
                  });
                  if (logokey.currentState!.validate()) {
                    context
                        .read<BusinessDataBloc>()
                        .add(const BusinessDataEvent.uploadLogo());
                  }
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
