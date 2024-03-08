import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrivacyAecurityinner extends StatelessWidget {
  const PrivacyAecurityinner({super.key});

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
          'Account Settings',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                  border: Border.all(color: kgrey),
                  borderRadius: BorderRadius.circular(10)),
              child: SwitchListTile(
                title: const Text('Private profile'),
                subtitle: Text(
                  'your QR can only be used once to send connection. it cannot be shared by the person you have shared.',
                  style: textHeadStyle1.copyWith(fontSize: 11),
                ),
                value: true,
                onChanged: (value) {},
              ),
            ),
            adjustHieght(khieght * .02),
            Container(
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(color: kgrey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SwitchListTile(
                title: const Text('Third Person QR'),
                subtitle: Text(
                  'your QR can only be used once to send connection. it cannot be shared by the person you have shared.',
                  style: textHeadStyle1.copyWith(fontSize: 11),
                ),
                value: true,
                onChanged: (value) {},
              ),
            ),
            const Spacer(),
            AuthButton(
              text: 'Save',
              onTap: () {},
            ),
            adjustHieght(khieght * .03)
          ],
        ),
      ),
    );
  }
}
