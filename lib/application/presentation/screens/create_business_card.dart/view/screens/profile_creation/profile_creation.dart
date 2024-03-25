import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/application/presentation/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  final GlobalKey<FormState> personalDataFirstFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final khieght = size.height;
    return Scaffold(
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
                // pick user photo
                BlocBuilder<UserDataBloc, UserDataState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        state.userPhotos == null
                            ? const CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage(
                                  'asset/images/profileCircle.png',
                                ),
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    FileImage(state.userPhotos!.fileImage),
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
                // user data form
                BlocBuilder<UserDataBloc, UserDataState>(
                  builder: (context, state) {
                    return Form(
                      key: personalDataFirstFormKey,
                      child: Column(
                        children: [
                          // personal name field
                          AutocompleteTextField(
                            validate: Validate.notNull,
                            label: 'Name *',
                            controller:
                                context.read<UserDataBloc>().nameController,
                            inputType: TextInputType.text,
                            autocompleteItems:
                                state.scannedImageDatasModel?.names ?? [],
                          ),
                          // personal phone number
                          AutocompleteTextField(
                            validate: Validate.phone,
                            maxLength: 10,
<<<<<<< HEAD
                            label: 'Phone number *',
=======
                            label: 'Phone Number',
>>>>>>> modification
                            controller:
                                context.read<UserDataBloc>().phoneController,
                            inputType: TextInputType.phone,
                            autocompleteItems:
                                state.scannedImageDatasModel?.phone ?? [],
                          ),
                          // personal email
                          AutocompleteTextField(
                            validate: Validate.email,
                            label: 'Email *',
                            controller:
                                context.read<UserDataBloc>().emailController,
                            inputType: TextInputType.emailAddress,
                            autocompleteItems:
                                state.scannedImageDatasModel?.emails ?? [],
                          ),
                          // business category
                          AutocompleteTextField(
<<<<<<< HEAD
                              onTap: () =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              enabled: false,
                              validate: Validate.notNull,
                              label: 'BusinessCategory *',
                              controller: context
                                  .read<UserDataBloc>()
                                  .businessCategoryController,
                              inputType: TextInputType.name,
                              autocompleteItems: state.businessCategories
                                  .map((e) => e.category!)
                                  .toList()),
=======
                            onTap: () =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            enabled: false,
                            validate: Validate.notNull,
                            label: 'Business Category',
                            controller: context
                                .read<UserDataBloc>()
                                .businessCategoryController,
                            inputType: TextInputType.name,
                            autocompleteItems: state.businessCategories
                                .map((e) => e.category!)
                                .toList(),
                          ),
>>>>>>> modification
                          AutocompleteTextField(
                            showDropdownOnTap: true,
                            validate: Validate.notNull,
                            label: 'Designation *',
                            controller: context
                                .read<UserDataBloc>()
                                .designationController,
                            autocompleteItems:
                                state.scannedImageDatasModel?.names ??
                                    <String>[],
                          ),
                          adjustHieght(khieght * .05),
                        ],
                      ),
                    );
                  },
                ),
                LastSkipContinueButtons(
                  onTap: () {
                    if (personalDataFirstFormKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        fadePageRoute(const LinearProgressIndicatorStarting()),
                      );
                    }
                  },
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
