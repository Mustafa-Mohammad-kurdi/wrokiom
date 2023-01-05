import 'package:workiom/core/api/core_models/base_result_model.dart';

class GetCurrentLoginInformationResponse extends BaseResultModel{
  String? user;
  String? tenant;

  GetCurrentLoginInformationResponse({this.user, this.tenant});

  GetCurrentLoginInformationResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    tenant = json['tenant'];
  }
}