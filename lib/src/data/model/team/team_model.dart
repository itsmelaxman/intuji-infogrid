import 'dart:convert';

List<TeamModel> teamModelFromJson(String str) =>
    List<TeamModel>.from(json.decode(str).map((x) => TeamModel.fromJson(x)));

String teamModelToJson(List<TeamModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamModel {
  final String name;
  final String role;
  final String email;
  final String avatar;

  TeamModel({
    required this.name,
    required this.role,
    required this.email,
    required this.avatar,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    name: json["name"] ?? "",
    role: json["role"] ?? "",
    email: json["email"] ?? "",
    avatar: json["avatar"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "role": role,
    "email": email,
    "avatar": avatar,
  };
}
