import 'package:workiom/core/api/core_models/base_result_model.dart';

class GetEditionsForSelectResponseModel extends BaseResultModel{
  List<AllFeatures>? allFeatures;
  List<EditionsWithFeatures>? editionsWithFeatures;

  GetEditionsForSelectResponseModel({this.allFeatures, this.editionsWithFeatures});

  GetEditionsForSelectResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['allFeatures'] != null) {
      allFeatures = <AllFeatures>[];
      json['allFeatures'].forEach((v) { allFeatures!.add(new AllFeatures.fromJson(v)); });
    }
    if (json['editionsWithFeatures'] != null) {
      editionsWithFeatures = <EditionsWithFeatures>[];
      json['editionsWithFeatures'].forEach((v) { editionsWithFeatures!.add(new EditionsWithFeatures.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allFeatures != null) {
      data['allFeatures'] = this.allFeatures!.map((v) => v.toJson()).toList();
    }
    if (this.editionsWithFeatures != null) {
      data['editionsWithFeatures'] = this.editionsWithFeatures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllFeatures {
  String? name;
  String? parentName;
  String? displayName;
  String? description;
  String? defaultValue;
  Metadata? metadata;
  InputType? inputType;

  AllFeatures({this.name, this.parentName, this.displayName, this.description, this.defaultValue, this.metadata, this.inputType});

  AllFeatures.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    parentName = json['parentName'];
    displayName = json['displayName'];
    description = json['description'];
    defaultValue = json['defaultValue'];
    metadata = json['metadata'] != null ? new Metadata.fromJson(json['metadata']) : null;
    inputType = json['inputType'] != null ? new InputType.fromJson(json['inputType']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['parentName'] = this.parentName;
    data['displayName'] = this.displayName;
    data['description'] = this.description;
    data['defaultValue'] = this.defaultValue;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.inputType != null) {
      data['inputType'] = this.inputType!.toJson();
    }
    return data;
  }
}

class Metadata {
  int? dataType;
  bool? isVisibleOnPricingTable;
  bool? isVisibleOnTenantSubscription;

  Metadata({this.dataType, this.isVisibleOnPricingTable, this.isVisibleOnTenantSubscription});

  Metadata.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    isVisibleOnPricingTable = json['isVisibleOnPricingTable'];
    isVisibleOnTenantSubscription = json['isVisibleOnTenantSubscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataType'] = this.dataType;
    data['isVisibleOnPricingTable'] = this.isVisibleOnPricingTable;
    data['isVisibleOnTenantSubscription'] = this.isVisibleOnTenantSubscription;
    return data;
  }
}

class InputType {
  String? name;
  Attributes? attributes;
  Validator? validator;
  String? itemSource;

  InputType({this.name, this.attributes, this.validator, this.itemSource});

  InputType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    attributes = json['attributes'] != null ? new Attributes.fromJson(json['attributes']) : null;
    validator = json['validator'] != null ? new Validator.fromJson(json['validator']) : null;
    itemSource = json['itemSource'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    if (this.validator != null) {
      data['validator'] = this.validator!.toJson();
    }
    data['itemSource'] = this.itemSource;
    return data;
  }
}

class Validator {
  int? minValue;
  int? maxValue;
  String? name;
  Attributes? attributes;

  Validator({this.minValue, this.maxValue, this.name, this.attributes});

  Validator.fromJson(Map<String, dynamic> json) {
    minValue = json['minValue'];
    maxValue = json['maxValue'];
    name = json['name'];
    attributes = json['attributes'] != null ? new Attributes.fromJson(json['attributes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minValue'] = this.minValue;
    data['maxValue'] = this.maxValue;
    data['name'] = this.name;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  int? minValue;
  int? maxValue;

  Attributes({this.minValue, this.maxValue});

  Attributes.fromJson(Map<String, dynamic> json) {
    minValue = json['MinValue'];
    maxValue = json['MaxValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MinValue'] = this.minValue;
    data['MaxValue'] = this.maxValue;
    return data;
  }
}

class EditionsWithFeatures {
  Edition? edition;
  List<FeatureValues>? featureValues;

  EditionsWithFeatures({this.edition, this.featureValues});

  EditionsWithFeatures.fromJson(Map<String, dynamic> json) {
    edition = json['edition'] != null ? new Edition.fromJson(json['edition']) : null;
    if (json['featureValues'] != null) {
      featureValues = <FeatureValues>[];
      json['featureValues'].forEach((v) { featureValues!.add(new FeatureValues.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.edition != null) {
      data['edition'] = this.edition!.toJson();
    }
    if (this.featureValues != null) {
      data['featureValues'] = this.featureValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edition {
  String? name;
  String? displayName;
  String? publicDescription;
  String? internalDescription;
  bool? isPublished;
  bool? isRegistrable;
  int? type;
  int? minimumUsersCount;
  double? monthlyPrice;
  double? annualPrice;
  String? waitingDayAfterExpire;
  int? trialDayCount;
  int? countAllowExtendTrial;
  bool? hasTrial;
  bool? disableWorkspaceAfterExpire;
  bool? isMostPopular;
  String? doNotSendVerifyEmail;
  ExpiringEdition? expiringEdition;
  int? id;

  Edition({this.name, this.displayName, this.publicDescription, this.internalDescription, this.isPublished, this.isRegistrable, this.type, this.minimumUsersCount, this.monthlyPrice, this.annualPrice, this.waitingDayAfterExpire, this.trialDayCount, this.countAllowExtendTrial, this.hasTrial, this.disableWorkspaceAfterExpire, this.isMostPopular, this.doNotSendVerifyEmail, this.expiringEdition, this.id});

  Edition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    publicDescription = json['publicDescription'];
    internalDescription = json['internalDescription'];
    isPublished = json['isPublished'];
    isRegistrable = json['isRegistrable'];
    type = json['type'];
    minimumUsersCount = json['minimumUsersCount'];
    monthlyPrice = json['monthlyPrice'];
    annualPrice = json['annualPrice'];
    waitingDayAfterExpire = json['waitingDayAfterExpire'];
    trialDayCount = json['trialDayCount'];
    countAllowExtendTrial = json['countAllowExtendTrial'];
    hasTrial = json['hasTrial'];
    disableWorkspaceAfterExpire = json['disableWorkspaceAfterExpire'];
    isMostPopular = json['isMostPopular'];
    doNotSendVerifyEmail = json['doNotSendVerifyEmail'];
    expiringEdition = json['expiringEdition'] != null ? new ExpiringEdition.fromJson(json['expiringEdition']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['displayName'] = this.displayName;
    data['publicDescription'] = this.publicDescription;
    data['internalDescription'] = this.internalDescription;
    data['isPublished'] = this.isPublished;
    data['isRegistrable'] = this.isRegistrable;
    data['type'] = this.type;
    data['minimumUsersCount'] = this.minimumUsersCount;
    data['monthlyPrice'] = this.monthlyPrice;
    data['annualPrice'] = this.annualPrice;
    data['waitingDayAfterExpire'] = this.waitingDayAfterExpire;
    data['trialDayCount'] = this.trialDayCount;
    data['countAllowExtendTrial'] = this.countAllowExtendTrial;
    data['hasTrial'] = this.hasTrial;
    data['disableWorkspaceAfterExpire'] = this.disableWorkspaceAfterExpire;
    data['isMostPopular'] = this.isMostPopular;
    data['doNotSendVerifyEmail'] = this.doNotSendVerifyEmail;
    if (this.expiringEdition != null) {
      data['expiringEdition'] = this.expiringEdition!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class ExpiringEdition {
  String? name;
  String? displayName;
  int? id;

  ExpiringEdition({this.name, this.displayName, this.id});

  ExpiringEdition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['displayName'] = this.displayName;
    data['id'] = this.id;
    return data;
  }
}

class FeatureValues {
  String? name;
  String? value;

  FeatureValues({this.name, this.value});

  FeatureValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
