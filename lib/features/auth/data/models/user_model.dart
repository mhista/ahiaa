import 'dart:convert';

import '../../../../core/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.profilePicture,
    required super.isShopOwner,
    required super.updatedAt,
    required super.isSuperAdmin,
  });

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
      isShopOwner: isShopOwner,
      isSuperAdmin: isSuperAdmin,

      updatedAt: updatedAt ?? DateTime.now(),
      // addresses: addresses ?? this.addresses,
    );
  }

  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
    isShopOwner: false,
    updatedAt: DateTime.now(),
    isSuperAdmin: false,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'firstname': firstName});
    result.addAll({'lastname': lastName});
    result.addAll({'is_shop_owner': isShopOwner});
    result.addAll({'is_super_admin': isSuperAdmin});

    result.addAll({'email': email});
    result.addAll({'phone': phoneNumber});
    result.addAll({'avatarurl': profilePicture});
    result.addAll({'updated_at': updatedAt?.toIso8601String()});
    // result.addAll({'addresses': addresses});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      firstName: map['firstname'] ?? '',
      lastName: map['lastname'] ?? '',
      updatedAt:
          map['updated_at'] != null
              ? DateTime.parse(map['updated_at'])
              : DateTime.now(),
      email: map['new_email'] ?? '',
      phoneNumber: map['phone'] ?? '',
      profilePicture: map['avatarurl'] ?? '',
      isShopOwner: map['is_shop_owner'] ?? false,
      isSuperAdmin: map['is_super_admin'] ?? false,

      // addresses: map['addresses'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
