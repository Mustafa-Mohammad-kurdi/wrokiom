import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workiom/core/constants/AppTheme.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String prefixImage;
  final Widget textField;
   CustomTextField({Key? key, required this.prefixImage, required this.textField, required this.title}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(widget.title,style: AppTheme.headline3),
          ),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: SvgPicture.asset(widget.prefixImage,height: 2.5.h,),
              ),
              Expanded(child: widget.textField),

            ],
          ),
        ],
      ),
    );
  }
}
