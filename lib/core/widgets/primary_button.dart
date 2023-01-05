import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workiom/core/constants/app_assets.dart';
import 'package:workiom/core/constants/constants.dart';

import '../constants/AppColors.dart';
import '../constants/AppTheme.dart';

class PrimaryButton extends StatelessWidget {
  final String textButton;
  final String? image;
  final VoidCallback onClick;
  final bool isSvg;
  final bool withIcon;
  final bool isSmall;
  final bool? chip;
  final Color? buttonColor;
  const PrimaryButton(
      {Key? key,
      required this.textButton,
      this.image,
      required this.onClick,
      this.isSvg = true,
      this.withIcon = true,
      this.isSmall = false, this.chip, this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(20),
                ),
                color: buttonColor ?? AppColors.greySwatch[10]),
            width: isSmall ? 30.w : 100.w,
            height: isSmall ? 40 : 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (withIcon) ...{
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: isSvg
                          ? SvgPicture.asset(
                        image!,
                        fit: BoxFit.scaleDown,
                        width: 8.w,
                      )
                          : Image.asset(image!))
                },
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(textButton,
                        style: AppTheme.headline3.copyWith(
                            fontWeight:
                            isSmall ? FontWeight.normal : FontWeight.bold,
                            color: withIcon
                                ? AppColors.black
                                : isSmall
                                ? AppColors.blackText
                                : AppColors.white))),
              ],
            ),
          ),
          if(chip != null)
            Positioned(
              right: isEnglish() ? 0 : null,
              left: isEnglish() ? null : 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppAssets.chip,
                  fit: BoxFit.scaleDown,
                  width: 8.w,
                  height: 40,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
