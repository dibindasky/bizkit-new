import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';

class SocialMediahandles extends StatefulWidget {
  const SocialMediahandles({super.key});

  @override
  State<SocialMediahandles> createState() => _SocialMediahandlesState();
}

class _SocialMediahandlesState extends State<SocialMediahandles> {
  String selectedCategory = 'Select your account';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(kwidth, 70),
          child: const AppbarCommen(
            tittle: 'Social media accounts',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: selectedCategory == 'Select your account'
                      ? null
                      : Border.all(color: kwhite),
                ),
                padding: const EdgeInsets.only(left: 10),
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Select your account',
                        child: Text(
                          'Select your account',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Whatsapp',
                        child: Text('Whatsapp'),
                      ),
                      DropdownMenuItem(
                        value: 'LinkedIn',
                        child: Text('LinkedIn'),
                      ),
                      DropdownMenuItem(
                        value: 'Instagram',
                        child: Text('Instagram'),
                      ),
                      DropdownMenuItem(
                        value: 'Quora',
                        child: Text('Quora'),
                      ),
                      DropdownMenuItem(
                        value: 'Youtube',
                        child: Text('Youtube'),
                      ),
                      DropdownMenuItem(
                        value: 'Telegram',
                        child: Text('Telegram'),
                      ),
                    ],
                    hint: Text(
                      selectedCategory,
                      style: selectedCategory == 'Select your account'
                          ? null
                          : textStyle1.copyWith(color: kwhite),
                    ),
                  ),
                ),
              ),
              adjustHieght(10),
              TTextFormField(
                text: 'Account link paste here',
                // controller: homeAddress,
                inputType: selectedCategory == 'Whatsapp'
                    ? TextInputType.number
                    : TextInputType.name,
              ),
              const Spacer(),
              AuthButton(
                text: 'Save',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              adjustHieght(30)
            ],
          ),
        ),
      ),
    );
  }
}
