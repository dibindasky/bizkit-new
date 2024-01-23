import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccoladesBrochersAddSreateScreen extends StatelessWidget {
  const AccoladesBrochersAddSreateScreen({
    super.key,
    required this.isFromAccolades,
  });

  final bool isFromAccolades;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: AppbarCommen(
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
                  inputType: TextInputType.name,
                ),
                const TTextFormField(
                  text: 'Description',
                  maxLines: 10,
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
