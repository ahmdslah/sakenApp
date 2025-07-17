part of 'profile_edit_cubit.dart';

@immutable
sealed class ProfileEditState {}

final class ProfileEditInitial extends ProfileEditState {}

final class ProfileChangeValue extends ProfileEditState {}

final class ProfileChangeEye extends ProfileEditState {}
