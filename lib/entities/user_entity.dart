import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.otp,
  });

  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? otp;

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        email,
        password,
        otp,
      ];
}
