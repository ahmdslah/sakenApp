part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

// ignore: must_be_immutable
final class LoginFaild extends LoginState {
  String errMessage;
  LoginFaild({required this.errMessage});
}
