import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/business_logic/auth/forgott_passwrod/forgott_password_bloc.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/change_password_model/change_password_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:bizkit/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewPasswordFeild extends StatelessWidget {
  const NewPasswordFeild({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: knill,
          title: const Text(
            'Create your new password',
            style: TextStyle(fontSize: 16),
          ),
          leading: const Icon(
            Icons.arrow_back_ios,
            size: 17,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                email,
                style: const TextStyle(color: neonShade),
              ),
              adjustHieght(20),
              Text('Enter your new password', style: textHeadStyle1),
              adjustHieght(20),
              CustomTextFormField(
                textCapitalization: TextCapitalization.words,
                labelText: 'Enter password',
                //validate: Validate.password,
                controller: context.read<ForgottPasswordBloc>().newPassword,
              ),
              const Spacer(),
              BlocConsumer<ForgottPasswordBloc, ForgottPasswordState>(
                listener: (context, state) {
                  if (state.passwordChange) {
                    GoRouter.of(context).pushReplacement(Routes.loginPage);
                    showSnackbar(context, message: state.message ?? "");
                  }
                  if (state.hasError) {
                    showSnackbar(
                      context,
                      message: state.message ?? "",
                      backgroundColor: kred,
                    );
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return EventButton(
                    text: 'Save',
                    onTap: () {
                      final password =
                          context.read<ForgottPasswordBloc>().newPassword.text;
                      if (!isValidPassword(password)) {
                        showSnackbar(
                          context,
                          message: 'Password is not valid',
                          backgroundColor: kred,
                        );
                      } else {
                        context.read<ForgottPasswordBloc>().add(
                              ForgottPasswordEvent.forgottPassword(
                                  changePasswordModel: ChangePasswordModel(
                                email: email,
                                newPassword: context
                                    .read<ForgottPasswordBloc>()
                                    .newPassword
                                    .text,
                              )),
                            );
                      }
                    },
                  );
                },
              ),
              adjustHieght(khieght * .07)
            ],
          ),
        ),
      ),
    );
  }
}
