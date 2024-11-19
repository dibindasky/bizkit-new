import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_detail/bottom_sheets_and_pop_up/address_list_branches_pop_up.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/branch_office.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BizcardDetailLocationListBranchSheet extends StatelessWidget {
  const BizcardDetailLocationListBranchSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardController = Get.find<CardController>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          // border: Border.all(color: Theme.of(context).),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).scaffoldBackgroundColor),
      child: (cardController.businessDetails.value?.branchOffices?.isEmpty ??
              true)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                kHeight10,
                Icon(Icons.location_off_outlined,
                    color: Theme.of(context).colorScheme.onPrimary),
                kHeight10,
                Text(
                  'Location/Address not available',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                kHeight10
              ],
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  (cardController
                              .businessDetails.value?.branchOffices?.isEmpty ??
                          true)
                      ? const SizedBox()
                      : Text('Branch Office Address',
                          style: Theme.of(context).textTheme.displayMedium),
                  cardController.businessDetails.value?.branchOffices == null ||
                          cardController.businessDetails.value?.branchOffices ==
                              <BranchOffice>[]
                      ? const SizedBox()
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cardController.businessDetails.value
                                  ?.branchOffices?.length ??
                              0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final data = cardController
                                .businessDetails.value?.branchOffices![index];
                            return AddressTilePopUp(
                                location: data?.branchLocation ?? '',
                                address: data?.branchAddress ?? '',
                                contactPerson: data?.branchContactPerson ?? '',
                                phone: data?.branchContactNumber ?? '');
                          },
                        )
                ],
              ),
            ),
    );
  }
}
