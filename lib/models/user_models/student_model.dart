import 'package:project_ym/models/post_models/post_model.dart';
import 'package:project_ym/models/user_models/user_model.dart';

class Student extends User {
  final String? school;
  final String? city;
  final List<String>? technologies;
  final List<String>? languages;
  final Post? experience;

  Student({
    required int id,
    required String email,
    required String password,
    required String name,
    required String description,
    required String image,
    required int contactInfoID,
    this.school,
    this.city,
    this.technologies,
    this.languages,
    this.experience,
  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          description: description,
          image: image,
          contactInfoID: contactInfoID,
          accountType: AccountType.student,
        );

  Student.fromMap(Map<String, dynamic> map)
      : school = map['school'],
        city = map['city'],
        technologies = map['technologies'],
        languages = map['languages'],
        experience = Post.fromMap(map['experience']),
        super.fromMap(map);

  toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'description': description,
      'image': image,
      'school': school,
      'city': city,
      'technologies': technologies,
      'languages': languages,
      'experience': experience,
      'contactInfoID': contactInfoID,
    };
  }
}
