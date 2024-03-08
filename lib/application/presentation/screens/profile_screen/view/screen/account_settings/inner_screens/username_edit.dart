import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/profile/user_name_changin_request_model/user_name_changin_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserDetails extends StatefulWidget {
  EditUserDetails({super.key});

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  final GlobalKey<FormState> userameFrom = GlobalKey();
  bool isClose = false;
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
          'Username',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: userameFrom,
          child: Column(
            children: [
              TTextFormField(
                onChanaged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      isClose = true;
                    });
                  }
                },
                controller: context.read<AuthBloc>().userNameController,
                validate: Validate.notNull,
                text: 'User name',
                suffix: isClose
                    ? IconButton(
                        onPressed: () {
                          context.read<AuthBloc>().userNameController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : const SizedBox(),
              ),
              const Spacer(),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.hasError || state.message != null) {
                    showSnackbar(
                      context,
                      message: state.message ?? errorMessage,
                      backgroundColor: state.hasError ? kred : neonShade,
                      textColor: kwhite,
                    );
                  }
                  if (state.usernameChangeResponceModel != null) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingAnimation();
                  }
                  return AuthButton(
                    text: 'Save',
                    onTap: () {
                      if (userameFrom.currentState!.validate()) {
                        UserNameChanginRequestModel
                            userNameChanginRequestModel =
                            UserNameChanginRequestModel(
                          username:
                              context.read<AuthBloc>().userNameController.text,
                        );
                        context.read<AuthBloc>().add(
                              AuthEvent.userNameChange(
                                userNameChanginRequestModel:
                                    userNameChanginRequestModel,
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
    );
  }
}
