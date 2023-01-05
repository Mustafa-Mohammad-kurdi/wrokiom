// class

class AuthenticateRequestModel {
  String? ianaTimeZone;
  String? password;
  bool? rememberClient;
  String? returnUrl;
  bool? singleSignIn;
  String? tenantName;
  String? userNameOrEmailAddress;

  AuthenticateRequestModel(
      {this.ianaTimeZone,
        this.password,
        this.rememberClient,
        this.returnUrl,
        this.singleSignIn,
        this.tenantName,
        this.userNameOrEmailAddress});

  AuthenticateRequestModel.fromJson(Map<String, dynamic> json) {
    ianaTimeZone = json['ianaTimeZone'];
    password = json['password'];
    rememberClient = json['rememberClient'];
    returnUrl = json['returnUrl'];
    singleSignIn = json['singleSignIn'];
    tenantName = json['tenantName'];
    userNameOrEmailAddress = json['userNameOrEmailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ianaTimeZone'] = this.ianaTimeZone;
    data['password'] = this.password;
    data['rememberClient'] = this.rememberClient;
    data['returnUrl'] = this.returnUrl;
    data['singleSignIn'] = this.singleSignIn;
    data['tenantName'] = this.tenantName;
    data['userNameOrEmailAddress'] = this.userNameOrEmailAddress;
    return data;
  }
}
