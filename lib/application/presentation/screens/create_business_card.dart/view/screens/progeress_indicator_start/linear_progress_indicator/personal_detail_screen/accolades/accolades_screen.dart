import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/accolades/accolades_create_screen.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/card/create_card/accolades/accolade.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccolodesScreen extends StatelessWidget {
  const AccolodesScreen({super.key, this.accolade = true});

  final bool? accolade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: AppbarCommen(
          tittle: accolade == null
              ? 'Achivement'
              : accolade!
                  ? 'Accolades'
                  : 'Accredition',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ accolade == null
                  ? const SizedBox()
                  : 
              Text(
                "Add your achievements here for people to know about you",
                style: TextStyle(fontSize: kwidth * .043),
              ),
             accolade == null
                  ? const SizedBox()
                  :   adjustHieght(khieght * .02),
              accolade == null
                  ? const SizedBox()
                  : Center(
                      child: InkWell(
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                AccoladesAddCreateScreen(accolade: accolade!),
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
              adjustHieght(khieght * .04),
              BlocBuilder<BusinessDataBloc, BusinessDataState>(
                builder: (context, business) {
                  return BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, user) {
                      List achivement = [
                        ...user.accolades,
                        ...business.accreditions
                      ];
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            adjustHieght(kwidth * .03),
                        itemCount: accolade == null
                            ? achivement.length
                            : accolade!
                                ? user.accolades.length
                                : business.accreditions.length,
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
                                  child: Image.file(
                                    accolade == null
                                        ? achivement[index] is AccoladeCreate
                                            ? achivement[index].accoladesImage.fileImage
                                            : achivement[index].image.fileImage
                                        : accolade!
                                            ? user.accolades[index]
                                                .accoladesImage.fileImage
                                            : business.accreditions[index].image
                                                .fileImage,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          accolade == null
                                              ? achivement[index]
                                                      is AccoladeCreate
                                                  ? achivement[index].accolades
                                                  : achivement[index].label
                                              : accolade!
                                                  ? user.accolades[index]
                                                          .accolades ??
                                                      ''
                                                  : business.accreditions[index]
                                                          .label ??
                                                      '',
                                          style: textStyle1.copyWith(
                                            fontSize: kwidth * .04,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          accolade == null
                                              ? achivement[index]
                                                      is AccoladeCreate
                                                  ? achivement[index]
                                                      .accoladesDescription
                                                  : achivement[index]
                                                      .description
                                              : accolade!
                                                  ? user.accolades[index]
                                                          .accoladesDescription ??
                                                      ''
                                                  : business.accreditions[index]
                                                          .description ??
                                                      '',
                                          style: textStyle1.copyWith(
                                            fontSize: kwidth * .03,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                accolade == null
                                    ? const SizedBox()
                                    : Positioned(
                                        right: 10,
                                        top: 10,
                                        child: CircleAvatar(
                                          child: IconButton(
                                            onPressed: () {
                                              accolade!
                                                  ? context
                                                      .read<UserDataBloc>()
                                                      .add(
                                                        UserDataEvent
                                                            .removeAccolade(
                                                                index: index),
                                                      )
                                                  : context
                                                      .read<BusinessDataBloc>()
                                                      .add(
                                                        BusinessDataEvent
                                                            .removeAccredition(
                                                                index: index),
                                                      );
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                            ),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              adjustHieght(khieght * .03),
             accolade == null
                  ? const SizedBox()
                  :   AuthButton(
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
