part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends AuthEvent {}

class GoogleLoginEvent extends AuthEvent {}

class AppleLoginEvent extends AuthEvent {}

class FacebookLoginEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  const RegisterEvent({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<Object> get props => [userEntity];
}

class RequestOtpEvent extends AuthEvent {
  const RequestOtpEvent({required this.phone});
  final String phone;

  @override
  List<Object> get props => [phone];
}

class SubmitOtpEvent extends AuthEvent {
  const SubmitOtpEvent({required this.otp, required this.phone});
  final String otp;
  final String phone;

  @override
  List<Object> get props => [phone, otp];
}
