part of 'reset_cubit.dart';

@immutable
sealed class ResetState {}

final class ResetInitial extends ResetState {}

final class ResetEmailError extends ResetState {}

final class ForgetLoading extends ResetState {}

final class ForgetSuccess extends ResetState {
  final String message;

  ForgetSuccess({required this.message});
}

final class ForgetFailed extends ResetState {
  final String message;

  ForgetFailed({required this.message});
}

final class ResetLoading extends ResetState {}

final class ResetSuccess extends ResetState {
  final String message;

  ResetSuccess({required this.message});
}

final class ResetFailed extends ResetState {
  final String message;

  ResetFailed({required this.message});
}
