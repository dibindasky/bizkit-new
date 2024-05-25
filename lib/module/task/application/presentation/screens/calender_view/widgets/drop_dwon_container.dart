import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDownContainer extends StatefulWidget {
  const DropDownContainer({
    super.key,
    required this.controller,
    required this.items,
    this.onChanged,
    required this.hint,
    this.onTap,
  });

  final TextEditingController controller;
  final List<String> items;
  final Function(String?)? onChanged;
  final String hint;
  final String Function(String?)? onTap;

  @override
  State<DropDownContainer> createState() => _DropDownContainerState();
}

class _DropDownContainerState extends State<DropDownContainer> {
  bool containerOpenArrow1 = false;
  bool containerOpenArrow2 = false;
  bool dropDownOn = false;
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            iconStyleData: IconStyleData(
              icon: containerOpenArrow2
                  ? const Icon(
                      Icons.arrow_drop_up_sharp,
                      color: kwhite,
                    )
                  : const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: kwhite,
                    ),
            ),
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                color: klightgrey,
                border: Border.all(
                  color: kblack,
                ),
                borderRadius: kBorderRadius5,
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 0,
            ),
            hint: Text(widget.hint),
            isExpanded: true,
            items: [
              ...widget.items.toSet().map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            ],
            onChanged: (String? value) {
              setState(() {
                selectedItem = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            value: selectedItem,
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: kBorderRadius5,
                color: backgroundColour,
              ),
              offset: const Offset(0, -5),
              maxHeight: 250,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
            dropdownSearchData: dropdownSearchData(
              controller: widget.controller,
              data: widget.hint,
            ),
            onMenuStateChange: (isOpen) {
              setState(() {
                containerOpenArrow2 = isOpen;
                dropDownOn = isOpen;
                if (!isOpen) {
                  widget.controller.clear();
                }
              });
            },
          ),
        ),
      ),
    );
  }

  DropdownSearchData<String> dropdownSearchData({
    TextEditingController? controller,
    String? data,
  }) {
    return DropdownSearchData(
      searchController: controller,
      searchInnerWidgetHeight: 0,
      searchInnerWidget: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kwhite,
            ),
          ),
        ),
        height: 50,
        child: TextFormField(
          style: const TextStyle(color: kwhite),
          controller: controller,
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: kwhite),
            icon: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              child: Icon(
                Icons.search,
                color: kwhite,
              ),
            ),
            hintText: 'Search',
          ),
        ),
      ),
      searchMatchFn: (item, searchValue) {
        return item.value.toString().toLowerCase().contains(
              searchValue.toLowerCase(),
            );
      },
    );
  }
}
