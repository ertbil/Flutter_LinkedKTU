
import 'package:project_ym/models/user_models/user_model.dart';



class Lecturer extends User {



  Lecturer({
    required int id,
    required String email,
    required String password,
    required String name,
    required String description,
    required String image,
    required int contactInfoID,
  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          description: description,
          image: image,
          contactInfoID: contactInfoID,
          accountType: AccountType.lecturer,

        );

  Lecturer.fromMap(Map<String, dynamic> map)
      :
        super.fromMap(map);

  toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'description': description,
      'image': image,
      'contactInfoID': contactInfoID,
    };
  }
}
