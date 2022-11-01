import 'package:project_ym/models/contact_models/contact_info_model.dart';
import 'package:project_ym/models/post_models/post_model.dart';
import 'package:project_ym/models/user_models/user_model.dart';

class Student extends User {
  final String school;
  final String city;
  final List<String> technologies;
  final List<String> languages;
  final ContactInfo contactInfo;
  final Post experience;

  Student({
    required int id,
    required String email,
    required String password,
    required String name,
    required String description,
    required String image,
    required String accountType,
    required this.school,
    required this.city,
    required this.technologies,
    required this.languages,
    required this.contactInfo,
    required this.experience,
  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          description: description,
          image: image,
          accountType: accountType,
        );

  Student.fromMap(Map<String, dynamic> map)
      : school = map['school'],
        city = map['city'],
        technologies = map['technologies'],
        languages = map['languages'],
        contactInfo = ContactInfo.fromMap(map['contactInfo']),
        experience = Post.fromMap(map['experience']),
        super.fromMap(map);
}
