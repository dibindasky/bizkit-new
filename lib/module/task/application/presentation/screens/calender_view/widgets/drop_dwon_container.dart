import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

const kwhite = Colors.white;
const klightgrey = Colors.grey;
const kblack = Colors.black;
const kBorderRadius5 = BorderRadius.all(Radius.circular(5));

class DropDownContainer extends StatefulWidget {
  const DropDownContainer({
    super.key,
    required this.controller,
    required this.items,
    this.onChanged,
  });

  final TextEditingController controller;
  final List<String> items;
  final Function(String?)? onChanged;

  @override
  State<DropDownContainer> createState() => _DropDownContainerState();
}

class _DropDownContainerState extends State<DropDownContainer> {
  bool containerOpenArrow1 = false;
  bool containerOpenArrow2 = false;
  bool dropDownOn = false;
  String? selectedItem = 'All';

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
                  ? Icon(
                      Icons.arrow_drop_up_sharp,
                      color: kwhite,
                    )
                  : Icon(
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
            hint: const Text('Variant'),
            isExpanded: true,
            items: [
              const DropdownMenuItem<String>(
                value: 'All',
                child: Text('All'),
              ),
              ...widget.items.map((String item) {
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
            dropdownStyleData: const DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: kBorderRadius5,
                color: klightgrey,
              ),
              offset: Offset(0, -5),
              maxHeight: 250,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
            dropdownSearchData: dropdownSearchData(
              controller: widget.controller,
              data: 'variant',
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
