import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
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
    var decodedData = await DataService.get(Endpoints.posts);
    decodedData = decodedData['data'];
    return decodedData.map<Post>((element) => Post.fromMap(element)).toList();
  }

  Future<List<Student>> getStudents() async {
    var decodedData = await DataService.get(Endpoints.students);
    decodedData = decodedData['data'];
    return decodedData.map<Student>((element) {
      return Student.fromMap(element);
    }).toList();
  }

  Future<List<Lecturer>> getLecturers() async {
    var decodedData = await DataService.get(Endpoints.lecturer);
    decodedData = decodedData['data'];
    return decodedData
        .map<Lecturer>((element) => Lecturer.fromMap(element))
        .toList();
  }

  Future<List<JobPost>> getJobPosts() async {
    var decodedData = await DataService.get(Endpoints.jobposts);
    decodedData = decodedData['data'];
    return decodedData
        .map<JobPost>((element) => JobPost.fromMap(element))
        .toList();
  }

  Future<List<Employer>> getEmployers() async {
    var decodedData = await DataService.get(Endpoints.employers);
    decodedData = decodedData['data'];
    return decodedData
        .map<Employer>((element) => Employer.fromMap(element))
        .toList();
  }

  /// This Methods are used to only one entity from the database.

  Future<Post> getPost(int id) async {
    final decodedData = await DataService.get('${Endpoints.posts}/$id');
    return Post.fromMap(decodedData);
  }

  Future<Student> getStudent(int id) async {
    final decodedData = await DataService.get('${Endpoints.students}/$id');
    return Student.fromMap(decodedData['data']);
  }

  Future<Lecturer> getLecturer(int id) async {
    final decodedData = await DataService.get('${Endpoints.lecturer}/$id');
    return Lecturer.fromMap(decodedData);
  }

  Future<JobPost> getJobPost(int id) async {
    final decodedData = await DataService.get('${Endpoints.jobposts}/$id');
    return JobPost.fromMap(decodedData);
  }

  Future<Employer> getEmployer(int id) async {
    final decodedData = await DataService.get('${Endpoints.employers}/$id');
    return Employer.fromMap(decodedData);
  }

  Future<List<Student>> getStudentByTechs(String tech) async {
    var decodedData = await DataService.get('${Endpoints.students}/${Endpoints.skills}/$tech');
    decodedData = decodedData['data'];
    return decodedData.map<Student>((element) {
      return Student.fromMap(element);
    }).toList();
  }
}

final dataServiceProvider = Provider((ref) => DataService());
