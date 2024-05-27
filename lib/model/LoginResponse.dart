class LoginResponse {
  bool? success;
  String? message;
  Data? data;
  List<Errors>? errors;
  String? token;
  String? expiredAt;

  LoginResponse(
      {this.success,
        this.message,
        this.data,
        this.errors,
        this.token,
        this.expiredAt});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(new Errors.fromJson(v));
      });
    }
    token = json['token'];
    expiredAt = json['expiredAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    data['expiredAt'] = this.expiredAt;
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? userName;
  Nickname? nickname;
  String? phone;
  String? callingCode;
  bool? phoneVerifyed;
  bool? emailVerifyed;
  bool? isLogedin;
  bool? status;
  bool? isSocial;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
        this.name,
        this.email,
        this.userName,
        this.nickname,
        this.phone,
        this.callingCode,
        this.phoneVerifyed,
        this.emailVerifyed,
        this.isLogedin,
        this.status,
        this.isSocial,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    userName = json['userName'];
    nickname = json['nickname'] != null
        ? new Nickname.fromJson(json['nickname'])
        : null;
    phone = json['phone'];
    callingCode = json['callingCode'];
    phoneVerifyed = json['phoneVerifyed'];
    emailVerifyed = json['emailVerifyed'];
    isLogedin = json['isLogedin'];
    status = json['status'];
    isSocial = json['isSocial'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['userName'] = this.userName;
    if (this.nickname != null) {
      data['nickname'] = this.nickname!.toJson();
    }
    data['phone'] = this.phone;
    data['callingCode'] = this.callingCode;
    data['phoneVerifyed'] = this.phoneVerifyed;
    data['emailVerifyed'] = this.emailVerifyed;
    data['isLogedin'] = this.isLogedin;
    data['status'] = this.status;
    data['isSocial'] = this.isSocial;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Nickname {
  String? fName;
  String? lName;

  Nickname({this.fName, this.lName});

  Nickname.fromJson(Map<String, dynamic> json) {
    fName = json['fName'];
    lName = json['lName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    return data;
  }
}

class Errors {
  String? value;
  String? msg;
  String? param;
  String? location;

  Errors({this.value, this.msg, this.param, this.location});

  Errors.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['msg'] = this.msg;
    data['param'] = this.param;
    data['location'] = this.location;
    return data;
  }
}
