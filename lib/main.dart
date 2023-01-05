import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/start_up.dart';
import 'core/constants/AppTheme.dart';
import 'core/constants/Keys.dart';
import 'core/constants/constants.dart';
import 'core/utils/shared_preferences/SharedPreferencesHelper.dart';
import 'features/splash/presentation/pages/splash_page.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await StartUp.setup();

  String lang = AppSharedPreferences.lang;
  Locale? startLocale = LANGUAGES[lang];

  runApp(
    Phoenix(
      child: EasyLocalization(
        startLocale: startLocale,
        supportedLocales: LANGUAGES.values.toList(),
        path: "assets/lang",
        child: Responsive(),
      ),
    ),
  );
}

class Responsive extends StatelessWidget {
  const Responsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(100, 100),
      builder: () => const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      navigatorKey: Keys.navigatorKey,
      debugShowCheckedModeBanner: kDebugMode,
      title: 'workiom',
      theme: AppTheme.theme,
      home: SplashPage(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
