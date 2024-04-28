import 'dart:convert';

import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/widgets/image_slidable_list.dart';
import 'package:bizkit/domain/model/card/card/accolade/accolade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchivementsScreen extends StatelessWidget {
  const AchivementsScreen({super.key, this.isPreview = true});

  final bool isPreview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: const AppbarCommen(
          tittle: 'Achivement',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<CardBloc, CardState>(
            builder: (context, state) {
              return BlocBuilder<BusinessDataBloc, BusinessDataState>(
                builder: (context, business) {
                  return BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, user) {
                      List achivement = isPreview
                          ? [...user.accolades, ...business.accreditions]
                          : [
                              ...state.anotherCard?.accreditation ?? [],
                              ...state.anotherCard?.accolades ?? []
                            ];
                      if (achivement.isEmpty) {
                        return Center(child: Image.asset(emptyNodata2));
                      }
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            adjustHieght(kwidth * .09),
                        itemCount: achivement.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                fadePageRoute(SlidablePhotoGallery(
                                    images: achivement[index] is Accolade
                                        ? achivement[index]
                                            .accoladesImage
                                            .map((e) => e.image as String)
                                            .toList()
                                        : achivement[index]
                                            .images
                                            .map((e) => e.image as String)
                                            .toList()))),
                            child: SizedBox(
                              height: 250,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 230,
                                    width: double.infinity,
                                    child: Image.memory(
                                      base64.decode(
                                          (achivement[index] is Accolade
                                                  ? achivement[index]
                                                      .accoladesImage[0]
                                                      .image
                                                  : achivement[index]
                                                      .images[0]
                                                      .image)
                                              .substring(22)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      color: kblack.withOpacity(.5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            achivement[index] is Accolade
                                                ? achivement[index].accolades
                                                : achivement[index].label,
                                            style: textStyle1.copyWith(
                                              fontSize: kwidth * .04,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            achivement[index] is Accolade
                                                ? achivement[index]
                                                    .accoladesDescription
                                                : achivement[index].description,
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
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          )),
    );
  }
}
