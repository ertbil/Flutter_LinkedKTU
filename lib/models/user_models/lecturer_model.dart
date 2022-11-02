import 'package:project_ym/models/contact_models/contact_info_model.dart';
import 'package:project_ym/models/user_models/user_model.dart';


class Lecturer extends User {
  final ContactInfo contactInfo;

  Lecturer({
    required int id,
    required String email,
    required String password,
    required String name,
    required String description,
    required String image,
    required String accountType,
    required this.contactInfo,
  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          description: description,
          image: image,
          accountType: accountType,
        );

  Lecturer.fromMap(Map<String, dynamic> map)
      : contactInfo = ContactInfo.fromMap(map['contactInfo']),
        super.fromMap(map);
}
