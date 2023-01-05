import 'package:workiom/core/api/core_models/base_result_model.dart';


class RegisterTenantResponse{
  RegisterTenantResponseModel? registerTenantResponseModel;
  RegisterTenantResponse();
}
class RegisterTenantResponseModel extends BaseResultModel{
  int? tenantId;
  String? tenancyName;
  String? name;
  String? userName;
  String? emailAddress;
  bool? isTenantActive;
  bool? isActive;
  bool? isEmailConfirmationRequired;

  RegisterTenantResponseModel(
      {this.tenantId,
        this.tenancyName,
        this.name,
        this.userName,
        this.emailAddress,
        this.isTenantActive,
        this.isActive,
        this.isEmailConfirmationRequired});

  RegisterTenantResponseModel.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'];
    tenancyName = json['tenancyName'];
    name = json['name'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    isTenantActive = json['isTenantActive'];
    isActive = json['isActive'];
    isEmailConfirmationRequired = json['isEmailConfirmationRequired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['tenancyName'] = this.tenancyName;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['emailAddress'] = this.emailAddress;
    data['isTenantActive'] = this.isTenantActive;
    data['isActive'] = this.isActive;
    data['isEmailConfirmationRequired'] = this.isEmailConfirmationRequired;
    return data;
  }
}
