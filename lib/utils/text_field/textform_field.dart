import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/validators/validators.dart';
import 'package:flutter/material.dart';

enum Validate {
  phone,
  email,
  password,
  none,
  rePassword,
  adminEmail,
  notNull,
  ifsc,
  upi,
  gst,
  website,
  ifValidnumber,
  ifValidWebsite,
  ifValidEmail,
}

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;
  final VoidCallback? function;
  final VoidCallback? onTapOutside;
  final int? maxlegth;
  final double? height;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Color? clr;
  final Function(String value)? onChanaged;
  final Function(String? value)? onSubmitted;
  final VoidCallback? onTap;
  final TextEditingController? password;
  final FocusNode? focusNode;
  final bool showUnderline;
  final Validate validate;
  final TextCapitalization textCapitalization;
  final bool enabled;
  final double textSize;
  const CustomTextFormField(
      {Key? key,
      this.enabled = true,
      this.prefix,
      this.onSubmitted,
      this.validate = Validate.none,
      this.password,
      this.showUnderline = false,
      this.clr,
      required this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.inputType = TextInputType.name,
      this.obscureText = false,
      this.maxlegth,
      this.height,
      this.maxLines,
      this.function,
      this.onTap,
      this.onChanaged,
      this.focusNode,
      this.hintText,
      this.textSize = 0.033,
      this.textCapitalization = TextCapitalization.none,
      this.onTapOutside})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  // final FocusNode _focusNode = FocusNode();

  bool showEye = false;

  @override
  void initState() {
    super.initState();
    showEye = widget.obscureText;
    // _focusNode.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    // _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Material(
        elevation: 3,
        color: textFieldFillColr,
        child: TextFormField(
          autofocus: false,
          onTapOutside: (event) {
            if (widget.onTapOutside != null) {
              widget.onTapOutside!();
            }
            // _focusNode.unfocus();
          },
          // onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          textCapitalization: widget.textCapitalization,
          maxLines: widget.maxLines ?? 1,
          style: TextStyle(
            color: kwhite,
            fontSize: kwidth * widget.textSize,
          ),
          maxLength: widget.maxlegth,
          onChanged: widget.onChanaged,
          onSaved: widget.onSubmitted,
          obscureText: showEye,
          controller: widget.controller,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            counter: const SizedBox.shrink(),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showEye = !showEye;
                      });
                    },
                    icon: Icon(showEye
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye))
                : widget.suffixIcon,
            prefix: widget.prefix,
            suffixIconColor: klightgrey,
            prefixIcon: widget.prefixIcon,
            prefixIconColor: kwhite,
            fillColor: textFieldFillColr,
            filled: true,
            hintText: widget.hintText,
            labelText: widget.hintText != null ? null : widget.labelText,
            labelStyle: custumText(
              colr: widget.clr ?? klightgrey,
            ),
            border: UnderlineInputBorder(
              borderSide:
                  widget.showUnderline ? const BorderSide() : BorderSide.none,
              borderRadius: BorderRadius.circular(7),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: kwhite,
              ),
            ),
          ),
          validator: (value) {
            if (Validate.none == widget.validate) {
              return null;
            } else if ((value == null || value.isEmpty) &&
                widget.validate == Validate.notNull) {
              if (value == 'Content' && value!.length < 20) {
                return 'Content must be at least 20 characters';
              } else if (widget.labelText == '') {
                return 'Enter ${widget.labelText}';
              }
              return 'Please enter ${widget.labelText}';
            } else if (widget.validate == Validate.email &&
                !isValidEmail(value!)) {
              return 'Please enter a valid email address';
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
            } else if (Validate.rePassword == widget.validate &&
                widget.password!.text.trim() != value) {
              return 'Password must be same';
            } else if (Validate.ifsc == widget.validate) {
              if (value != '' && !isValidIFSC(value!)) {
                return 'Enter valid IFSC code';
              } else {
                return null;
              }
            } else if (Validate.upi == widget.validate) {
              if (value != '' && !isValidUpiId(value!)) {
                return 'Enter valid upi id';
              } else {
                return null;
              }
            } else if (Validate.gst == widget.validate) {
              if (value != '' && !isValidGst(value!)) {
                return 'Enter valid gst no';
              } else {
                return null;
              }
            } else if (value == 'Content' && value!.length < 20) {
              return 'Content must be at least 20 characters';
            }
            return null;
          },
        ),
      ),
    );
  }
}