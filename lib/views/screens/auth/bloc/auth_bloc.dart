import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/entities/user_entity.dart';
import 'package:flutter_template/repositories/auth_repository.dart';
import 'package:flutter_template/setup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<GoogleLoginEvent>(_googleLogin);
    on<AppleLoginEvent>(_appleLogin);
    on<FacebookLoginEvent>(_facebookLogin);
    on<LoginEvent>(_loginLogin);
    on<RegisterEvent>(_registerLogin);
    on<RegisterEvent>(_registerLogin);
    on<SignOutEvent>(_signOut);
  }

  final authRepo = getIt<AuthRepository>();

  FutureOr<void> _loginLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepo.login(event.email, event.password);
      emit(const AuthSuccess(isLoggedIn: true));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  FutureOr<void> _registerLogin(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepo.register(event.userEntity);
      emit(const AuthSuccess(isLoggedIn: true));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  FutureOr<void> _facebookLogin(
    FacebookLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepo.facebookSignIn();
      emit(const AuthSuccess(isLoggedIn: true));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  FutureOr<void> _googleLogin(
    GoogleLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepo.googleSignIn();
      emit(const AuthSuccess(isLoggedIn: true));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  FutureOr<void> _appleLogin(
    AppleLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepo.appleSignIn();
      emit(const AuthSuccess(isLoggedIn: true));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepo.signOut();
      emit(const AuthSuccess());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
