import 'dart:convert';

class Coupon {
  final String code;

  Coupon({required this.code});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});

    return result;
  }

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(code: map['code'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Coupon.fromJson(String source) => Coupon.fromMap(json.decode(source));
}
