// import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

class ReceivedCardsTab extends StatelessWidget {
  const ReceivedCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // final receivedCardController = Get.find<ReceivedCardController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // receivedCardController.fetchAllreceivedCards();
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.4,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              child: Column(
                children: [
                  Image.asset(bizcardBgImage),
                  adjustHieght(10.h),
                  Text(
                    'name',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    'company',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
