class CategoriesModel {
  bool? success;
  int? responseCode;
  String? message;
  List<DataCat>? data;

  CategoriesModel({this.success, this.responseCode, this.message, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseCode = json['response_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataCat>[];
      json['data'].forEach((v) {
        data!.add(new DataCat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataCat {
  int? id;
  String? name;
  String? image;
  String? nameAr;

  DataCat({this.id, this.name, this.image, this.nameAr});

  DataCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['name_ar'] = this.nameAr;
    return data;
  }
}
