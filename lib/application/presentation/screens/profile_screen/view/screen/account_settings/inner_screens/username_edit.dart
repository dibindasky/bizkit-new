import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/profile/user_info_change_request_model/user_info_change_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserDetails extends StatefulWidget {
  const EditUserDetails({super.key});

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  final GlobalKey<FormState> userameFrom = GlobalKey();
  bool isClose = false;

  @override
  void initState() {
    context
        .read<ProfileBloc>()
        .add(const ProfileEvent.getProfile(isLoad: false));
    super.initState();
  }

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
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return TTextFormField(
                    onChanaged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          isClose = true;
                        });
                      }
                    },
                    controller: context.read<ProfileBloc>().userNameController,
                    validate: Validate.notNull,
                    text: 'User name',
                    suffix: isClose
                        ? IconButton(
                            onPressed: () {
                              context
                                  .read<ProfileBloc>()
                                  .userNameController
                                  .clear();
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : const SizedBox(),
                  );
                },
              ),
              const Spacer(),
              BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state.updateUserInfoModel != null &&
                      state.message == 'Profile updated uccessfully') {
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
                        // String profileImage = '';
                        // if (state.getUserInfoModel != null &&
                        //     state.getUserInfoModel!.results != null &&
                        //     state.getUserInfoModel!.results!.profilePic !=
                        //         null) {
                        //   profileImage =
                        //       state.getUserInfoModel!.results!.profilePic!;
                        // }
                        UserInfoChangeRequestModel userInfoChangeRequestModel =
                            UserInfoChangeRequestModel();
                        userInfoChangeRequestModel =
                            userInfoChangeRequestModel.copyWith(
                                id: state.getUserInfoModel?.results?.id,
                                profilePic:
                                    state.getUserInfoModel!.results!.profilePic,
                                name: context
                                    .read<ProfileBloc>()
                                    .userNameController
                                    .text,
                                isActive: true);

                        context.read<ProfileBloc>().add(
                              ProfileEvent.editProfile(
                                userInfoChangeRequestModel:
                                    userInfoChangeRequestModel,
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
