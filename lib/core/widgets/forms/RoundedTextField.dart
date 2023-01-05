import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/AppColors.dart';

class RoundedTextField extends StatefulWidget {
  final String? helperText;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? initialValue;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final bool? isPhoneNumber;
  final ValueChanged<String>? onChange;
  final List<Object>? values;
  final bool withBorder;
  final bool isPassword;
  final bool error;

   RoundedTextField(
      {Key? key,
      this.hintText,
      this.initialValue,
      this.onTap,
      this.readOnly = false,
      this.controller,
      this.labelText,
      this.keyboardType,
      this.validator,
      this.prefix,
      this.helperText,
      this.inputFormatters,
      this.maxLength,
      this.maxLines,
      this.suffixIcon,
      this.isPhoneNumber = false,
      this.values,
      this.onChange,  this.withBorder = false, this.suffix,  this.isPassword = false,  this.error = false,})
      : super(key: key);

  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {

  late bool isVisiblePassword;
  @override
  void initState() {
    isVisiblePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColors.greySwatch[40]),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: widget.maxLines ?? 1,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      onTap: widget.onTap,
      readOnly: widget.readOnly ?? false,
      keyboardType: isVisiblePassword ? TextInputType.text : TextInputType.visiblePassword,
      initialValue: widget.initialValue,
      cursorColor: AppColors.primary,
      onChanged: widget.onChange,
      obscureText: widget.isPassword ? isVisiblePassword : widget.isPassword,
      decoration: InputDecoration(
        prefix: widget.prefix,
        suffix: widget.suffix,
        suffixIcon: widget.suffixIcon != null ?  InkWell(
          onTap: () {
            if(widget.isPassword){
              setState(() {
                isVisiblePassword = !isVisiblePassword;
              });
            }
          },
          child: widget.suffixIcon ,
        ) : null,
        helperText: widget.helperText,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: widget.error ? AppColors.red : AppColors.greySwatch[20]!, width: 2.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color:widget.error ? AppColors.red : AppColors.greySwatch[20]!, width: 2.0),
        ),
        border:  UnderlineInputBorder(borderRadius: BorderRadius.circular(5.0),borderSide: BorderSide(color:widget.error ? AppColors.red :AppColors.greySwatch[20]!, width: 2.0),),
        hintText: widget.hintText,
        // labelText: widget.hintText,
      ),
      validator: widget.validator,
    );
  }
}
