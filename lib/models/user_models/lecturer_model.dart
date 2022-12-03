import 'package:project_ym/models/contact_models/contact_info_model.dart';
import 'package:project_ym/models/user_models/student_model.dart';
import 'package:project_ym/models/user_models/user_model.dart';

import '../../constants/enums.dart';

class Lecturer extends User {
  final List<Student> approvedStudents;

  Lecturer({
    required int id,
    required String email,
    required String password,
    required String name,
    required String description,
    required String image,
    required ContactInfo contactInfo,
    required this.approvedStudents,
  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          description: description,
          image: image,
          contactInfo: contactInfo,
          accountType: AccountType.lecturer,
        );

  Lecturer.fromMap(Map<String, dynamic> map)
      : approvedStudents = map['approvedStudents'],
        super.fromMap(map);

  toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'description': description,
      'image': image,
      'contactInfoID': contactInfo,
    };
  }
}
