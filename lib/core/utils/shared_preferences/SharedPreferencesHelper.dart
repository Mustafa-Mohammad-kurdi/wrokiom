import 'dart:convert';

import '../../constants/constants.dart';
import 'SharedPreferencesProvider.dart';

class AppSharedPreferences {
  static const keyAccessToken = "PREF_KEY_ACCESS_TOKEN";
  static const keyName = "PREF_KEY_NAME ";
  static const keyLang = "PREF_KEY_LANG";
  static const keyFirstTime = "PREF_KEY_FIRST_TIME";
  static const keyEditionStandardId = "PREF_KEY_EDITION_ID";
  static const keyTenantId = "PREF_KEY_TENANT_ID";

  static bool? initialized;
  static SharedPreferencesProvider? _pref;
  static init() async {
    _pref = await SharedPreferencesProvider.getInstance();
  }

  static clear() {
    _pref!.clear();
  }

  static clearForLogOut() {
    removeAccessToken();
    removeAccessTenantId();
    removeAccessTenantId();
  }

  //AccessToken
  static String get accessToken => _pref!.read(keyAccessToken);
  static set accessToken(String accessToken) =>
      _pref!.save(keyAccessToken, accessToken);

  static bool get hasAccessToken => _pref?.contains(keyAccessToken) ?? false;
  static removeAccessToken() => _pref!.remove(keyAccessToken);

  //EditionStandardId
  static String get accessEditionStandardId => _pref!.read(keyEditionStandardId);
  static set accessEditionStandardId(String editionId) =>
      _pref!.save(keyEditionStandardId, editionId);

  static bool get hasAccessEditionStandardId => _pref?.contains(keyEditionStandardId) ?? false;
  static removeAccessEditionStandardId() => _pref!.remove(keyEditionStandardId);


  //TenantId
  static int get accessTenantId => _pref!.read(keyTenantId);
  static set accessTenantId(int tenantId) =>
      _pref!.save(keyTenantId, tenantId);

  static bool get hasAccessTenantId => _pref?.contains(keyTenantId) ?? false;
  static removeAccessTenantId() => _pref!.remove(keyTenantId);

  //Language
  static String get lang => _pref?.read(keyLang) ?? DEFAULT_LANGUAGE;
  static set lang(String lang) => _pref?.save(keyLang, lang);


  //FirstTime
  static bool get firstTime {
    if (_pref?.readBoolean(keyFirstTime) == null) {
      firstTime = false;
      return true;
    }
    return false;
  }

  static set firstTime(bool first) => _pref!.saveBoolean(keyFirstTime, first);
}
