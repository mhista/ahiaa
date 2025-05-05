class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String profilePicture;
  final bool isShopOwner;
  final bool isSuperAdmin;
  final DateTime? updatedAt;

  // List addresses;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.isShopOwner,
    required this.updatedAt,
    required this.isSuperAdmin,
  });
}
