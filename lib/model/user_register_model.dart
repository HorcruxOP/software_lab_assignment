class UserRegisterModel {
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? role;
  String? businessName;
  String? informalName;
  String? address;
  String? city;
  String? state;
  int? zipCode;
  String? registrationProof;
  BusinessHours? businessHours;
  String? deviceToken;
  String? type;
  String? socialId;

  UserRegisterModel({
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.role,
    this.businessName,
    this.informalName,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.registrationProof,
    this.businessHours,
    this.deviceToken,
    this.type,
    this.socialId,
  });

  UserRegisterModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    role = json['role'];
    businessName = json['business_name'];
    informalName = json['informal_name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    registrationProof = json['registration_proof'];
    businessHours = json['business_hours'] != null
        ? BusinessHours.fromJson(json['business_hours'])
        : null;
    deviceToken = json['device_token'];
    type = json['type'];
    socialId = json['social_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['role'] = role;
    data['business_name'] = businessName;
    data['informal_name'] = informalName;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['registration_proof'] = registrationProof;
    if (businessHours != null) {
      data['business_hours'] = businessHours!.toJson();
    }
    data['device_token'] = deviceToken;
    data['type'] = type;
    data['social_id'] = socialId;
    return data;
  }
}

class BusinessHours {
  List<String>? mon;
  List<String>? tue;
  List<String>? wed;
  List<String>? thu;
  List<String>? fri;
  List<String>? sat;
  List<String>? sun;

  BusinessHours(
      {this.mon, this.tue, this.wed, this.thu, this.fri, this.sat, this.sun});

  BusinessHours.fromJson(Map<String, dynamic> json) {
    mon = json['mon'].cast<String>();
    tue = json['tue'].cast<String>();
    wed = json['wed'].cast<String>();
    thu = json['thu'].cast<String>();
    fri = json['fri'].cast<String>();
    sat = json['sat'].cast<String>();
    sun = json['sun'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['mon'] = mon;
    data['tue'] = tue;
    data['wed'] = wed;
    data['thu'] = thu;
    data['fri'] = fri;
    data['sat'] = sat;
    data['sun'] = sun;
    return data;
  }
}
