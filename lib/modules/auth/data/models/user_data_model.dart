class UserDataModel {
  bool? status;
  String? message;
  UserData? data;

  UserDataModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      data = UserData.fromJson(json["data"]);
    }
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? password;
  String? token;

  UserData({
    required this.email,
    required this.phone,
    required this.name,
    required this.password,
});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
    token = json["token"];
  }

  static Map<String, dynamic> toJson(UserData data) {
    return {
      "id": data.id,
      "name": data.name,
      "email": data.email,
      "phone": data.phone,
      "password": data.password,
      "image": data.image,
    };
  }
}
