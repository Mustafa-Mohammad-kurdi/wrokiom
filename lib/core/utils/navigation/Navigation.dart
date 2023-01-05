import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/features/auth/presentation/pages/welcome_page.dart';
import '../../../features/app/presentation/pages/home_app.dart';
import '../../../features/auth/presentation/pages/register_with_email_page.dart';
import '../../constants/Keys.dart';

class Navigation {
  static Future? popThenPush(Widget page) async {
    Navigation.pop();
    return await Navigation.push(page);
  }

  static Future? push(Widget page) async {
    if (Keys.navigatorKey.currentContext != null)
      return await Navigator.push(
        Keys.navigatorKey.currentContext!,
        CupertinoPageRoute(builder: (context) => page),
      );
  }

  static pop({dynamic value}) async {
    Navigator.pop(Keys.navigatorKey.currentContext!, value);
  }

  static Future? pushReplacement(Widget page) async {
    while (Navigator.canPop(Keys.navigatorKey.currentContext!)) {
      Navigation.pop();
    }
    return await Navigator.pushReplacement(
      Keys.navigatorKey.currentContext!,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static Future? pushAndRemoveUntil(Widget page) async {
    return await Navigator.pushAndRemoveUntil(
        Keys.navigatorKey.currentContext!,
        CupertinoPageRoute(builder: (BuildContext context) => page),
        (Route<dynamic> route) => false);
  }

  static goToHome() {
    while (Navigator.canPop(Keys.navigatorKey.currentContext!)) {
      Navigation.pop();
    }
    Navigation.pushAndRemoveUntil(HomeApp());
  }

  static goToLogin() {
    while (Navigator.canPop(Keys.navigatorKey.currentContext!)) {
      Navigation.pop();
    }
    Navigation.pushReplacement(WelcomePage());
  }

  static showBottomSheet({Widget? child}) async {
    return await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10,
        // enableDrag: true,
        isScrollControlled: true,
        context: Keys.navigatorKey.currentContext!,
        useRootNavigator: true,
        builder: (BuildContext bc) {
          return Container(
            height: 75.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5,
                ),
                Divider(
                  indent: 45.w,
                  endIndent: 45.w,
                  thickness: 3,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Container(
                    // height: 50.h,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 2.0.h, top: 2.0.h, right: 3.0.w, left: 3.0.w),
                      child: child ?? Container(),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

}
