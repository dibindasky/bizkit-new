import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/validators/validators.dart';
import 'package:flutter/material.dart';

class AutocompleteTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;
  final bool showDropdown;
  final bool showDropdownOnTap;
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintColor;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final Function(String value)? onDropDownSelection;
  final FocusNode? focusNode;
  final List<String>? autocompleteItems;
  final Validate? validate;
  final TextCapitalization textCapitalization;

  const AutocompleteTextField({
    Key? key,
    this.showDropdown = false,
    this.textCapitalization = TextCapitalization.none,
    this.enabled = true,
    this.showDropdownOnTap = false,
    this.validate,
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
  }) : super(key: key);

  @override
  _AutocompleteTextFieldState createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
  List<String> filteredAutocompleteItems = [];
  bool isDropdownVisible = false;
  @override
  void initState() {
    filteredAutocompleteItems = widget.autocompleteItems ?? [];
    super.initState();

    if (widget.autocompleteItems != null &&
        widget.autocompleteItems!.length == 1) {
      widget.controller!.text = widget.autocompleteItems![0];
    }
  }

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 3,
        color: textFieldFillColr,
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
                maxLines: widget.maxLines ?? 1,
                style: TextStyle(
                  color: kwhite,
                  fontSize: kwidth * 0.033,
                ),
                maxLength: widget.maxLength,

                // onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                enabled: widget.enabled,
                obscureText: widget.obscureText,
                controller: widget.controller,
                keyboardType: widget.inputType ?? TextInputType.name,
                decoration: InputDecoration(
                  suffixIcon: widget.suffixIcon ??
                      (isDropdownVisible && filteredAutocompleteItems.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  // myFocusNode.requestFocus();
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
                  suffixIconColor: klightgrey,
                  prefixIcon: widget.prefixIcon,
                  prefixIconColor: kwhite,
                  fillColor: textFieldFillColr,
                  filled: true,
                  labelText: widget.label,
                  labelStyle: custumText(
                    colr: widget.hintColor ?? klightgrey,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                validator: (value) {
                  // if value exist in textForm field then only this condtition true
                  if (Validate.ifValidnumber == widget.validate) {
                    if (value != null && value.isNotEmpty) {
                      if (value.length != 10 || !isValidPhoneNumber(value)) {
                        return 'Phone Number is not valid';
                      }
                    }
                    return null;
                  }
                  // if value exist in textForm field then only this condtition true
                  if (Validate.ifValidEmail == widget.validate) {
                    if (value != null && value.isNotEmpty) {
                      if (!isValidEmail(value)) {
                        return 'Email is not valid';
                      }
                    }
                    return null;
                  }
                  // if value exist in textForm field then only this condtition true
                  if (Validate.ifValidWebsite == widget.validate) {
                    if (value != null && value.isNotEmpty) {
                      if (!isURLValid(value)) {
                        return 'Enter valid website';
                      }
                    }
                    return null;
                  }
                  if (Validate.none == widget.validate) {
                    return null;
                  } else if ((value == null || value.isEmpty) &&
                      widget.validate == Validate.notNull) {
                    return 'Please enter ${widget.label}';
                  } else if (widget.validate == Validate.email &&
                      !isValidEmail(value!)) {
                    return 'Please enter a valid email address';
                  } else if (widget.validate == Validate.adminEmail) {
                    if (!isValidEmail(value!)) {
                      return 'Please enter a valid email address';
                    } else if (value.contains('info@') ||
                        value.contains('admin@') ||
                        value.contains('sales@')) {
                      return null;
                    }
                    return 'Enter your organization\'s registered email';
                  } else if (widget.validate == Validate.password &&
                      value!.length < 8) {
                    return 'Password must contain at least 8 characters';
                  } else if (widget.validate == Validate.password) {
                    if (!hasLowerCase(value!)) {
                      return 'Password must contains lowerCase letters';
                    } else if (!hasCapsLetter(value)) {
                      return 'Password must contains UpperCase letters';
                    } else if (!hasNumbers(value)) {
                      return 'Password must contains numbers';
                    } else if (!hasSpecialChar(value)) {
                      return 'Password must contains special characters';
                    } else if (value.length < 8) {
                      return 'Password must contains 8 characters';
                    } else {
                      return null;
                    }
                  } else if (Validate.phone == widget.validate) {
                    if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                      return 'Enter valid phone number (numeric characters only)';
                    } else if (value.length != 10) {
                      return 'Phone number should have exactly 10 digits';
                    } else {
                      return null;
                    }
                  } else if (Validate.website == widget.validate &&
                      !isValidWebsite(value!)) {
                    return 'Enter valid website';
                  }
                  return null;
                },
              ),
            ),
            if (isDropdownVisible && filteredAutocompleteItems.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredAutocompleteItems.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 40,
                      child: ListTile(
                        title: Text(filteredAutocompleteItems[index]),
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
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
