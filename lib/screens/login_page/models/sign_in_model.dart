class SignInModel {
  String? email;
  String? password;
  String? role;

  SignInModel({this.email, this.password, this.role});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        email: json['email'] as String?,
        password: json['password'] as String?,
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'role': role,
      };
}
