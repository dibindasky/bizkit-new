import 'package:bizkit/module/biz_card/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/forgott_password_request_model/forgott_password_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> passwrdChangeFrom = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: const Text(
          'Account Settings',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: passwrdChangeFrom,
            child: Column(
              children: [
                CustomTextFormField(
                  validate: Validate.password,
                  inputType: TextInputType.visiblePassword,
                  controller: context.read<ProfileBloc>().oldPasswordController,
                  labelText: 'Old password',
                  obscureText: true,
                ),
                CustomTextFormField(
                  validate: Validate.password,
                  inputType: TextInputType.visiblePassword,
                  controller: context.read<ProfileBloc>().newPasswordController,
                  labelText: 'New password',
                  obscureText: true,
                ),
                CustomTextFormField(
                  password: context.read<ProfileBloc>().newPasswordController,
                  validate: Validate.rePassword,
                  labelText: 'Re-enter password',
                  inputType: TextInputType.visiblePassword,
                  controller:
                      context.read<ProfileBloc>().reEnterNewPasswordController,
                  obscureText: true,
                ),
                adjustHieght(khieght * .4),
                BlocConsumer<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    if (state.hasError || state.message != null) {
                      showSnackbar(
                        context,
                        message: state.message ?? errorMessage,
                        backgroundColor: state.hasError ? kred : neonShade,
                        textColor: kwhite,
                      );
                    }
                    if (state.foregottPasswordResponceMdel != null) {
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const LoadingAnimation();
                    }
                    return EventButton(
                      text: 'Change password',
                      onTap: () {
                        if (passwrdChangeFrom.currentState!.validate()) {
                          ForgottPasswordRequestModel
                              forgottPasswordRequestModel =
                              ForgottPasswordRequestModel(
                            oldPassword: context
                                .read<ProfileBloc>()
                                .oldPasswordController
                                .text,
                            newPassword: context
                                .read<ProfileBloc>()
                                .newPasswordController
                                .text,
                          );
                          context.read<ProfileBloc>().add(
                                ProfileEvent.resetPasswod(
                                  forgottPasswordRequestModel:
                                      forgottPasswordRequestModel,
                                ),
                              );
                        }
                      },
                    );
                  },
                ),
                adjustHieght(khieght * .08)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
