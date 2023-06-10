// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String name;
  String email;
  String uId;
  UserModel({
    required this.name,
    required this.email,
    required this.uId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'uId': uId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      uId: map['uId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? name,
    String? email,
    String? uId,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      uId: uId ?? this.uId,
    );
  }

  @override
  String toString() => 'UserModel(name: $name, email: $email, uId: $uId)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.uId == uId;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ uId.hashCode;

  static UserModel? fromFirebaseUser(User user) {

  }
}
