import 'dart:convert';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String image;
  String id;
  String name;
  String? email;

  UserModel({
    required this.image,
    required this.id,
    required this.name,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    image: json['image'],
    email: json['email'],
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "email": email,
  };

  UserModel copyWith({
    String? name,image,
  }) {
    return UserModel(
      image: image??this.image,
      id: id,
      email: email,
      name:name??this.name,
    );
  }
}