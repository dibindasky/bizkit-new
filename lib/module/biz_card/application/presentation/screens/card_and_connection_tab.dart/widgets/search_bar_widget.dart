import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: klightgrey,
        borderRadius: kBorderRadius15,
      ),
      child: Expanded(
        child: TextField(
          enabled: false,
          controller: _searchController,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Search',
            prefixIcon: const Icon(Icons.search),
            border: InputBorder.none,
            labelStyle: Theme.of(context).textTheme.displaySmall,
          ),
          onSubmitted: (value) {
            // Todo Implement search logic based on `value`
          },
        ),
      ),
    );
  }
}
