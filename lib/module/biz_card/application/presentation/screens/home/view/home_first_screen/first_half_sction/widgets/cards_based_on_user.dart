import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/card.dart'
    as cards;
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardsbasedOnUserConnection extends StatelessWidget {
  const CardsbasedOnUserConnection({super.key, this.card});

  final List<cards.Card>? card;

  @override
  Widget build(BuildContext context) {
    final connectionsController = Get.find<ConnectionsController>();
    return SizedBox(
      height: 300.h,
      child: Column(children: [
        ...List.generate(
          (card?.length ?? 0),
          (index) => Container(
            margin:
                EdgeInsets.only(bottom: 10.w, left: 5.w, right: 5.w, top: 5.w),
            decoration: BoxDecoration(
                border: Border.all(color: neonShade),
                borderRadius: kBorderRadius10),
            child: ListTile(
              onTap: () {
                final id = connectionsController.myConnections[index].cards
                    ?.map((e) => e.toCard)
                    .toList();
                Map<String, String> map = id != null
                    ? {'myCard': 'false', 'cardId': id[index] ?? ''}
                    : <String, String>{};
                GoRouter.of(context)
                    .pushNamed(Routes.cardDetailView, pathParameters: map);
                Navigator.pop(context);
              },
              leading: CircleAvatar(
                radius: 18,
                backgroundColor: textFieldFillColr,
                child: card?[index].imageUrl != null
                    ? Image.memory(base64Decode(card?[index].imageUrl))
                    : const Center(
                        child: Icon(
                          Icons.person,
                          color: neonShade,
                        ),
                      ),
              ),
              title: Text(
                card?[index].name ?? '',
                style: TextStyle(
                  fontSize: kwidth * .040,
                ),
              ),
              subtitle: Text(card?[index].businessDesignation ?? ''),
            ),
          ),
        )
      ]),
    );
  }
}
