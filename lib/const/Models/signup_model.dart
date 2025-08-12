import 'package:saken_mobile/core/api/api_keys.dart';

class SignupModel {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String address;
  final String role;
  final String photo;

  SignupModel(
      {required this.fullName,
      required this.email,
      required this.phone,
      required this.password,
      required this.confirmPassword,
      required this.address,
      required this.role,
      required this.photo});

  factory SignupModel.fromJson(Map<String, dynamic> data) {
    return SignupModel(
        fullName: data[ApiKeys.fullName],
        email: data[ApiKeys.email],
        phone: data[ApiKeys.phoneNumber],
        password: data[ApiKeys.password],
        confirmPassword: data[ApiKeys.confirmPassword],
        address: data[ApiKeys.address],
        role: data[ApiKeys.role],
        photo: data[ApiKeys.photo]);
  }
}
