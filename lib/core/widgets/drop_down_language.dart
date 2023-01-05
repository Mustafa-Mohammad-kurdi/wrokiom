import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/auth/domain/repo/user_repository.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../api/core_models/empty_model.dart';
import '../boilerplate/create_model/cubits/create_model_cubit.dart';
import '../boilerplate/create_model/widgets/create_model.dart';
import '../constants/AppColors.dart';
import '../constants/AppTheme.dart';
import '../constants/constants.dart';
import '../utils/Navigation/Navigation.dart';
import '../utils/shared_preferences/SharedPreferencesHelper.dart';

class DropDownLanguage extends StatefulWidget {
  const DropDownLanguage({Key? key}) : super(key: key);

  @override
  State<DropDownLanguage> createState() => _dropDownLanguageState();
}

class _dropDownLanguageState extends State<DropDownLanguage> {

  String? local;

  @override
  void initState() {
    setState(() {
      local = AppSharedPreferences.lang;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CreateModel<EmptyModel>(
        loadingHeight: 10.h,
        onCubitCreated: (cubit) => loginCubit = cubit,
        repositoryCallBack: (data) => UserRepository.changeLanguage(data),
        onSuccess: (EmptyModel responseModel) {
          context.setLocale(LANGUAGES[local]!);
          AppSharedPreferences.lang = local!;
          Navigation.pushAndRemoveUntil(SplashPage());
        },
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: LANGUAGES.keys.toList().map(
                  (String value) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: InkWell(
                          child: Text(value.tr(),
                              style: AppTheme.headline6.copyWith(
                                  color: local != value
                                      ? AppColors.grey
                                      : AppColors.secondary)),
                          onTap: () => local != value
                              ? {
                            setState(() {
                              local = value;
                              loginCubit.createModel(local);
                            }),
                          }
                              : null,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList()));
  }
  late CreateModelCubit loginCubit;
}
