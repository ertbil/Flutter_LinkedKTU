import 'package:project_ym/models/user_models/user_model.dart';

import '../../constants/enums.dart';
import '../post_models/job_post_model.dart';

class Employer extends User {
  final String? city;
  final bool? isInternshipRemote;
  final bool? isWorkRemote;
  final List<String>? technologies;
  final List<String>? languages;
  final List<JobPost>? jobPosts;

  Employer({
    required String id,
    required String email,
    required String password,
    required String name,
     String? description,
     String? image,
    required bool isVerified,
    required bool isAdmin,
    this.city,
    this.isInternshipRemote,
    this.isWorkRemote,
    this.technologies,
    this.languages,
    this.jobPosts,
  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          description: description,
          accountType: AccountType.employer,
          isVerified: isVerified,
          isAdmin: isAdmin,
        );

  Employer.fromMap(Map<String, dynamic> map)
      : city = map['city'],
        isInternshipRemote = map['isInternshipRemote'],
        isWorkRemote = map['isWorkRemote'],
        technologies = null, // map['technologies'],
        languages = null,//map['languages'],
        jobPosts =  null, //map['jobPosts'],
        super.fromMap(map);

  toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'fullname': name,
      'description': description,
      'image': image,
      'city': city,
      'isInternshipRemote': isInternshipRemote,
      'isWorkRemote': isWorkRemote,
      'technologies': technologies,
      'languages': languages,
      'jobPosts': jobPosts,
    };
  }
}
