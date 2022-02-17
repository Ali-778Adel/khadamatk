class LoginModel {
  int? user;
  int? type;
  int? status;
  String? token;

  LoginModel({this.user, this.type, this.status, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
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