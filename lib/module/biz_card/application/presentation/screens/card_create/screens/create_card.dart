import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/screens/picked_scanning_cards/picked_scanning_cards.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/widgets/card_uploading_showdailogue.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

bool fromHomeAddCard = false;

class ScreenCardCreationStarting extends StatefulWidget {
  const ScreenCardCreationStarting({super.key, this.fromHome = false});
  final bool fromHome;

  @override
  State<ScreenCardCreationStarting> createState() =>
      _ScreenCardCreationStartingState();
}

class _ScreenCardCreationStartingState
    extends State<ScreenCardCreationStarting> {
//   @override
//   void initState() {
//     super.initState();
//     fromHomeAddCard = widget.fromHome;
//   }

  @override
  Widget build(BuildContext context) {
    final textExtractionController = Get.find<CardTextExtractionController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //   context.read<UserDataBloc>().add(UserDataEvent.clear());
      //   context.read<BusinessDataBloc>().add(BusinessDataEvent.clear());
    });
    final size = MediaQuery.of(context).size;
    final khieght = size.height;
    final kwidth = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: knill,
        centerTitle: true,
        title: Text('Business Card', style: textHeadStyle1),
        leading: IconButton(
            onPressed: () {
              textExtractionController.pickedImageUrl.clear();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 17,
            )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: khieght * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cardscanimagesSelectingDailogue(
                            context, const PickedScanningCards(), false);
                      },
                      child: DottedBorder(
                        dashPattern: const [8, 8],
                        color: neonShade,
                        strokeWidth: 2.5,
                        child: SizedBox(
                          width: kwidth * 0.8,
                          height: kwidth * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32.dm,
                                height: 32.dm,
                                child: const CircleAvatar(
                                  child: Icon(Icons.add),
                                ),
                              ),
                              Text(
                                'Scan Card',
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).pushReplacementNamed(
                            Routes.cardCreationProfilePage);
                      },
                      child: Text(
                        'Create Card Manually',
                        style: TextStyle(
                          color: kwhite,
                          fontSize: 10.sp,
                          decoration: TextDecoration.underline,
                          decorationColor: kwhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (widget.fromHome) {
                    Navigator.pop(context);
                  } else {
                    GoRouter.of(context)
                        .pushReplacementNamed(Routes.bizCardNavbar);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: neonShade,
                    ),
                  ),
                  width: 123.dm,
                  height: 45.dm,
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
