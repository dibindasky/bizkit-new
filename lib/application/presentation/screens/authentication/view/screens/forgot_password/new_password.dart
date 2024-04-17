import 'package:bizkit/application/business_logic/auth/forgott_passwrod/forgott_password_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/validators/validators.dart';
import 'package:bizkit/domain/model/auth/change_password_model/change_password_model.dart';
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
              TTextFormField(
                textCapitalization: TextCapitalization.words,
                text: 'Enter password',
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
                  return AuthButton(
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
