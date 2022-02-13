class LoginModel {
  bool? success;
  Data? data;
  String? message;
  Data? validator;

  LoginModel({this.success, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  Data.fromJson(json['data']) :  json['message'];
    message = json['message'];
    validator = json['validator'] != null ? new Data.fromJson(json['validator']) : json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    if (this.validator != null) {
      data['validator'] = this.validator!.toJson();
    }
    return data;
  }
}

class Data {
  int? user;
  int? type;
  int? status;
  String? token;

  Data({this.user, this.type, this.status, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    type = json['type'];
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['type'] = this.type;
    data['status'] = this.status;
    data['token'] = this.token;
    return data;
  }
}