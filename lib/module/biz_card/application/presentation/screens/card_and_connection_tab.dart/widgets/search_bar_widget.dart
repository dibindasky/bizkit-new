import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final connectionController = Get.find<ConnectionsController>();
    return Container(
      width: 350.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: klightgrey,
        borderRadius: kBorderRadius15,
      ),
      child: TextField(
        // enabled: false,
        controller: connectionController.searchController,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        // autofocus: true,
        decoration: InputDecoration(
          labelText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: InputBorder.none,
          labelStyle: Theme.of(context).textTheme.displaySmall,
        ),
        onChanged: (value) {
          connectionController.searchBizcardAndConnection(
              tabController.index, value);
          // Todo Implement search logic based on `value`
        },
      ),
    );
  }
}
