import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Validate {
  phone,
  mobOrLandline,
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
  emailOrPhone,
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
  final double? padding;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField(
      {Key? key,
      this.padding,
      this.inputFormatters,
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
      padding: EdgeInsets.symmetric(horizontal: widget.padding ?? 0),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        autofocus: false,
        onTapOutside: (event) {
          if (widget.onTapOutside != null) {
            widget.onTapOutside!();
          }
        },
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
          switch (widget.validate) {
            case Validate.none:
              return null;

            case Validate.notNull:
              if (value == null || value.isEmpty) {
                if (value == 'Content' && value!.length < 20) {
                  return 'Content must be at least 20 characters';
                } else if (widget.labelText == '') {
                  return 'Enter ${widget.labelText}';
                }
                return 'Please enter ${widget.labelText}';
              }
              break;

            case Validate.emailOrPhone:
              if (isValidEmail(value!)) {
                return null;
              }
              if (isValidPhoneNumber(value)) {
                return null;
              }
              return 'Enter valid email or phone number';

            case Validate.email:
              if (!isValidEmail(value!)) {
                return 'Please enter a valid email address';
              }
              break;

            case Validate.password:
              if (value!.length < 8) {
                return 'Password must contain at least 8 characters';
              }
              if (!hasLowerCase(value)) {
                return 'Password must contain lowercase letters';
              } else if (!hasCapsLetter(value)) {
                return 'Password must contain uppercase letters';
              } else if (!hasNumbers(value)) {
                return 'Password must contain numbers';
              } else if (!hasSpecialChar(value)) {
                return 'Password must contain special characters';
              } else if (value.length < 8) {
                return 'Password must contain 8 characters';
              }
              break;

            case Validate.phone:
              if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                return 'Enter valid phone number (numeric characters only)';
              } else if (value.length != 10) {
                return 'Phone number should have exactly 10 digits';
              }
              break;

            case Validate.mobOrLandline:
              if (isValidPhoneNumber(value!)) {
                return null;
              } else if (isValidLandlineNumber(value)) {
                return null;
              } else {
                return 'enter valid mobile or landline number';
              }

            case Validate.rePassword:
              if (widget.password!.text.trim() != value) {
                return 'Passwords must be the same';
              }
              break;

            case Validate.ifsc:
              if (value != '' && !isValidIFSC(value!)) {
                return 'Enter valid IFSC code';
              }
              break;

            case Validate.upi:
              if (value != '' && !isValidUpiId(value!)) {
                return 'Enter valid UPI ID';
              }
              break;

            case Validate.gst:
              if (value != '' && !isValidGst(value!)) {
                return 'Enter valid GST number';
              }
              break;

            default:
              if (value == 'Content' && value!.length < 20) {
                return 'Content must be at least 20 characters';
              }
          }
          return null;
        },
      ),
    );
  }
}
