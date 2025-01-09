import 'package:bizkit/module/module_manager/application/controller/auth_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VarificationScreen extends StatelessWidget {
  const VarificationScreen({super.key, required this.islogin});
  final bool islogin;

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationController>();
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          tileMode: TileMode.clamp,
          colors: [
            kneon,
            kneon,
            kneonDark,
            kneonDark,
            kneon,
            kneon,
          ],
          stops: [
            0.0,
            0.3,
            0.45,
            0.55,
            0.7,
            1.0,
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  height: 200,
                  width: 200,
                  child:
                      Image.asset('asset/module/module_manager/Layer 1 2.png')),
              kHeight30,
              Text(
                'Verification complete',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 23),
              ),
              kHeight10,
              Text('Your Phone number has been verified',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 12)),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30), color: kwhite),
                  child: Center(
                      child: Text(
                    'Continue',
                    style: Theme.of(context).textTheme.titleMedium,
                  ))),
              onTap: () {
                authController.chooseModule(context);
                showCustomToast(
                  message: islogin
                      ? 'User Logged In Successfully'
                      : 'User Registered Successfully',
                );
              },
            ),
          ),
          kHeight30,
        ],
      ),
    ));
  }
}
