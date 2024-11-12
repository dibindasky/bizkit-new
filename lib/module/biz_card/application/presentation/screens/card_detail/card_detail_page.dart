import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BizCardDetailScreen extends StatefulWidget {
  const BizCardDetailScreen({super.key, this.cardId, required this.myCard});
  final String? cardId;
  final bool myCard;

  @override
  State<BizCardDetailScreen> createState() => _BizCardDetailScreenState();
}

class _BizCardDetailScreenState extends State<BizCardDetailScreen> {
  final cardController = Get.find<CardController>();
  final personalDetailsController = Get.find<PersonalDetailsController>();
  final businessDetailsController = Get.find<BusinesDetailsController>();
  final connectionController = Get.find<ConnectionsController>();

  @override
  void initState() {
    getCard();
    super.initState();
  }

  Future getCard() async {
    if (widget.cardId != null && widget.myCard) {
      cardController.cardDetail(cardId: widget.cardId ?? '');
    } else if (!widget.myCard) {
      connectionController.getConnectionCardDetail(cardId: widget.cardId ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('asset/module/bizcard/edit_bizcard.png'))),
            child: Column(),
          )
        ],
      ),
    );
  }
}
