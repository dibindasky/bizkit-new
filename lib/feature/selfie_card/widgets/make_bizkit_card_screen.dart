import 'package:bizkit/commen/widgets/textform_field.dart';
import 'package:bizkit/core/const.dart';
import 'package:bizkit/feature/home/view/widgets/listtile_detail_view.dart';
import 'package:bizkit/feature/selfie_card/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MakeABizkitCardScreen extends StatelessWidget {
  const MakeABizkitCardScreen({super.key});

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
          leading: adjustWidth(0),
          title: const Text(
            'Make a Bizkit Card',
            style: TextStyle(
                fontFamily: 'Euclid',
                fontWeight: FontWeight.bold,
                color: kwhite),
          ),
          backgroundColor: knill,
        ),
        body: ListView(
          children: [
            Container(
              height: kwidth * 0.60,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'asset/images/person4.jpeg',
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  adjustHieght(khieght * 0.008),
                  TTextFormField(
                      text: 'Occation',
                      controller: TextEditingController(),
                      inputType: TextInputType.name),
                  TTextFormField(
                      text: 'Location',
                      controller: TextEditingController(),
                      inputType: TextInputType.name),
                  TTextFormField(
                      text: 'Occupation',
                      controller: TextEditingController(),
                      inputType: TextInputType.name),
                  TTextFormField(
                    text: 'Time & Date',
                    controller: TextEditingController(),
                    inputType: TextInputType.name,
                  ),
                  TTextFormField(
                      text: 'Notes',
                      controller: TextEditingController(),
                      inputType: TextInputType.name),
                  adjustHieght(khieght * .02),
                  const CustomButtonSelfie(
                    navigate: ListTileDetailView(),
                  ) //should give next navigation here i add SelfieScreen For demo
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
