import 'package:workiom/core/api/core_models/base_result_model.dart';

class AuthenticateResponseModel extends BaseResultModel{
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  bool? shouldResetPassword;
  int? userId;
  bool? requiresTwoFactorVerification;
  String? returnUrl;
  String? refreshToken;
  int? refreshTokenExpireInSeconds;

  AuthenticateResponseModel(
      {this.accessToken,
        this.encryptedAccessToken,
        this.expireInSeconds,
        this.shouldResetPassword,
        this.userId,
        this.requiresTwoFactorVerification,
        this.returnUrl,
        this.refreshToken,
        this.refreshTokenExpireInSeconds});

  AuthenticateResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    encryptedAccessToken = json['encryptedAccessToken'];
    expireInSeconds = json['expireInSeconds'];
    shouldResetPassword = json['shouldResetPassword'];
    userId = json['userId'];
    requiresTwoFactorVerification = json['requiresTwoFactorVerification'];
    returnUrl = json['returnUrl'];
    refreshToken = json['refreshToken'];
    refreshTokenExpireInSeconds = json['refreshTokenExpireInSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['encryptedAccessToken'] = this.encryptedAccessToken;
    data['expireInSeconds'] = this.expireInSeconds;
    data['shouldResetPassword'] = this.shouldResetPassword;
    data['userId'] = this.userId;
    data['requiresTwoFactorVerification'] = this.requiresTwoFactorVerification;
    data['returnUrl'] = this.returnUrl;
    data['refreshToken'] = this.refreshToken;
    data['refreshTokenExpireInSeconds'] = this.refreshTokenExpireInSeconds;
    return data;
  }
}
