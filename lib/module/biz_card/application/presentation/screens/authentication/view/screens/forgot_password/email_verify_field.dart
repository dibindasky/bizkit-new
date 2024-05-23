import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/business_logic/auth/forgott_passwrod/forgott_password_bloc.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/module/biz_card/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmailFieldForGottPassword extends StatelessWidget {
  const EmailFieldForGottPassword({super.key});

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
            'Email verification',
            style: TextStyle(fontSize: 16),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 17,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: context.read<ForgottPasswordBloc>().emailFormKey,
                child: CustomTextFormField(
                  labelText: 'Enter Email',
                  validate: Validate.email,
                  controller:
                      context.read<ForgottPasswordBloc>().forgottpasswordEmail,
                ),
              ),
            ),
            const Spacer(),
            BlocConsumer<ForgottPasswordBloc, ForgottPasswordState>(
              listener: (context, state) {
                if (state.otpSend) {
                  showSnackbar(context, message: state.message!);
                  Map<String, String> map = {};
                  map['email'] = context
                      .read<ForgottPasswordBloc>()
                      .forgottpasswordEmail
                      .text;
                  GoRouter.of(context).pushNamed(
                    Routes.otpScreen,
                    pathParameters: map,
                  );
                }
                if (state.hasError) {
                  showSnackbar(
                    context,
                    message: state.message ?? errorMessage,
                    backgroundColor: kred,
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return const LoadingAnimation();
                } else {
                  return EventButton(
                    text: 'Send OTP',
                    onTap: () {
                      if (context
                          .read<ForgottPasswordBloc>()
                          .emailFormKey
                          .currentState!
                          .validate()) {
                        EmailModel emailModel = EmailModel(
                          email: context
                              .read<ForgottPasswordBloc>()
                              .forgottpasswordEmail
                              .text,
                        );
                        context.read<ForgottPasswordBloc>().add(
                              ForgottPasswordEvent.forGottPasswordEmailVerify(
                                  emailModel: emailModel),
                            );
                      }
                    },
                  );
                }
              },
            ),
            adjustHieght(khieght * .07)
          ],
        ),
      ),
    );
  }
}
