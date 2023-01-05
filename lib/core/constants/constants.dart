import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/shared_preferences/SharedPreferencesHelper.dart';


String APP_NAME = 'app_name'.tr();

// Languages
String DEFAULT_LANGUAGE =
    (Platform.localeName.substring(0, 2) == "ar" ? "ar" : 'en');
const Map<String, Locale> LANGUAGES = {
  'ar': Locale('ar'),
  'en': Locale('en'),
};
bool isEnglish() => AppSharedPreferences.lang == "en" ? true : false;
// Headers
const HEADER_LANGUAGE = 'Accept-Language';
const HEADER_AUTH = 'authorization';
const HEADER_CONTENT_TYPE = 'Content-Type';
const HEADER_ACCEPT = 'accept';

FocusNode focusNode = FocusNode();

// String share({required ProfileResponseModel profileResponseModel}) {
//   return "تطبيق Merge: " +
//       "\n" +
//       "تطبيق موجّه للصم بهدف دمجهم مع باقي فئات المجتمع." +
//       "\n" +
//       "يمكن تحميله من الرابط:" +
//       "\n" +
//       "https://play.google.com/store/apps/details?id=itland.merge" +
//       "\n" +
//       "ويمكنك إضافة ${profileResponseModel.fullName} إلى جهات اتصالك عن طريق الرقم التعريفي: " +
//       "\n" +
//       profileResponseModel.userIdentifier.toString();
// }
