import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFormField extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;
  final VoidCallback? function;
  final int? maxlegth;
  final double? height;
  final int? maxLines;
  final Widget? su;
  final Widget? suffix;
  final Color? clr;
  final Function(String)? onChanaged;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  const TTextFormField({
    Key? key,
    this.clr,
    required this.text,
    this.su,
    this.suffix,
    this.controller,
    this.inputType,
    this.obscureText = false,
    this.maxlegth,
    this.height,
    this.maxLines,
    this.function,
    this.onTap,
    this.onChanaged,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 3,
        color: textFieldFillColr,
        child: TextFormField(
          focusNode: focusNode,
          onTap: onTap,
          maxLines: maxLines ?? 1,
          style: TextStyle(
            color: kwhite,
            fontSize: kwidth * 0.033,
          ),
          maxLength: maxlegth,
          onChanged: onChanaged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please $text';
            }
            if (text == 'Enter Your name' && value.length < 4) {
              return 'Name must contain at least 4 letters';
            }
            if (text == 'Enter Your email' && !isValidEmail(value)) {
              return 'Please enter a valid email address';
            }
            if (text == 'Enter Your password' && !isValidPassword(value)) {
              return 'Password must contain at least 8 characters, \none uppercase letter, one lowercase letter, \nand one digit.';
            }
            if (text == 'Enter your phone number') {
              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                return 'Enter valid phone number (numeric characters only)';
              } else if (value.length != 10) {
                return 'Phone number should have exactly 10 digits';
              }
            }
            if (text == 'Enter your Zipcode') {
              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                return 'Enter valid zipcode (numeric characters only)';
              } else if (value.length < 6) {
                return 'Zipcode should have 6 digits or more than 6 digits';
              }
            }
            return null;
          },
          obscureText: obscureText,
          controller: controller,
          keyboardType: inputType ?? TextInputType.name,
          decoration: InputDecoration(
            suffixIcon: suffix,
            suffixIconColor: klightgrey,
            prefixIcon: su,
            prefixIconColor: kwhite,
            fillColor: textFieldFillColr,
            filled: true,
            hintText: text,
            hintStyle: custumText(
              colr: clr ?? klightgrey,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(7),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: kwhite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Regular expression for email validation
  bool isValidEmail(String value) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(value);
  }

  // Regular expression for password validation
  bool isValidPassword(String value) {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegExp.hasMatch(value);
  }
}

class AutocompleteTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintColor;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final List<String>? autocompleteItems;

  const AutocompleteTextField({
    Key? key,
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 3,
        color: textFieldFillColr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              focusNode: widget.focusNode,
              onTap: () {
                if (widget.autocompleteItems!.isNotEmpty) {
                  setState(() {
                    isDropdownVisible = true;
                  });
                  widget.onTap?.call();
                }
              },
              maxLines: widget.maxLines ?? 1,
              style: TextStyle(
                color: kwhite,
                fontSize: kwidth * 0.033,
              ),
              maxLength: widget.maxLength,
              onChanged: (value) {
                setState(() {
                  filteredAutocompleteItems = value.isEmpty
                      ? []
                      : widget.autocompleteItems
                              ?.where((item) => item
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList() ??
                          [];
                });

                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              obscureText: widget.obscureText,
              controller: widget.controller,
              keyboardType: widget.inputType ?? TextInputType.name,
              decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                suffixIconColor: klightgrey,
                prefixIcon: widget.prefixIcon,
                prefixIconColor: kwhite,
                fillColor: textFieldFillColr,
                filled: true,
                hintText: widget.label,
                hintStyle: custumText(
                  colr: widget.hintColor ?? klightgrey,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: kwhite,
                  ),
                ),
              ),
            ),
            if (isDropdownVisible && filteredAutocompleteItems.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: filteredAutocompleteItems.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 50,
                        child: ListTile(
                          title: Text(filteredAutocompleteItems[index]),
                          onTap: () {
                            setState(() {
                              widget.controller?.text =
                                  filteredAutocompleteItems[index];
                              filteredAutocompleteItems = [];
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
