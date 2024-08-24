import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail_view/card_detail_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class BizkitConnectionsTab extends StatelessWidget {
  const BizkitConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          // context.read<ConnectionRequestBloc>().add(
          //     const ConnectionRequestEvent.getBizkitConnections(
          //         query: ''));
          await Future.delayed(const Duration(seconds: 2));
        },
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 1,
            child: ColoredBox(color: kgrey),
          ),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            //final data = state.bizkitConnections![index];
            return ListTile(
                onTap: () {
                  //print(data.toJson());
                  // Navigator.push(
                  //     context, cardFadePageRoute(const ScreenCardDetailView()));
                },
                leading: CircleAvatar(
                  backgroundColor: textFieldFillColr,
                  backgroundImage:
                      MemoryImage(base64.decode(getBase64(imageTestingBase64))),
                ),
                title: const Text(
                  'Name',
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text(
                  'Designation',
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: PopupMenuButton(itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        onTap: () {
                          // context.read<ConnectionRequestBloc>().add(
                          //     ConnectionRequestEvent
                          //         .blockBizkitConnections(
                          //             blockBizkitConnection:
                          //                 BlockBizkitConnection(
                          //                     isBlock: true),
                          //             connectionId: data.id!));
                        },
                        child: const Text('Block'))
                  ];
                }));
          },
        ),
      ),
    );
  }
}
