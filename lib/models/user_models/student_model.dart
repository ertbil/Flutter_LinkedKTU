import 'package:project_ym/models/post_models/post_model.dart';
import 'package:project_ym/models/user_models/user_model.dart';

import '../../constants/enums.dart';

import '../post_models/job_post_model.dart';
import 'lecturer_model.dart';

class Student extends User {
  final String? school;
  final String? city;
  final List<String>? technologies;
  final List<String>? languages;
  final List<Post>? experience;
  final List<JobPost>? appliedJobs; // başvurdugu işler
  final List<Lecturer>? lecturersThatApproved; // onaylandıgı hocalar


  Student({
    required String id,
    required String email,
    required String password,
    required String name,
    String? description,
    String? image,
    required bool isVerified,
    required bool isAdmin,

    this.school,
    this.city,
    this.technologies,
    this.languages,
    this.experience,
    this.appliedJobs = const [],
    this.lecturersThatApproved = const [],

  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          description: description,
          image: image,  // default image
          accountType: AccountType.student,
          isVerified: isVerified,
          isAdmin: isAdmin,
        );

  Student.fromMap(Map<String, dynamic> map)
      : school = map['School'],
        city = map['City'],
        languages = null,//map['languages'],
        technologies = null, //List<String>.from(map['technologies'])  ,
        experience = null,//map['experience'] ,
        appliedJobs = null, //map['appliedJobs'] ,
        lecturersThatApproved =null, // map['lecturersThatApproved'] ,
        super.fromMap(map);

  toMap() {
return {
      'ID': id,
      'Email': email,
      'Password': password,
      'Fullname': name,
      'Description': description,
      'Image': image,
      'AccountType': accountType2IntConverter(AccountType.student),
      'Phone': contactPhone,
      'Address': contactAdress,
      'isVerified': isVerified,
      'isAdmin': isAdmin,
      'School': school,
      'City': city,
      'languages': languages,
      'technologies': technologies,
      'experience': experience,
      'appliedJobs': appliedJobs,
      'lecturersThatApproved': lecturersThatApproved,
    };
  }




}
