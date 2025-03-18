import 'dart:convert';

import 'package:ahiaa/features/personalization/domain/entities/address.dart';

import '../../../../utils/formatters/formatter.dart' show PFormatter;

class AddressModel extends Address {
  AddressModel({
    required super.id,
    required super.name,
    required super.phoneNumber,
    required super.street,
    required super.city,
    required super.state,
    required super.postalCode,
    required super.country,
    required super.profileId,
    super.dateTime,
    super.selectedAddress,
  });

  AddressModel copyWith({
    String? id,
    String? profileId,
    String? name,
    String? phoneNumber,
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    DateTime? dateTime,
    bool? selectedAddress,
  }) {
    return AddressModel(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      dateTime: dateTime ?? this.dateTime,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }

  String get formattedPhoneNo => PFormatter.formatPhoneNumber(phoneNumber);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'profile_id': profileId});

    result.addAll({'name': name});
    result.addAll({'phone_number': phoneNumber});
    result.addAll({'street': street});
    result.addAll({'city': city});
    result.addAll({'state': state});
    result.addAll({'postal_code': postalCode});
    result.addAll({'country': country});
    if (dateTime != null) {
      result.addAll({'date_time': dateTime!.toIso8601String()});
    }
    result.addAll({'selected_address': selectedAddress});

    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] ?? '',
      profileId: map['profile_id'] ?? '',

      name: map['name'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      street: map['street'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      postalCode: map['postal_code'] ?? '',
      country: map['country'] ?? '',
      dateTime:
          map['date_time'] != null ? DateTime.parse(map['date_ime']) : null,
      selectedAddress: map['selectedAddress'] ?? false,
    );
  }
  // EMPTY MODEL
  static AddressModel empty() => AddressModel(
    id: '',
    name: '',
    phoneNumber: '',
    street: '',
    city: '',
    state: '',
    postalCode: '',
    country: '',
    profileId: '',
  );
  // FETCH USERS USING SNAPSHOT
  // factory AddressModel.fromDocumentSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
  //   final map = documentSnapshot.data()!;
  //   return AddressModel(
  //     id: documentSnapshot.id,
  //     name: map['name'] ?? '',
  //     phoneNumber: map['phoneNumber'] ?? '',
  //     street: map['street'] ?? '',
  //     city: map['city'] ?? '',
  //     state: map['state'] ?? '',
  //     postalCode: map['postalCode'] ?? '',
  //     country: map['country'] ?? '',
  //     dateTime: map['dateTime'] != null
  //         ? (map['dateTime'] as Timestamp).toDate()
  //         : null,
  //     selectedAddress: map['selectedAddress'] ?? false,
  //   );
  // }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '$street, $city, $state $postalCode, $country';
  }
}
