import 'package:flutter_template/models/user_model.dart';

class AuthRepository {
  Future<void> login(String email, String password) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> register(UserModel userModel) async {
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
}
