import 'package:bizkit/application/commen/widgets/textform_field.dart';
import 'package:bizkit/application/commen/const.dart';
import 'package:bizkit/application/presentation/create_business_card.dart/view/screens/manuel_entries/progress_indicator_start.dart';
import 'package:bizkit/application/presentation/create_business_card.dart/view/widgets/last_skip_and_aontinue.dart';
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
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: kwhite,
          ),
          backgroundColor: knill,
          title: const Text(
            'Make a Bizkit Card',
            style: TextStyle(color: kwhite),
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
                  const LastSkipContinueButtons(
                    widget: LinearProgressIndicatorStarting(),
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
