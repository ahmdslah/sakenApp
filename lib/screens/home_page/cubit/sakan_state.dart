part of 'sakan_cubit.dart';

@immutable
sealed class SakanState {}

final class SakanInitial extends SakanState {}

final class SakanLoading extends SakanState {}

final class SakanSuccess extends SakanState {
  final List<SakanModel> sakan;

  SakanSuccess(this.sakan);
}

final class SakanErorr extends SakanState {
  final String erorr;

  SakanErorr(this.erorr);
}
