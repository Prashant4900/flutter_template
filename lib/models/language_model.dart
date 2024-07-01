import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  const LanguageModel({required this.name, required this.code});

  final String name;
  final String code;

  @override
  List<Object?> get props => [
        name,
        code,
      ];

  @override
  bool? get stringify => true;
}
