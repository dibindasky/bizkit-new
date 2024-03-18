import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_continue.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/report_a_problem/report_a_problem_request_model/report_a_problem_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportProblemPage extends StatelessWidget {
  ReportProblemPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: const AppbarCommen(
          tittle: 'Report a Problem',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: khieght * .74,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      adjustHieght(kwidth * .03),
                      TTextFormField(
                        validate: Validate.notNull,
                        text: 'Subject',
                        controller: context.read<ProfileBloc>().reportSubject,
                      ),
                      adjustHieght(kwidth * .03),
                      TTextFormField(
                        validate: Validate.notNull,
                        controller: context.read<ProfileBloc>().reportContent,
                        text: 'Content',
                        maxLines: 6,
                      ),
                      adjustHieght(kwidth * .03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconContainer(
                              'asset/images/roport_problem_camera_icon.png'),
                          adjustWidth(kwidth * .03),
                          iconContainer(
                              'asset/images/report_problem_gallery_icon.png'),
                          adjustWidth(kwidth * .03),
                          iconContainer(
                              'asset/images/reprort_problem_file_icon.png'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              LastSkipContinueButtons(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    final subject =
                        context.read<ProfileBloc>().reportSubject.text;
                    final content =
                        context.read<ProfileBloc>().reportContent.text;
                    ReportAProblemRequestModel reportAProblemRequestModel =
                        ReportAProblemRequestModel(
                            label: subject, message: content);
                    context.read<ProfileBloc>().add(
                          ProfileEvent.reportAProblem(
                            reportAProblemRequestModel:
                                reportAProblemRequestModel,
                          ),
                        );
                    Navigator.of(context).pop();
                    showSnackbar(
                      context,
                      message: 'Problem created successfully',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox iconContainer(String icon) {
    return SizedBox(
      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ColoredBox(
          color: neonShade,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Image.asset(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
