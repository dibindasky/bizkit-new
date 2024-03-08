import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';

class ChangeMailId extends StatelessWidget {
  const ChangeMailId({super.key});
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
          'Email id',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const TTextFormField(
              text: 'Enter Email id',
              suffix: Icon(
                Icons.cancel,
                color: kwhite,
              ),
            ),
            const Spacer(),
            AuthButton(
              text: 'Verify',
              onTap: () {},
            ),
            adjustHieght(khieght * .1)
          ],
        ),
      ),
    );
  }
}
