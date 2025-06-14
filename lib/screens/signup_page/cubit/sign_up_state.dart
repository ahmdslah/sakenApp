part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

// ignore: must_be_immutable
final class SignUpFaild extends SignUpState {
  String errorrMessage;
  SignUpFaild({required this.errorrMessage});
}
