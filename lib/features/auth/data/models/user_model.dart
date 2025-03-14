import 'dart:convert';

import '../../../../core/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.phoneNumber,
      required super.profilePicture,
      required super.isShopOwner,
      required super.updatedAt});

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phoneNumber,
    String? profilePicture,
    // List? addresses,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      isShopOwner: isShopOwner, updatedAt: updatedAt ?? DateTime.now(),
      // addresses: addresses ?? this.addresses,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'isShopOwner': isShopOwner});
    result.addAll({'email': email});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'profilePicture': profilePicture});
    // result.addAll({'addresses': addresses});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      firstName: map['firstname'] ?? '',
      lastName: map['lastname'] ?? '',
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : DateTime.now(),
      email: map['email'] ?? '',
      phoneNumber: map['phone'] ?? '',
      profilePicture: map['avatarurl'] ?? '', isShopOwner: map['is_shop_owner'],
      // addresses: map['addresses'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
