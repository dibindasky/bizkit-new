import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';

class ScreenAddConnections extends StatelessWidget {
  const ScreenAddConnections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'New Connection',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const TTextFormField(text: 'Search',su: Icon(Icons.search),),
            adjustHieght(10),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.15,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: kneonShade),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(children: [
                      // image profile
                      CircleAvatar(
                        radius: kwidth * 0.08,
                        backgroundImage: const AssetImage(imageDummyAsset),
                      ),
                      adjustHieght(10),
                      Text(
                        'Mark Luther',
                        style: textStyle1.copyWith(fontSize: kwidth * 0.045),
                      ),
                      Text(
                        'Zikrabyte | Developer',
                        style: textStyle1,
                      ),
                      adjustHieght(10),
                      Container(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                            gradient: neonShadeGradient,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: const Text('Add Connection',
                            style: TextStyle(color: kwhite)),
                      ),
                    ]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
