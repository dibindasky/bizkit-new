import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/containers/personal_detail_screen/accolades/accolades_create_screen.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccolodesScreen extends StatelessWidget {
  const AccolodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: const AppbarCommen(
          tittle: 'Accolades',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Add your achievements here for people to know about you",
                style: TextStyle(fontSize: kwidth * .043),
              ),
              adjustHieght(khieght * .04),
              ListView.separated(
                separatorBuilder: (context, index) =>
                    adjustHieght(kwidth * .03),
                itemCount: 1,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 260,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            'asset/images/person3.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            color: klightgrey.withOpacity(.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Best Employee Award',
                                  style: textStyle1.copyWith(
                                    fontSize: kwidth * .04,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Lorem Ipsum Sic Mundus Creatus Est. Lorem Ipsum Sic Mundus Creatus Est.',
                                  style: textStyle1.copyWith(
                                    fontSize: kwidth * .03,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              adjustHieght(khieght * .03),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    await PickImage.getImage();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const AccoladesBrochersAddSreateScreen(
                        isFromAccolades: true,
                      ),
                    ));
                  },
                  child: DottedBorder(
                    dashPattern: const [8, 8],
                    color: neonShade,
                    strokeWidth: 2.5,
                    child: SizedBox(
                      width: double.infinity,
                      height: kwidth * 0.25,
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
                            'Add Achievements',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              adjustHieght(khieght * .02),
              AuthButton(
                hieght: 48,
                text: 'Continue',
                onTap: () => Navigator.of(context).pop(),
              ),
              adjustHieght(khieght * .02),
            ],
          ),
        ),
      ),
    );
  }
}
