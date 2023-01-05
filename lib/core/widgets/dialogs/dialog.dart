import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/AppColors.dart';
import '../../constants/AppTheme.dart';
import '../../constants/Keys.dart';
import '../../utils/Navigation/Navigation.dart';

class MyDialog{

  static showConfirmDialog({required String title , required VoidCallback onConfirm }){
    showDialog(
        context: Keys.navigatorKey.currentContext!,
        builder: (_) => AlertDialog(
          title: Text(
              title,
              style: AppTheme.headline2),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigation.pop();
                    onConfirm();
                //    deleteMyAccountCubit.createModel(null);
                  },
                  child: Text("Confirm".tr(),
                      style: AppTheme.headline6
                          .copyWith(color: AppColors.secondary)),
                ),
                InkWell(
                  onTap: () {
                    Navigation.pop();
                  },
                  child: Text("Cancel".tr(),
                      style: AppTheme.headline6.copyWith(color: AppColors.grey)),
                ),
              ]),
        ));

  }

}