// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UsersModel extends Equatable {
  // final int id;
  final String? email;
  final String? password;
  final String? password2;
  final String? username;
  final String? firstName;
  final String? lastName;

  const UsersModel({
    // required this.id,
    this.email,
    this.password,
    this.password2,
    this.username,
    this.firstName,
    this.lastName,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        // id: json['id'] as int,
        email: json['email'] as String?,
        password: json['password'] as String?,
        password2: json['password2'] as String?,
        username: json['username'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'email': email,
        'password': password,
        'password2': password2,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
      };
  // static UsersModel fromJsonDecode(Map<String, dynamic> map) {
  //   final user = map['results'];
  //   return mapToUsersModelModel(user);
  // }

  UsersModel copyWith({
    int? id,
    String? email,
    String? password,
    String? password2,
    String? username,
    String? firstName,
    String? lastName,
  }) {
    return UsersModel(
      // id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      password2: password2 ?? this.password2,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  List<Object?> get props {
    return [
      // id,
      email,
      password,
      password2,
      username,
      firstName,
      lastName,
    ];
  }
}
