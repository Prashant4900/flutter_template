import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        password,
      ];
}
