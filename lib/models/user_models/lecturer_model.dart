
import 'package:project_ym/models/user_models/student_model.dart';
import 'package:project_ym/models/user_models/user_model.dart';

import '../../constants/enums.dart';

class Lecturer extends User {
  final List<Student>? approvedStudents;

  Lecturer({
    required String id,
    required String email,
    required String password,
    required String name,
     String? description,
     String? image,
    required bool isVerified,
    required bool isAdmin,

     this.approvedStudents,
  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          description: description,
          image: image,
          accountType: AccountType.lecturer,
          isVerified: isVerified,
          isAdmin: isAdmin,
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

    };
  }
}
