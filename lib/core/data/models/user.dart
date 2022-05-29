import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNo;
  final String? photoUrl;
  final String? address;
  final String? password;

  const Users({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phoneNo,
    this.photoUrl,
    this.password,
  });
  factory Users.fromMap(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      phoneNo: json['phone_no'],
      address: json['address'],
      photoUrl: json['photo_url'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{

      'id': id,
      'name': name,
      'phone_no': phoneNo,
      'address': address,
      'photo_url': photoUrl,
      'email': email,
      'password': password,
    };
    return map;
  }

  @override
  List<Object?> get props =>
      [name, phoneNo, email, photoUrl, address, password];
}
