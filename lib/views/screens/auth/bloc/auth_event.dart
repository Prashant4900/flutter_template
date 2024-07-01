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

class GoogleLoginEvent extends AuthEvent {}

class AppleLoginEvent extends AuthEvent {}

class FacebookLoginEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  const RegisterEvent({required this.userModel});

  final UserModel userModel;

  @override
  List<Object> get props => [userModel];
}
