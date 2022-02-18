class ClientProfileModel {
  bool? success;
  int? responseCode;
  String? message;
  Data? data;

  ClientProfileModel(
      {this.success, this.responseCode, this.message, this.data});

  ClientProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseCode = json['response_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? image;
  String? phone;
  int? type;
  int? status;
  int? rate;

  Data(
      {this.id,
        this.name,
        this.email,
        this.image,
        this.phone,
        this.type,
        this.status,
        this.rate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    type = json['type'];
    status = json['status'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['status'] = this.status;
    data['rate'] = this.rate;
    return data;
  }
}
