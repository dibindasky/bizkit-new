import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccoladesCreateScreen extends StatelessWidget {
  const AccoladesCreateScreen({
    super.key,
    required this.isFromAccolades,
  });

  final bool isFromAccolades;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: CardCreationBusinessCardAppbar(
          tittle: isFromAccolades ? 'Accolades' : 'Brochers',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                adjustHieght(khieght * .05),
                SizedBox(
                  width: 270.dm,
                  height: 170.dm,
                  child: Image.asset(
                    'asset/images/person4.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                adjustHieght(khieght * .02),
                const TTextFormField(
                  text: 'Name',
                  //controller: textEditingController,
                  inputType: TextInputType.name,
                ),
                const TTextFormField(
                  text: 'Description',
                  maxLines: 10,
                  //controller: textEditingController,
                  inputType: TextInputType.name,
                ),
                adjustHieght(khieght * .02),
                AuthButton(
                  hieght: 48,
                  text: 'Save',
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
