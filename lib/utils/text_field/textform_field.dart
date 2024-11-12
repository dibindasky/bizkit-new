import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/validators/validation_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constant.dart';

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
          color: kblack,
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
          enabledBorder: OutlineInputBorder(
              borderSide:const BorderSide(color:Colors.black12 , width: 1,), // Border color and width
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          border: UnderlineInputBorder(
            borderSide:
                widget.showUnderline ? const BorderSide() : BorderSide.none,
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color:Colors.black12 , width: 1,),
          ),
        ),
        validator: (value) {
          return ValidationTextField.validateTextField(
              validate: widget.validate,
              labelText: widget.labelText,
              value: value,
              password: widget.password?.text);
        },
      ),
    );
  }
}
