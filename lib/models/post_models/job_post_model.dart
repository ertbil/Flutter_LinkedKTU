import 'package:project_ym/models/post_models/post_model.dart';

import '../user_models/student_model.dart';

class JobPost extends Post {
  final bool isRemote;
  final String salary;
  final bool isAccepted;
  final List<Student> applicants;

  JobPost({
    required int id,
    required String title,
    required String description,
    required String company,
    required String role,
    required List<String> technologies,
    required this.isRemote,
    required this.salary,
    required this.isAccepted,
    required this.applicants,

  }) : super(
          id: id,
          title: title,
          description: description,
          company: company,
          role: role,
          technologies: technologies,
        );

  JobPost.fromMap(Map<String, dynamic> map)
      : isRemote = map['isRemote'],
        salary = map['salary'],
        isAccepted = map['isAccepted'],
        applicants = map['applicants'],
        super.fromMap(map);

  toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'company': company,
      'role': role,
      'technologies': technologies,
      'isRemote': isRemote,
      'salary': salary,
    };
  }
  }

