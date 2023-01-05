import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/AppTheme.dart';
import '../../../../core/utils/launcher.dart';


class TremsOfServiceAndPrivacyWidget extends StatelessWidget {
  const TremsOfServiceAndPrivacyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 2.w),
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 2.sp,
          children: [
            Text(
              "By signing up, you agree".tr() + " ",
              style: AppTheme.headline5,
            ),
            InkWell(
              onTap: () {
                Launcher.launchURL('https://workiomapp.com/privacypolicy');
              },
              child: Text(
                "Terms Of Service".tr() + " ",
                style: AppTheme.headline5
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
            Text(
              "And".tr() + " ",
              style: AppTheme.headline5,
            ),
            InkWell(
              onTap: () {
                Launcher.launchURL('https://workiomapp.com/privacypolicy');
              },
              child: Text(
                "Privacy Policy".tr(),
                style: AppTheme.headline5
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}