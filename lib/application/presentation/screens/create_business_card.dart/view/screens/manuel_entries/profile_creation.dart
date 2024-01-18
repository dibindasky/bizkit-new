import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/create_business_card.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_aontinue.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final TextEditingController nameController = TextEditingController();

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
                  TTextFormField(
                    text: 'Name',
                    controller: nameController,
                    inputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  TTextFormField(
                    text: 'Email ID',
                    controller: nameController,
                    inputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  TTextFormField(
                    text: 'Phone number',
                    controller: nameController,
                    inputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  TTextFormField(
                    text: 'Technolegy',
                    controller: nameController,
                    inputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  TTextFormField(
                    text: 'Campany',
                    controller: nameController,
                    inputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  adjustHieght(khieght * .05),
                  LastSkipContinueButtons(
                    onTap: () => Navigator.of(context).push(
                        fadePageRoute(const LinearProgressIndicatorStarting())),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
