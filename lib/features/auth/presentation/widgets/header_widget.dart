import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/AppColors.dart';
import '../../../../core/constants/AppTheme.dart';
import '../../../../core/constants/app_assets.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(),
          style: AppTheme.headline1.copyWith(fontSize: 22, letterSpacing: 1),
        ),
        Row(
          children: [
            Text(
              "Let's start an amazing journey!".tr(),
              style: AppTheme.headline2.copyWith(
                  color: AppColors.darkText,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.0),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppAssets.emoji_hand, height: 3.0.h),
            ),
          ],
        ),
      ],
    );
  }
}
