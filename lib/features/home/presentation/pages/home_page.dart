import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workiom/core/constants/AppTheme.dart';
import 'package:workiom/core/constants/app_assets.dart';
import '../../../../core/utils/launcher.dart';
import '../../../../core/widgets/appbar/GeneralAppBar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to",
            style: AppTheme.headline1.copyWith(fontSize: 35),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Launcher.launchURL("https://www.workiom.com/");
              },
              child: SvgPicture.asset(
                AppAssets.app,
                width: 70.0.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
