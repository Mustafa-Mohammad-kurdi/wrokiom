import '../../../app_settings.dart';

class ApiURLs {
  ///BASE_URL
  static String baseUrl = AppSettings.BASE_URL;

  ///User
  static String getCurrentLoginInformation = baseUrl + '/api/services/app/Session/GetCurrentLoginInformations';
  static String getEditionsForSelect = baseUrl + '/api/services/app/TenantRegistration/GetEditionsForSelect';
  static String getPasswordComplexitySetting = baseUrl + '/api/services/app/Profile/GetPasswordComplexitySetting';
  static String isTenantAvailable = baseUrl + '/api/services/app/Account/IsTenantAvailable';
  static String registerTenant = baseUrl + '/api/services/app/TenantRegistration/RegisterTenant';
  static String authenticate = baseUrl + '/api/TokenAuth/Authenticate';


  ///Home
  static String home = baseUrl + '/home';
}
