class UserModel {
  String user_name;
  String password;

  UserModel({
    required this.user_name,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user_name: json['user_name'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': user_name,
      'password': password,
    };
  }
}
