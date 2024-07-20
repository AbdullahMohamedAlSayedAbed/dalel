part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class SignUpLoading extends AuthState {}
final class SignUpSuccess extends AuthState {}
final class SignUpFailure extends AuthState {
  final String errMessage;

  SignUpFailure(this.errMessage);
}

final class SignInLoading extends AuthState {}
final class SignInSuccess extends AuthState {}
final class SignInFailure extends AuthState {
    final String errMessage;

  SignInFailure(this.errMessage);
}
final class ResetPasswordLoading extends AuthState {}
final class ResetPasswordSuccess extends AuthState {}
final class ResetPasswordFailure extends AuthState {
    final String errMessage;

  ResetPasswordFailure(this.errMessage);

}
final class UpdateTermsAndConditionBox extends AuthState {}
final class ChangePasswordVisibility extends AuthState {}
