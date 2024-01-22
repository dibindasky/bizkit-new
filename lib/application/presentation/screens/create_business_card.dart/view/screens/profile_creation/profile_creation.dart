import 'package:bizkit/application/business_logic/card_creation/card_screation_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_aontinue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: kwhite,
          ),
          backgroundColor: knill,
          title: Text(
            'Make a Bizkit Card',
            style: textHeadStyle1,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Column(
                children: [
                  adjustHieght(khieght * .03),
                  const Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(
                          'asset/images/profileCircle.png',
                        ),
                      ),
                      Positioned(
                        bottom: 17,
                        right: 3,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage: AssetImage(
                            'asset/images/profilestackcircle.png',
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  adjustHieght(khieght * .04),
                  BlocConsumer<CardScreationBloc, CardScreationState>(
                    listener: (context, state) {
                      if (state.success == true) {
                        showSnackbar(
                            message: 'Converting text from image is success',
                            context);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          AutocompleteTextField(
                            label: 'Name',
                            controller: context
                                .read<CardScreationBloc>()
                                .nameController,
                            inputType: TextInputType.text,
                            autocompleteItems: state.convertedText?.names ?? [],
                          ),
                          AutocompleteTextField(
                            label: 'Phone number',
                            controller: context
                                .read<CardScreationBloc>()
                                .phoneController,
                            inputType: TextInputType.name,
                            autocompleteItems: state.convertedText?.phone ?? [],
                          ),
                          AutocompleteTextField(
                            label: 'Email',
                            controller: context
                                .read<CardScreationBloc>()
                                .emailController,
                            inputType: TextInputType.emailAddress,
                            autocompleteItems:
                                state.convertedText?.emails ?? [],
                          ),
                          AutocompleteTextField(
                            label: 'Technolegy',
                            controller: context
                                .read<CardScreationBloc>()
                                .technolegyController,
                            inputType: TextInputType.name,
                            autocompleteItems:
                                state.convertedText?.unKnown ?? [],
                          ),
                          AutocompleteTextField(
                            label: 'Company',
                            controller: context
                                .read<CardScreationBloc>()
                                .companylController,
                            inputType: TextInputType.name,
                            autocompleteItems:
                                state.convertedText?.unKnown ?? [],
                          ),
                          adjustHieght(khieght * .05),
                        ],
                      );
                    },
                  ),
                  LastSkipContinueButtons(
                    onTap: () => Navigator.of(context).push(
                      fadePageRoute(const LinearProgressIndicatorStarting()),
                    ),
                  ),
                  adjustHieght(khieght * .02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
