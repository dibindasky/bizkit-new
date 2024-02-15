import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          state.userPhotos.isEmpty
                              ? const CircleAvatar(
                                  radius: 70,
                                  backgroundImage: AssetImage(
                                    'asset/images/profileCircle.png',
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 70,
                                  backgroundImage: FileImage(
                                      state.userPhotos.first.fileImage),
                                ),
                          Positioned(
                            bottom: 17,
                            right: 3,
                            child: InkWell(
                              onTap: () => context
                                  .read<UserDataBloc>()
                                  .add(UserDataEvent.pickUserPhotos()),
                              child: const CircleAvatar(
                                radius: 13,
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  adjustHieght(khieght * .04),
                  BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          AutocompleteTextField(
                            label: 'Name',
                            controller:
                                context.read<UserDataBloc>().nameController,
                            inputType: TextInputType.text,
                            autocompleteItems:
                                state.scannedImageDatasModel?.names ?? [],
                          ),
                          AutocompleteTextField(
                            label: 'Phone number',
                            controller:
                                context.read<UserDataBloc>().phoneController,
                            inputType: TextInputType.name,
                            autocompleteItems:
                                state.scannedImageDatasModel?.phone ?? [],
                          ),
                          AutocompleteTextField(
                            label: 'Email',
                            controller:
                                context.read<UserDataBloc>().emailController,
                            inputType: TextInputType.emailAddress,
                            autocompleteItems:
                                state.scannedImageDatasModel?.emails ?? [],
                          ),
                          AutocompleteTextField(
                            label: 'Company',
                            controller:
                                context.read<UserDataBloc>().companylController,
                            inputType: TextInputType.name,
                            autocompleteItems:
                                state.scannedImageDatasModel?.unknown ?? [],
                          ),
                          AutocompleteTextField(
                            label: 'BusinessCategory',
                            controller: context
                                .read<UserDataBloc>()
                                .businessCategoryController,
                            inputType: TextInputType.name,
                            autocompleteItems:
                                state.scannedImageDatasModel?.unknown ?? [],
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
