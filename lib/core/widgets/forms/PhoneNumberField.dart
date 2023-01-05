import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberField extends StatefulWidget {
  final String? hintText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final bool isValidator;
  final TextEditingController? controller;
  final bool? isPhoneNumber;
  final ValueChanged<Country>? onCountryChanged;

  PhoneNumberField({
    Key? key,
    this.hintText,
    this.validator,
    this.initialValue,
    this.controller,
    this.isPhoneNumber = false,
    this.onCountryChanged,
    this.isValidator = true,
  }) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: IntlPhoneField(
        flagsButtonMargin: EdgeInsets.zero,
        dropdownTextStyle: TextStyle(),
        onCountryChanged: widget.onCountryChanged,
       // countries: ["SY", "LB", "KW"],
        controller: widget.controller,
        validator: (e) {
          return null;
        },
        autovalidateMode: widget.isValidator
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        inputFormatters: [
          new FilteringTextInputFormatter.allow((RegExp("[0-9]"))),
        ],
        decoration: InputDecoration(
          labelText: 'Phone Number'.tr(),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'KW',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
      ),
    );
  }
}
