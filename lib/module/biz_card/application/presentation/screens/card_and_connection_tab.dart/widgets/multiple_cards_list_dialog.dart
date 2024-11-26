import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/card.dart'
    as cards;
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardsbasedOnUserConnection extends StatelessWidget {
  const CardsbasedOnUserConnection({super.key, this.card});

  final List<cards.Card>? card;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          adjustHieght(5.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cards',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 14)),
                IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
          ),
          ...List.generate(
            (card?.length ?? 0),
            (index) => Container(
              margin: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                border: Border.all(color: neonShade),
                borderRadius: kBorderRadius20,
              ),
              child: ListTile(
                onTap: () {
                  final id = card?.map((e) => e?.toCard ?? '').toList();
                  Map<String, String> map = id != null
                      ? {'myCard': 'false', 'cardId': id[index]}
                      : <String, String>{};
                  Get.find<ConnectionsController>().getConnectionCardDetail(
                      cardId: id?[index] ?? '', refresh: true);

                  GoRouter.of(context)
                      .pushNamed(Routes.cardDetailView, pathParameters: map);
                  GoRouter.of(context).pop(context);
                },
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: lightGrey,
                  child: ClipOval(
                    child: card?[index].imageUrl != null
                        ? NetworkImageWithLoader(
                            card?[index].imageUrl,
                          )
                        : const Icon(Icons.person, color: neonShade),
                  ),
                ),
                title: Text(
                  card?[index].name ?? '',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                subtitle: Text(
                  card?[index].businessDesignation ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 10),
                ),
              ),
            ),
          ),
          adjustHieght(10.h),
        ],
      ),
    );
  }
}
