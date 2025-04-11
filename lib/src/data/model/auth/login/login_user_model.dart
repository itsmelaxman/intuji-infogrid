import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  final String userId;
  final String name;
  final String email;
  final String profileImage;
  final String token;

  LoginUserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.token,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
    userId: json["userId"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    profileImage: json["profileImage"] ?? "",
    token: json["token"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "email": email,
    "profileImage": profileImage,
    "token": token,
  };
}
