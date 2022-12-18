import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_ym/models/post_models/job_post_model.dart';
import 'package:project_ym/models/user_models/employer_model.dart';
import 'package:project_ym/models/user_models/lecturer_model.dart';
import '../constants/endpoints.dart';
import '../models/auth_models/login_model.dart';
import '../models/post_models/post_model.dart';
import '../models/user_models/student_model.dart';

class DataService {
  static dynamic get(String path) async {
    final response = await http.get(Uri.parse('${Endpoints.baseUrl}/$path'));

    if (jsonDecode(response.body)['success']) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  static dynamic post(String path, dynamic data) async {
    final response = await http.post(
      Uri.parse('${Endpoints.baseUrl}/$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    try {
      if (jsonDecode(response.body)['success']) {
        debugPrint(jsonDecode(response.body)['data'].toString());
        return jsonDecode(response.body)['data'];
      } else {
        throw Exception(jsonDecode(response.body)['error']);
      }
    }
    catch (e) {
      throw Exception('Something went wrong status: ${response.statusCode}');
    }
  }

  static dynamic put(String path, dynamic data) async {
    final response =
    await http.put(Uri.parse('${Endpoints.baseUrl}/$path'), body: data);

    if (jsonDecode(response.body)['success']) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  static dynamic delete(String path) async {
    final response = await http.delete(Uri.parse('${Endpoints.baseUrl}/$path'));

    if (jsonDecode(response.body)['success']) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Future<List<E>> getEntities<E>(String path) async =>
  //     DataService.get(path).map<E>((e) => E.fromMap(e)).toList();

  //https://stackoverflow.com/a/55237197/17817088  burada cevap olabilir

  /// This methods are used to get all the entities from the database.

  Future<List<Post>> getPosts() async {
    var decodedData = await DataService.get(Endpoints.posts);

    return decodedData.map<Post>((element) => Post.fromMap(element)).toList();
  }

  Future<List<Student>> getStudents() async {
    var decodedData = await DataService.get(Endpoints.students);

    return decodedData.map<Student>((element) {
      return Student.fromMap(element);
    }).toList();
  }

  Future<List<Lecturer>> getLecturers() async {
    var decodedData = await DataService.get(Endpoints.lecturer);

    return decodedData
        .map<Lecturer>((element) => Lecturer.fromMap(element))
        .toList();
  }

  Future<List<JobPost>> getJobPosts() async {
    var decodedData = await DataService.get(Endpoints.jobposts);

    return decodedData
        .map<JobPost>((element) => JobPost.fromMap(element))
        .toList();
  }

  Future<List<Employer>> getEmployers() async {
    var decodedData = await DataService.get(Endpoints.employers);

    return decodedData
        .map<Employer>((element) => Employer.fromMap(element))
        .toList();
  }

  /// This Methods are used to only one entity from the database.

  Future<Post> getPost(String id) async {
    final decodedData = await DataService.get('${Endpoints.posts}/$id');
    return Post.fromMap(decodedData);
  }

  Future<Student> getStudent(String id) async {
    final decodedData = await DataService.get('${Endpoints.students}/$id');
    return Student.fromMap(decodedData[0]);
  }

  Future<Lecturer> getLecturer(String id) async {
    final decodedData = await DataService.get('${Endpoints.lecturer}/$id');
    return Lecturer.fromMap(decodedData[0]);
  }

  Future<JobPost> getJobPost(String id) async {
    final decodedData = await DataService.get('${Endpoints.jobposts}/$id');
    return JobPost.fromMap(decodedData[0]);
  }

  Future<Employer> getEmployer(String id) async {
    final decodedData = await DataService.get('${Endpoints.employers}/$id');
    return Employer.fromMap(decodedData[0]);
  }

  /// This methods get list by things.

  Future<List<Student>> getStudentByTechs(String tech) async {
    var decodedData = await DataService.get(
        '${Endpoints.students}/${Endpoints.technology}/$tech');

    return decodedData.map<Student>((element) {
      return Student.fromMap(element);
    }).toList();
  }

  /// This methods are used to add new entities to the database.

  static Future addUser(path, data) async {
    return await DataService.post(
        '$path/${Endpoints.auth}/${Endpoints.register}', data);
  }

  Future addEmployer(Employer employer) {
    return DataService.addUser(Endpoints.employers, employer.toMap());
  }

  Future addLecturer(Lecturer lecturer) {
    return DataService.addUser(Endpoints.lecturer, lecturer.toMap());
  }

  Future addStudent(Student student) {
    return DataService.addUser(Endpoints.students, student.toMap());
  }

  static Future login(String path, data) async {
    return await DataService.post(
        '$path/${Endpoints.auth}/${Endpoints.login}', data);
  }

  Future studentLogin(Login loginData) async {
    return login(Endpoints.students, loginData.toMap());
  }

  Future employerLogin(Login loginData) async {
    return login(Endpoints.employers, loginData.toMap());
  }

  Future lecturerLogin(Login loginData) async {
    return login(Endpoints.lecturer, loginData.toMap());
  }


}

final dataServiceProvider = Provider((ref) => DataService());
