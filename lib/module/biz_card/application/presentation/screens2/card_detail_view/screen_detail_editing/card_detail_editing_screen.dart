import 'package:bizkit/module/biz_card/application/presentation/screens2/card_detail_view/screen_detail_editing/widgets/company_banking_tiles.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> companySearchNotifier = ValueNotifier<int>(2);

class ScreenCardDetailEditingList extends StatelessWidget {
  const ScreenCardDetailEditingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 17),
        ),
        backgroundColor: knill,
        title: const Text('Bizkit Details '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailCustomTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const LinearProgressIndicatorStarting(index: 0),
                        ));
                  },
                  title: 'Personal Details',
                  subTitle: ''),
              const BusinessAndBankingDetailsAddingTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
