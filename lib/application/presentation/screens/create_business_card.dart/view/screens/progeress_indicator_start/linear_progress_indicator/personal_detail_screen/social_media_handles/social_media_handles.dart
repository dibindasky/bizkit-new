import 'package:bizkit/application/business_logic/card/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/card/social_media_handle/social_media_handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialMediahandlesScreen extends StatefulWidget {
  const SocialMediahandlesScreen({super.key, required this.fromBusiness});

  final bool fromBusiness;

  @override
  State<SocialMediahandlesScreen> createState() =>
      _SocialMediahandlesScreenState();
}

class _SocialMediahandlesScreenState extends State<SocialMediahandlesScreen> {
  TextEditingController linkController = TextEditingController();
  String selectedCategory = 'SocialMedia';
  List<String> socialMedias = [
    'Instagram',
    'LinkedIn',
    'Whatsapp',
    'Telegram',
    'Youtube',
    'Quora'
  ];
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
        appBar: AppBar(
          title: Text('Social media accounts', style: textHeadStyle1),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check)),
            adjustWidth(20)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
            builder: (context, business) {
              return BlocBuilder<UserDataBloc, UserDataState>(
                builder: (context, user) {
                  return Column(
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
                            items: List.generate(
                              socialMedias.length,
                              (index) => DropdownMenuItem(
                                value: socialMedias[index],
                                child: Text(socialMedias[index]),
                              ),
                            ),
                            hint: Text(
                              selectedCategory,
                              style: selectedCategory == 'SocialMedia'
                                  ? null
                                  : textStyle1.copyWith(color: kwhite),
                            ),
                          ),
                        ),
                      ),
                      adjustHieght(10),
                      TTextFormField(
                        controller: linkController,
                        text: selectedCategory == 'Whatsapp'
                            ? 'Enter Whatsap Number'
                            : 'Account link paste here',
                        inputType: selectedCategory == 'Whatsapp'
                            ? TextInputType.number
                            : TextInputType.name,
                      ),
                      adjustHieght(30),
                      AuthButton(
                        text: 'Add',
                        onTap: () {
                          final link = selectedCategory == 'Whatsapp'
                              ? 'https://wa.me/${linkController.text}'
                              : linkController.text;
                          final model = SocialMediaHandle(
                              label: selectedCategory, socialMedia: link);
                          widget.fromBusiness
                              ? context.read<UserDataBloc>().add(
                                  UserDataEvent.addSocialMedia(
                                      socialMediaHandle: model))
                              : context.read<BusinessDataBloc>().add(
                                  BusinessDataEvent.addSocialMedia(
                                      socialMediaHandle: model));
                          linkController.text = '';
                          selectedCategory = 'SocialMedia';
                          setState(() {});
                        },
                      ),
                      adjustHieght(30),
                      Wrap(
                        children: List.generate(
                          widget.fromBusiness
                              ? business.socialMedias.length
                              : user.socialMedias.length,
                          (index) => Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: neonShade),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Text(widget.fromBusiness
                                    ? business.socialMedias[index].label ??
                                        'accound $index'
                                    : user.socialMedias[index].label ??
                                        'account $index'),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: InkWell(
                                  onTap: () {
                                    context.read<UserDataBloc>().add(
                                        UserDataEvent.removeSocialMedia(
                                            index: index));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const ColoredBox(
                                      color: neonShade,
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(Icons.close, size: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
