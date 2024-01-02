import 'package:bizkit/core/const.dart';
import 'package:flutter/material.dart';

class TTextFormField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final TextInputType inputType;
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
    required this.controller,
    required this.inputType,
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
        keyboardType: inputType,
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
