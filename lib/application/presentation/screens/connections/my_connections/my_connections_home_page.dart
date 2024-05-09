import 'dart:convert';

import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/card_view/card_detail_view.dart';
import 'package:bizkit/application/presentation/screens/connections/add_connection_screen.dart';
import 'package:bizkit/application/presentation/screens/connections/view_all_connection_contacts.dart';
import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/home_first_screen.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/widgets/show_case_view.dart';
import 'package:bizkit/domain/model/connections/get_bizkit_connections_response_model/bizkit_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConnectionContainerHomePage extends StatelessWidget {
  const MyConnectionContainerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ConnectionRequestBloc>()
          .add(const ConnectionRequestEvent.getBizkitConnections(query: ''));
    });
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My connections', style: textHeadStyle1),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    fadePageRoute(const MyConnectionsViewAllContacts()),
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Card(
                    elevation: 4,
                    child: ColoredBox(
                      color: backgroundColour,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: CustomShowCaseView(
                          image: personImage,
                          globalKey: globalKeyViewAllConnections,
                          tittle: 'View your added conecctions',
                          description: '',
                          child: Text(
                            'View All',
                            style: TextStyle(
                              decorationColor: kwhite,
                              decorationThickness: 1.5,
                              color: kwhite,
                              fontSize: kwidth * .029,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        adjustHieght(khieght * .03),
        SizedBox(
          width: double.infinity,
          height: 75,
          child: BlocBuilder<ConnectionRequestBloc, ConnectionRequestState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const ShimmerLoader(
                  seprator: SizedBox(width: 10),
                  height: 40,
                  width: 60,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                );
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => adjustWidth(kwidth * .02),
                itemCount: state.bizkitConnections?.length == null
                    ? 1
                    : state.bizkitConnections!.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  BizkitConnection data = BizkitConnection();
                  if (index != 0) {
                    data = state.bizkitConnections![index - 1];
                  }
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, fadePageRoute(ScreenAddConnections()));
                        },
                        child: CustomShowCaseView(
                          description: '',
                          globalKey: globalKeyaddConnections,
                          tittle: 'Start Add connections from here',
                          image: '',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const ColoredBox(
                              color: textFieldFillColr,
                              child: SizedBox(
                                height: 40,
                                width: 60,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: kwhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      print('data.photo =>${data.photos==''}');
                      Navigator.push(
                          context,
                          fadePageRoute(
                              ScreenCardDetailView(cardId: data.cardId)));
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                              color: textFieldFillColr,
                              image: data.photos != null
                                  ? DecorationImage(
                                      image: MemoryImage(
                                        base64.decode(getBase64(data.photos!)),
                                      ),
                                      fit: BoxFit.cover,
                                      onError: (exception, stackTrace) =>
                                          const Icon(Icons
                                              .image_not_supported_outlined),
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                                child: data.photos == null && data.name != null
                                    ? FittedBox(
                                        child: Text(
                                            data.name!
                                                .substring(0, 2)
                                                .toUpperCase(),
                                            style: textHeadStyle1),
                                      )
                                    : null),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: Text(data.name ?? '',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
