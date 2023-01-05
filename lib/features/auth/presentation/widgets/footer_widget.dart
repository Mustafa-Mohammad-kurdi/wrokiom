import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/AppTheme.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Stay organized with",
            style: AppTheme.headline3,
          ),
        ),
        InkWell(
            onTap: () => Launcher.launchURL("https://www.workiom.com"),
            child: SvgPicture.asset(AppAssets.app))
      ],
    );
  }
}
