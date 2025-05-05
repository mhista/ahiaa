// import 'dart:convert';

// import '../../../../utils/formatters/formatter.dart';
// import '../../../../core/entities/user.dart';

// class UserModel extends User {
//   UserModel(
//       {required super.id,
//       required super.firstName,
//       required super.lastName,
//       required super.email,
//       required super.phoneNumber,
//       required super.profilePicture,
//       required super.isShopOwner,
//       required super.updatedAt, required super.isSuperAdmin});

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'id': id});
//     result.addAll({'firstName': firstName});
//     result.addAll({'lastName': lastName});
//     result.addAll({'isShopOwner': isShopOwner});
//     result.addAll({'isSuperAdmin': isSuperAdmin});

//     result.addAll({'email': email});
//     result.addAll({'phoneNumber': phoneNumber});
//     result.addAll({'profilePicture': profilePicture});
//     // result.addAll({'addresses': addresses});

//     return result;
//   }

//   String toJson() => json.encode(toMap());

//   static User empty() => User(
//         id: '',
//         firstName: '',
//         lastName: '',
//         email: '',
//         phoneNumber: '',
//         profilePicture: '', isShopOwner: false, updatedAt: DateTime.now(),
//         // addresses: [],
//       );

//   /// HELPER FUNCTIONS

//   ///  gets the fullname
//   String get fullName => '$firstName $lastName';

//   // function to format the phone number
//   String get formattedPhoneNumber => PFormatter.formatPhoneNumber(phoneNumber);

//   // splitting fullname into firstname and lastname
//   static List<String> splitFullName(fullName) => fullName.split(' ');

//   // generating a username from the fullname
//   static String generateUsername(fullName) {
//     List<String> splitName = fullName.split(' ');
//     String firstName = splitName[0].toLowerCase();
//     String lastName = splitName.length > 1 ? splitName[1].toLowerCase() : '';

//     String camelCaseUsername = '$firstName$lastName';
//     String usernameWithPrefix = 'pik_$camelCaseUsername';
//     return usernameWithPrefix;
//   }

//   //

//   @override
//   String toString() {
//     return 'User(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, profilePicture: $profilePicture, isShopOwner: $isShopOwner, updatedAt: $updatedAt)';
//   }
// }
