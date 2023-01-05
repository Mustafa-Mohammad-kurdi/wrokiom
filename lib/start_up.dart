import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:workiom/features/auth/domain/cubit/password_cubit.dart';
import 'core/constants/AppColors.dart';
import 'core/notification/notification.dart';
import 'core/utils/service_locator/ServiceLocator.dart';
import 'core/utils/shared_preferences/SharedPreferencesHelper.dart';
import 'features/splash/domain/repo/splash_repository.dart';

class StartUp {
  static Future<void> setup() async {
    await SplashRepository.getPackage();
    ServiceLocator.registerModels();
    await AppSharedPreferences.init();
    await Messaging.initFCM();
    PasswordCubit passwordCubit = PasswordCubit();
    GetIt.I<CubitsStore>().passwordCubit = passwordCubit;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }
}
