import 'package:animate_do/animate_do.dart';
import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/authentication/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class BusinessSignIn extends StatelessWidget {
  BusinessSignIn({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController companyMail = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController licenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeIn(
        duration: const Duration(milliseconds: 700),
        delay: const Duration(milliseconds: 200),
        child: Column(
          children: [
            adjustHieght(khieght * .02),
            const Text(
              'Create your key to your business kit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            adjustHieght(khieght * .02),
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
            adjustHieght(khieght * .02),
            AuthButton(
              text: 'SignUp',
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
