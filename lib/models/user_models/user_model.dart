import '../../constants/enums.dart';

class User {
  final int id;
  final String email ;
  final String password;
  final String name;
  final String? description;
  final String? image;
  final AccountType? accountType;
  final String? contactPhone;
  final String? contactAdress;
  final bool isVerified;
  final bool isAdmin;

  User({
    required this.isVerified,
    required this.isAdmin,
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.accountType,
    this.description,
    this.image,
    this.contactPhone,
    this.contactAdress,
  });

  User.fromMap(Map<String, dynamic> map)
      : id = map['ID']??-1,
        email = map['Email']??"loremipsum@gmail.com",
        password = map['Password']??"123456",
        name = map['Fullname']??"John Doe",
        description = map['Description'],
        image = map['Image'],
        accountType = AccountType.student,
        //map['accountType'] ,
        contactPhone = map['Phone'],
        contactAdress = map['Address'],
        isVerified = false, // map['isVerified'],
        isAdmin = false; //map['isAdmin'];

}
