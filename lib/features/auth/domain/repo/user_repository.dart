import 'package:get_it/get_it.dart';
import 'package:workiom/core/api/core_models/empty_model.dart';
import 'package:workiom/features/app/presentation/pages/home_app.dart';
import 'package:workiom/features/auth/presentation/pages/login_with_email_page.dart';
import '../../../../core/api/core_models/base_result_model.dart';
import '../../../../core/api/data_source/remote_data_source.dart';
import '../../../../core/api/http/api_urls.dart';
import '../../../../core/api/http/http_method.dart';
import '../../../../core/utils/navigation/Navigation.dart';
import '../../../../core/utils/shared_preferences/SharedPreferencesHelper.dart';
import '../../data/response/authenticate_response_model.dart';
import '../../data/response/is_tenant_available_response_model.dart';
import '../../data/response/register_tenant_response_model.dart';

class UserRepository {

  static Future<BaseResultModel> isTenantAvailable(String tenantName) async {
    var res = await RemoteDataSource.request<IsTenantAvailableResponseModel>(
        converter: (json) => IsTenantAvailableResponseModel.fromJson(json),
        method: HttpMethod.post,
        withAuthentication: false,
        data: {
          "tenancyName":tenantName
        },
        url: ApiURLs.isTenantAvailable);
    return res;
  }

  static Future<BaseResultModel> registerTenant(data) async {
    var res = await RemoteDataSource.request<RegisterTenantResponseModel>(
        converter: (json) => RegisterTenantResponseModel.fromJson(json),
        method: HttpMethod.post,
        withAuthentication: false,
        data: data.toJson(),
        url: ApiURLs.registerTenant);
    await afterRegisterTenant(res);
    return res;
  }

  static afterRegisterTenant(BaseResultModel baseResultModel) async{
    if (baseResultModel is RegisterTenantResponseModel) {
      GetIt.I<RegisterTenantResponse>().registerTenantResponseModel = baseResultModel;
      AppSharedPreferences.accessTenantId = baseResultModel.tenantId!;
      Navigation.pushReplacement(LoginWithEmailPage());
    }
  }


  static Future<BaseResultModel> authenticate(data) async {
    var res = await RemoteDataSource.request<AuthenticateResponseModel>(
        converter: (json) => AuthenticateResponseModel.fromJson(json),
        method: HttpMethod.post,
        withAuthentication: false,
        data: data.toJson(),
        url: ApiURLs.authenticate);
    await afterLoin(res);
    return res;
  }


  static afterLoin(BaseResultModel baseResultModel){
    if(baseResultModel is AuthenticateResponseModel) {
      AppSharedPreferences.accessToken = baseResultModel.accessToken!;
      Navigation.pushReplacement(HomeApp());
    }
  }

  static Future<BaseResultModel> logOut() async {
    // TODO logout in server
    afterLogout();
    return EmptyModel();
  }

  static afterLogout() {
    // TODO update token in server
    // NotificationCubit().updateFCMToken(null);
    AppSharedPreferences.clearForLogOut();
    Navigation.goToLogin();
  }

  static Future<BaseResultModel> changeLanguage(String lang) async {
    // TODO change language in server
    return EmptyModel();
  }

  // static Future<BaseResultModel> googleSignIn() async {
  //   try {
  //     GoogleSignIn _googleSignIn = GoogleSignIn(
  //       // Optional clientId
  //       // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  //       scopes: <String>[
  //         'email',
  //         'https://www.googleapis.com/auth/contacts.readonly',
  //       ],
  //     );
  //
  //     await _googleSignIn.signOut();
  //     var user = await _googleSignIn.signIn();
  //     if (user == null) return CustomError(message: 'canceled');
  //     // print(await user!.authHeaders);
  //     GoogleSignInAuthentication auth = await user!.authentication;
  //     String? token = auth.accessToken;
  //
  //     var req = ExternalAuthenticateRequest(
  //         authProvider: 'Google',
  //         providerKey: user.id,
  //         providerAccessCode: auth.accessToken);
  //
  //     // Clipboard.setData(ClipboardData(text: req.toJson().toString()));
  //     // return CustomError(message: "ExternalAuthenticateRequest copied to clipboard");
  //
  //     var res = await externalAuthenticate(req);
  //     await afterLogin(res);
  //     return res;
  //   } catch (error) {
  //     return CustomError(message: error.toString());
  //   }
  // }


}
