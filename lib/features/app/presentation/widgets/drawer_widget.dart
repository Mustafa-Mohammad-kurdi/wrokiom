import 'package:easy_localization/easy_localization.dart' as t;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/core_models/empty_model.dart';
import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/AppColors.dart';
import '../../../../core/constants/AppTheme.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/widgets/image_widgets/custom_image.dart';
import '../../../App/presentation/pages/settings_page.dart';
import '../../../auth/domain/repo/user_repository.dart';

CreateModelCubit? logoutCubit;

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDrawer(context);
  }

  _buildDrawer(BuildContext context) {
    return  Container(
      color: AppColors.white,
        width: 70.w,
        height: 100.h,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Gaps.vGap8,
            profileSection(),
            Gaps.vGap2,
            drawerItem(
              AppAssets.settings,
              'Settings'.tr(),
              onTap: () {
                Navigation.push(SettingsPage());
              },
            ),
            CreateModel<EmptyModel>(
              repositoryCallBack: (data) => UserRepository.logOut(),
              onSuccess: (_) {},
              onCubitCreated: (c) {
                logoutCubit = c;
              },
              child: drawerItem(
                AppAssets.logout,
                'Logout'.tr(),
                onTap: () async {
                  logoutCubit!.createModel(null);
                },
              ),
            ),
          ],
        ),
      );
  }

  profileSection() {
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomImage.circular(
              image: AppAssets.user,
              isNetworkImage: false,
              svg: true,
              radius: 11.sp,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "anonymous".tr(),
                overflow: TextOverflow.fade,
                style: AppTheme.headline2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(String icon, String title,
      {String? badgeCount, GestureTapCallback? onTap}) {
    return Container(
        child: ListTile(
          onTap: onTap,
          isThreeLine: false,
          leading: CustomImage.rectangle(
              image: icon,
              isNetworkImage: false,
              svg: true,
              color: AppColors.primary),
          title: Text(
            title,
          ),
          trailing: badgeCount != null
              ? Material(
            color: AppColors.secondary,
            elevation: 5.0,
            shadowColor: AppColors.secondary[100],
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.secondary[600],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                badgeCount,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
              : null,
        ));
  }
}

