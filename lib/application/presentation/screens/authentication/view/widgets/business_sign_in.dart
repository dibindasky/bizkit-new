import 'package:animate_do/animate_do.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BusinessSignIn extends StatelessWidget {
  BusinessSignIn({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController companyMail = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController licenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 700),
      delay: const Duration(milliseconds: 200),
      child: Column(
        children: [
          adjustHieght(khieght * .04),
          Text(
            'Create your key to your business kit',
            style: custumText(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          adjustHieght(khieght * .04),
          TTextFormField(
            text: 'Name',
            controller: nameController,
            inputType: TextInputType.name,
            obscureText: false,
          ),
          TTextFormField(
            text: 'Company name',
            controller: companyname,
            inputType: TextInputType.emailAddress,
            obscureText: false,
          ),
          TTextFormField(
            text: 'Company mail',
            controller: companyMail,
            inputType: TextInputType.emailAddress,
            obscureText: false,
          ),
          TTextFormField(
            text: 'Address',
            controller: companyMail,
            inputType: TextInputType.emailAddress,
            obscureText: false,
          ),
          TTextFormField(
            text: 'License',
            controller: companyMail,
            inputType: TextInputType.emailAddress,
            obscureText: false,
          ),
          adjustHieght(khieght * .04),
          AuthButton(
            text: 'SignUp',
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}