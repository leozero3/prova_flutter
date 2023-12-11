import 'dart:convert';

class UserModel {
  String user_name;
  String password;

  UserModel({
    required this.user_name,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_name': user_name,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user_name: map['user_name'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
