import 'package:project_ym/models/contact_models/contact_info_model.dart';
import 'package:project_ym/models/user_models/user_model.dart';
import 'package:project_ym/repos/contact_info_repos/contact_info_repo.dart';
import 'package:project_ym/services/data_transfer_service.dart';
import '../post_models/job_post_model.dart';

class Employer extends User {
  final String? city;
  final bool? isInternshipRemote;
  final bool? isWorkRemote;
  final List<String>? technologies;
  final List<String>? languages;
  final List<JobPost>? jobPosts;

  Employer({
    required int id,
    required String email,
    required String password,
    required String name,
    required String description,
    required String image,
    required int contactInfoID,
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
          image: image,
          contactInfoID: contactInfoID,
          accountType: AccountType.employer,
        );

  Employer.fromMap(Map<String, dynamic> map)
      : city = map['city'],
        isInternshipRemote = map['isInternshipRemote'],
        isWorkRemote = map['isWorkRemote'],
        technologies = map['technologies'],
        languages = map['languages'],
        jobPosts = map['jobPosts'],
        super.fromMap(map);

  toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'description': description,
      'image': image,
      'city': city,
      'isInternshipRemote': isInternshipRemote,
      'isWorkRemote': isWorkRemote,
      'technologies': technologies,
      'languages': languages,
      'jobPosts': jobPosts,
      'contactInfoID': contactInfoID,
    };
  }
}
