import 'package:flutter_template/entities/user_entity.dart';

class AuthRepository {
  Future<void> login(String email, String password) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> register(UserEntity userModel) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> googleSignIn() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> appleSignIn() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> facebookSignIn() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception(e);
    }
  }
}
