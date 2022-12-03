import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_ym/models/contact_models/contact_info_model.dart';
import 'package:project_ym/models/post_models/job_post_model.dart';
import 'package:project_ym/models/user_models/employer_model.dart';
import 'package:project_ym/models/user_models/lecturer_model.dart';

import '../constants/endpoints.dart';
import '../models/post_models/post_model.dart';

import '../models/user_models/student_model.dart';

class DataService {
  static dynamic get(String path) async {
    final response = await http.get(Uri.parse('${Endpoints.baseUrl}/$path'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load data from $path error: ${response.statusCode} } ');
    }
  }

  static dynamic post(String path, dynamic data) async {
    final response =
        await http.post(Uri.parse('${Endpoints.baseUrl}/$path'), body: data);
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load data from $path error: ${response.statusCode}');
    }
  }

  static dynamic put(String path, dynamic data) async {
    final response =
        await http.put(Uri.parse('${Endpoints.baseUrl}/$path'), body: data);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load data from $path error: ${response.statusCode}');
    }
  }

  static dynamic delete(String path) async {
    final response = await http.delete(Uri.parse('${Endpoints.baseUrl}/$path'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load data from $path error: ${response.statusCode}');
    }
  }

  // Future<List<E>> getEntities<E>(String path) async =>
  //     DataService.get(path).map<E>((e) => E.fromMap(e)).toList();

  //https://stackoverflow.com/a/55237197/17817088  burada cevap olabilir

  /// This methods are used to get all the entities from the database.



  Future<List<Post>> getPosts() async {
    final l = await DataService.get(Endpoints.posts);
    return l.map<Post>((e) => Post.fromMap(e)).toList();
  }

  Future<List<Student>> getStudents() async {
    final l = await DataService.get(Endpoints.students);
    return l.map<Student>((e) => Student.fromMap(e)).toList();
  }

  Future<List<Lecturer>> getLecturers() async {
    final l = await DataService.get(Endpoints.lecturer);
    return l.map<Lecturer>((e) => Lecturer.fromMap(e)).toList();
  }

  Future<List<JobPost>> getJobPosts() async {
    final l = await DataService.get(Endpoints.jobposts);
    return l.map<JobPost>((e) => JobPost.fromMap(e)).toList();
  }

  Future<List<Employer>> getEmployers() async {
    final l = await DataService.get(Endpoints.employers);
    return l.map<Employer>((e) => Employer.fromMap(e)).toList();
  }

  Future<List<ContactInfo>> getContactInfos() async {
    final l = await DataService.get(Endpoints.contactinfos);
    return l.map<ContactInfo>((e) => ContactInfo.fromMap(e)).toList();
  }

  /// This Methods are used to only one entity from the database.



  Future<Post> getPost(int id) async {
    final l = await DataService.get('${Endpoints.posts}/$id');
    return Post.fromMap(l);
  }

  Future<Student> getStudent(int id) async {
    final l = await DataService.get('${Endpoints.students}/$id');
    return Student.fromMap(l);
  }

  Future<Lecturer> getLecturer(int id) async {
    final l = await DataService.get('${Endpoints.lecturer}/$id');
    return Lecturer.fromMap(l);
  }

  Future<JobPost> getJobPost(int id) async {
    final l = await DataService.get('${Endpoints.jobposts}/$id');
    return JobPost.fromMap(l);
  }

  Future<Employer> getEmployer(int id) async {
    final l = await DataService.get('${Endpoints.employers}/$id');
    return Employer.fromMap(l);
  }

  Future<ContactInfo> getContactInfo(int id) async {
    final l = await DataService.get('${Endpoints.contactinfos}/$id');
    return ContactInfo.fromMap(l);
  }

  /// This methods are used to add new entities to the database.



  Future<Post> addPost(Post post) async {
    final l = await DataService.post(Endpoints.posts, post.toMap());
    return Post.fromMap(l);
  }

  Future<Student> addStudent(Student student) async {
    final l = await DataService.post(Endpoints.students, student.toMap());
    return Student.fromMap(l);
  }

  Future<Lecturer> addLecturer(Lecturer lecturer) async {
    final l = await DataService.post(Endpoints.lecturer, lecturer.toMap());
    return Lecturer.fromMap(l);
  }

  Future<JobPost> addJobPost(JobPost jobPost) async {
    final l = await DataService.post(Endpoints.jobposts, jobPost.toMap());
    return JobPost.fromMap(l);
  }

  Future<Employer> addEmployer(Employer employer) async {
    final l = await DataService.post(Endpoints.employers, employer.toMap());
    return Employer.fromMap(l);
  }

  Future<ContactInfo> addContactInfo(ContactInfo contactInfo) async {
    final l =
        await DataService.post(Endpoints.contactinfos, contactInfo.toMap());
    return ContactInfo.fromMap(l);
  }
}

final dataServiceProvider = Provider((ref) => DataService());
