import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:workiom/core/utils/Navigation/Navigation.dart';
import 'package:workiom/core/utils/shared_preferences/SharedPreferencesHelper.dart';
import 'package:workiom/features/app/presentation/pages/home_app.dart';
import 'package:workiom/features/auth/presentation/pages/login_with_email_page.dart';
import 'package:workiom/features/auth/presentation/pages/welcome_page.dart';

import '../../../../core/api/core_models/base_result_model.dart';
import '../../../../core/api/data_source/remote_data_source.dart';
import '../../../../core/api/errors/connection_error.dart';
import '../../../../core/api/http/api_urls.dart';
import '../../../../core/api/http/http_method.dart';
import '../../../auth/data/response/get_current_login_information_response_model.dart';
import '../../../auth/data/response/get_editions_for_select_response_model.dart';
import '../../../auth/data/response/get_password_complexity_setting_response_model.dart';

class SplashRepository {
  static String? version;
  static late PackageInfo packageInfo;

  static getPackage() async {
    packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
  }

  static Future<BaseResultModel> getSplash() async {
    var resultCurrentInformation = await getCurrentInformation();
    var resultPasswordComplexitySetting = await getPasswordComplexitySetting();
    var resultEditionsForSelectResponseModel = await getEditionsForSelectResponseModel();
    if (resultPasswordComplexitySetting
            is GetPasswordComplexitySettingResponseModel && resultCurrentInformation is GetCurrentLoginInformationResponse &&
        resultEditionsForSelectResponseModel is GetEditionsForSelectResponseModel) {
      await afterGetCurrentInformation(resultCurrentInformation);
      await afterGetPasswordSetting(resultPasswordComplexitySetting);
      await afterGetEditions(resultEditionsForSelectResponseModel);
      return resultCurrentInformation;
    }else{
      return ConnectionError();
    }
  }

  static Future<BaseResultModel> getCurrentInformation() async {
    var res =
        await RemoteDataSource.request<GetCurrentLoginInformationResponse>(
            converter: (json) =>
                GetCurrentLoginInformationResponse.fromJson(json),
            method: HttpMethod.get,
            withAuthentication: true,
            retries: 3,
            url: ApiURLs.getCurrentLoginInformation);
      return res;
  }

  static Future<BaseResultModel> getPasswordComplexitySetting() async {
    var res = await RemoteDataSource.request<
            GetPasswordComplexitySettingResponseModel>(
        converter: (json) =>
            GetPasswordComplexitySettingResponseModel.fromJson(json),
        method: HttpMethod.get,
        withAuthentication: false,
        retries: 3,
        url: ApiURLs.getPasswordComplexitySetting);
    return res;
  }

  static Future<BaseResultModel> getEditionsForSelectResponseModel() async {
    var res = await RemoteDataSource.request<GetEditionsForSelectResponseModel>(
        converter: (json) => GetEditionsForSelectResponseModel.fromJson(json),
        method: HttpMethod.get,
        withAuthentication: false,
        retries: 3,
        url: ApiURLs.getEditionsForSelect);
    return res;
  }

  static afterGetCurrentInformation(BaseResultModel baseResultModel) {
    if (baseResultModel is GetCurrentLoginInformationResponse) {
      //TODO Confirm and discuss the recording scenario
      if(AppSharedPreferences.hasAccessToken){
        Navigation.pushReplacement(HomeApp());
      }else{
        if(AppSharedPreferences.hasAccessTenantId)
          Navigation.pushReplacement(LoginWithEmailPage());
        else
        Navigation.pushReplacement(WelcomePage());
      }
      }
      // TODO check Tenant later and select one
    }

  static afterGetPasswordSetting(BaseResultModel baseResultModel) {
    if (baseResultModel is GetPasswordComplexitySettingResponseModel)
      GetIt.I<GetPasswordComplexitySettingResponseModel>().setting = baseResultModel.setting;
  }

  static afterGetEditions(BaseResultModel baseResultModel) {
    if (baseResultModel is GetEditionsForSelectResponseModel)
      AppSharedPreferences.accessEditionStandardId = (baseResultModel.editionsWithFeatures?.first.edition?.id ?? 0).toString();
  }
}
