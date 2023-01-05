import 'package:easy_localization/easy_localization.dart' as t;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/AppColors.dart';
import '../../../../core/constants/AppTheme.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/IconAppbar.dart';
import '../../../../core/widgets/appbar/GeneralAppBar.dart';
import '../../../../core/widgets/drop_down_language.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: GeneralAppBar(
          title: "Settings".tr(),
          leading: IconAppbar(),
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.0.h),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Language".tr(),
                            style: AppTheme.headline2),
                        content: DropDownLanguage(),
                      ));
                },
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.language,
                          ),
                          Gaps.hGap1,
                          Text("Language".tr(), style: AppTheme.headline3),
                          Gaps.vGap4,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                  thickness: 1,
                  color: AppColors.grey[20],
                  endIndent: 24,
                  indent: 24),
            ],
          ),
        ),
      ],
    );
  }
}
