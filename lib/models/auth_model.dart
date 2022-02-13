class AuthModel {
  bool? success;
  String? message;
  UserData? data;

  AuthModel.fromJson(
    Map<String, dynamic> json,
  ) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String?id;
  String?type;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserData.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    type=json['type'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
