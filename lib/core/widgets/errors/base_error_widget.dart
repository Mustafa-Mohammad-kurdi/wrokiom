import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/AppColors.dart';
import '../../constants/AppTheme.dart';

class BaseErrorWidget extends StatefulWidget {
  final GestureTapCallback ?onTap;
  final String? title;
  final String? subtitle;
  final Widget? icon;
  final Widget? button;

  const BaseErrorWidget({
    Key? key,
    this.onTap,
    this.title,
    this.subtitle,
    this.icon,
    this.button,
  }) : super(key: key);

  @override
  State<BaseErrorWidget> createState() => _BaseErrorWidgetState();
}

class _BaseErrorWidgetState extends State<BaseErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100.0.w,
        child: InkWell(
          highlightColor: AppColors.secondary[10],
          onTap: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(0.01.sp),
                child: widget.icon,
              ),

              Text(
                widget.title ?? '',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary[500],
                ),
                textAlign: TextAlign.center,
                //       )AppTheme.headline3
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.subtitle ?? "",
                style: TextStyle(
                  color: AppColors.primary[100],
                  fontSize: 20,
                ),
                //AppTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.h,
              ),
              widget.button??Container()
            ],
          ),
        ),
      ),
    );
  }
}
