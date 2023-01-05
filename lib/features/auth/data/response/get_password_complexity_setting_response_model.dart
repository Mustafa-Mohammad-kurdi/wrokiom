import 'package:workiom/core/api/core_models/base_result_model.dart';

class GetPasswordComplexitySettingResponseModel extends BaseResultModel{
  PasswordComplexitySetting? setting;

  GetPasswordComplexitySettingResponseModel({this.setting});

  GetPasswordComplexitySettingResponseModel.fromJson(
      Map<String, dynamic> json) {
    setting =
    json['setting'] != null ? new PasswordComplexitySetting.fromJson(json['setting']) : null;
  }
}

class PasswordComplexitySetting {
  bool? requireDigit;
  bool? requireLowercase;
  bool? requireNonAlphanumeric;
  bool? requireUppercase;
  int? requiredLength;

  PasswordComplexitySetting(
      {this.requireDigit,
        this.requireLowercase,
        this.requireNonAlphanumeric,
        this.requireUppercase,
        this.requiredLength});

  PasswordComplexitySetting.fromJson(Map<String, dynamic> json) {
    requireDigit = json['requireDigit'];
    requireLowercase = json['requireLowercase'];
    requireNonAlphanumeric = json['requireNonAlphanumeric'];
    requireUppercase = json['requireUppercase'];
    requiredLength = json['requiredLength'];
  }
}
