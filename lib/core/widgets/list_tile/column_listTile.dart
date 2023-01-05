import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/AppTheme.dart';

class ColumnListTile extends StatelessWidget {
  final title;
  final subtitle;
  final underLine;

  const ColumnListTile(
      {Key? key, this.title, this.subtitle, this.underLine = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:  AppTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
            SizedBox(
              height: 0.5.h,
            ),
          Text(subtitle, style: AppTheme.headline2,overflow: TextOverflow.ellipsis,
            softWrap: false,),

            // Expanded(
            //   child: Divider(
            //     indent: 1.w,
            //     endIndent: 1.w,
            //   ),
            // ),
        ],
      ),
    );
  }
}
