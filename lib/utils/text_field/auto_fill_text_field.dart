import 'dart:developer';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/validators/validation_textfield.dart';
import 'package:flutter/material.dart';

class AutocompleteTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;
  final bool showDropdown;
  final bool showDropdownOnTap;
  final bool enabled;
  final bool doAutoFill;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintColor;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final Function(String value)? onDropDownSelection;
  final FocusNode? focusNode;
  final UnderlineInputBorder? border;
  final List<String>? autocompleteItems;
  final Validate validate;
  final TextCapitalization textCapitalization;

  const AutocompleteTextField({
    this.border,
    Key? key,
    this.doAutoFill = true,
    this.showDropdown = false,
    this.textCapitalization = TextCapitalization.none,
    this.enabled = true,
    this.showDropdownOnTap = false,
    this.validate = Validate.none,
    this.onDropDownSelection,
    required this.label,
    this.controller,
    this.inputType,
    this.obscureText = false,
    this.maxLength,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.hintColor,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.autocompleteItems,
    this.hintText,
  }) : super(key: key);

  @override
  _AutocompleteTextFieldState createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
  List<String> filteredAutocompleteItems = [];
  bool isDropdownVisible = false;

  List<String> convertListToLowercaseExceptFirst(List<String> inputList) {
    List<String> result = [];
    for (String str in inputList) {
      if (str.isNotEmpty) {
        result.add(
            str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase());
      } else {
        result.add(str.toLowerCase());
      }
    }
    return result;
  }

  @override
  void initState() {
    if (widget.doAutoFill) {
      if (widget.autocompleteItems != null &&
          widget.autocompleteItems!.isNotEmpty) {
        filteredAutocompleteItems =
            convertListToLowercaseExceptFirst(widget.autocompleteItems!);
      }
      if (widget.autocompleteItems != null &&
          widget.autocompleteItems!.length == 1 &&
          widget.controller!.text == '') {
        widget.controller!.text = widget.autocompleteItems![0];
      }
    }
    super.initState();
  }

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if ((widget.autocompleteItems != null &&
                      widget.autocompleteItems!.isNotEmpty) ||
                  widget.showDropdown) {
                if (!widget.enabled && isDropdownVisible) {
                  setState(() {
                    isDropdownVisible = !isDropdownVisible;
                  });
                } else {
                  setState(() {
                    isDropdownVisible = true;
                    if (!widget.enabled) {
                      filteredAutocompleteItems = widget.autocompleteItems!;
                    }
                  });
                }
              }
              if (widget.onTap != null) {
                widget.onTap!.call();
              }
            },
            child: TextFormField(

                // buildCounter: (context, {int currentLength,bool isFocused,int? maxLength}) =>SizedBox.shrink() ,
                textCapitalization: widget.textCapitalization,
                focusNode: widget.focusNode ?? myFocusNode,
                onTap: () {
                  if (widget.enabled &&
                      ((widget.autocompleteItems != null &&
                              widget.autocompleteItems!.isNotEmpty) ||
                          widget.showDropdown)) {
                    setState(() {
                      isDropdownVisible = true;
                      if (!widget.enabled) {
                        filteredAutocompleteItems = widget.autocompleteItems!;
                      }
                    });
                  }

                  if (widget.onTap != null) {
                    widget.onTap!.call();
                  }
                },
                onChanged: (value) {
                  if (value.contains(' ') &&
                      filteredAutocompleteItems.isNotEmpty) {
                    setState(() {
                      isDropdownVisible = true;
                      log("$isDropdownVisible");
                    });
                  }
                  if (widget.enabled) {
                    setState(() {
                      isDropdownVisible = true;
                      filteredAutocompleteItems = value.isEmpty
                          ? widget.autocompleteItems!
                          : widget.autocompleteItems
                                  ?.where((item) => item
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                  .toList() ??
                              [];
                    });
                  }
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                },
                style: Theme.of(context).textTheme.displaySmall,
                maxLines: widget.maxLines ?? 1,
                maxLength: widget.maxLength,
                enabled: widget.enabled,
                obscureText: widget.obscureText,
                controller: widget.controller,
                keyboardType: widget.inputType ?? TextInputType.name,
                decoration: InputDecoration(
                    counter: const SizedBox.shrink(),
                    suffixIcon: widget.suffixIcon ??
                        (isDropdownVisible &&
                                filteredAutocompleteItems.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isDropdownVisible = !isDropdownVisible;
                                  });
                                },
                                icon: const CircleAvatar(
                                  radius: 10,
                                  child: Icon(
                                    Icons.clear_rounded,
                                    size: 15,
                                  ),
                                ),
                              )
                            : null),
                    prefixIcon: widget.prefixIcon,
                    filled: true,
                    hintText: widget.hintText,
                    labelText: widget.label,
                    border: widget.border),
                validator: (value) {
                  return ValidationTextField.validateTextField(
                      validate: widget.validate,
                      labelText: widget.label,
                      value: value);
                }),
          ),
          if (isDropdownVisible && filteredAutocompleteItems.isNotEmpty)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: kGreyNormal,
                  thickness: 0,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredAutocompleteItems.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 35,
                    child: Center(
                      child: ListTile(
                        title: Text(filteredAutocompleteItems[index],
                            style: Theme.of(context).textTheme.displaySmall),
                        onTap: () {
                          setState(() {
                            widget.controller?.text =
                                filteredAutocompleteItems[index];
                            filteredAutocompleteItems = [];
                            if (widget.enabled) {
                              myFocusNode.requestFocus();
                            }
                          });
                          if (widget.onDropDownSelection != null) {
                            widget
                                .onDropDownSelection!(widget.controller!.text);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
