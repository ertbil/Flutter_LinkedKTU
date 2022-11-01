import 'package:project_ym/models/contact_models/contact_info_model.dart';
import 'package:project_ym/models/user_models/user_model.dart';
import '../post_models/job_post_model.dart';

class Employer extends User {
  final String city;
  final bool isInternshipRemote;
  final bool isWorkRemote;
  final List<String> technologies;
  final List<String> languages;
  final ContactInfo contactInfo;
  final List<JobPost> jobPosts;

  Employer({
    required int id,
    required email,
    required password,
    required String name,
    required String description,
    required String image,
    required String accountType,
    required this.city,
    required this.isInternshipRemote,
    required this.isWorkRemote,
    required this.technologies,
    required this.languages,
    required this.contactInfo,
    required this.jobPosts,
  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          description: description,
          image: image,
          accountType: accountType,
        );

  Employer.fromMap(Map<String, dynamic> map)
      : city = map['city'],
        isInternshipRemote = map['isInternshipRemote'],
        isWorkRemote = map['isWorkRemote'],
        technologies = map['technologies'],
        languages = map['languages'],
        contactInfo = ContactInfo.fromMap(map['contactInfo']),
        jobPosts = map['jobPosts'],
        super.fromMap(map);
}
