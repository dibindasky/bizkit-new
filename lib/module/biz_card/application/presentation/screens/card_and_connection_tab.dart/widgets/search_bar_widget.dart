import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required bool isSearching,
    required TextEditingController searchController,
  })  : _isSearching = isSearching,
        _searchController = searchController;

  final bool _isSearching;
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
      child: Row(
        children: [
          adjustWidth(14.w),
          const Icon(Icons.search),
          adjustWidth(10.w),
          if (!_isSearching)
            Text(
              'Search',
              style: Theme.of(context).textTheme.displaySmall,
            )
          else
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: _searchController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Type to search...',
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.displaySmall,
                  ),
                  onSubmitted: (value) {
                    // Todo Implement search logic based on `value`
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
