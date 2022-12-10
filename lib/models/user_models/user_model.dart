
import '../../constants/enums.dart';
import '../contact_models/contact_info_model.dart';



class User {
  final int id;
  final String email;
  final String password;
  final String name;
  final String? description;
  final String? image;
  final ContactInfo? contactInfo;
  final AccountType? accountType;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.contactInfo,

    required this.accountType,
    this.description,
    this.image,
  });

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        email = map['email'],
        password = "123", //map['password'],
        name = map['name'],
        description = map['description'],
        image = map['image'],
        accountType = AccountType.student,//map['accountType'] ,
        contactInfo = ContactInfo.fromMap(map['ContactInfo']);
}
