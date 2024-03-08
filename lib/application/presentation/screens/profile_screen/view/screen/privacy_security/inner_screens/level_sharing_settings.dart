import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DefaultLevelSharing extends StatelessWidget {
  const DefaultLevelSharing({super.key});

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
          'Default level settings',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.only(left: 15, right: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: kwhite),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Level Sharing',
                          style: TextStyle(fontSize: kwidth * 0.037),
                        ),
                        Text(
                          'Professional, Emergency, Company',
                          style: TextStyle(
                            fontSize: kwidth * 0.027,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: kwhite,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SwitchListTile(
                title: Text(
                  'Peronal details',
                  style: textHeadStyle1,
                ),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                title: const Text('Third Person QR'),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                title: const Text('Third Person QR'),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                title: const Text('Third Person QR'),
                value: true,
                onChanged: (value) {},
              ),
              adjustHieght(khieght * .3),
              AuthButton(
                text: 'Save',
                onTap: () {},
              ),
              adjustHieght(khieght * .03),
            ],
          ),
        ),
      ),
    );
  }
}
