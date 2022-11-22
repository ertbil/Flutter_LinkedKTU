import 'package:project_ym/models/post_models/post_model.dart';

class JobPost extends Post {
  final bool isRemote;
  final String salary;

  JobPost({
    required int id,
    required String title,
    required String description,
    required String company,
    required String role,
    required List<String> technologies,
    required this.isRemote,
    required this.salary,
  }) : super(
          id: id,
          title: title,
          description: description,
          company: company,
          role: role,
          technologies: technologies,
        );

  JobPost.fromMap(Map<String, dynamic> map) :
    isRemote = map['isRemote'],
    salary = map['salary'],
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

