import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_ym/models/contact_models/contact_info_model.dart';
import 'package:project_ym/models/post_models/job_post_model.dart';
import 'package:project_ym/models/user_models/employer_model.dart';
import 'package:project_ym/models/user_models/lecturer_model.dart';
import '../models/post_models/post_model.dart';
import '../models/product_model.dart';
import '../models/user_models/student_model.dart';
import '../constants/endpoints.dart';

class DataService {
  static dynamic get(String path) async {
    final response = await http.get(Uri.parse('${Endpoints.baseUrl}/$path'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load data from $path error: ${response.statusCode}');
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

  Future<List<Product>> getProducts() async =>
      DataService.get(Endpoints.products)
          .map<Product>((e) => Product.fromMap(e))
          .toList();

  Future<List<Post>> getPosts() async => DataService.get(Endpoints.posts)
      .map<Post>((e) => Post.fromMap(e))
      .toList();

  Future<List<Student>> getStudents() async =>
      DataService.get(Endpoints.students)
          .map<Student>((e) => Student.fromMap(e))
          .toList();

  Future<List<Lecturer>> getLecturers() async =>
      DataService.get(Endpoints.lecturers)
          .map<Lecturer>((e) => Lecturer.fromMap(e))
          .toList();

  Future<List<Employer>> getEmployers() async =>
      DataService.get(Endpoints.employers)
          .map<Employer>((e) => Employer.fromMap(e))
          .toList();

  Future<List<JobPost>> getJobPosts() async =>
      DataService.get(Endpoints.jobposts)
          .map<JobPost>((e) => JobPost.fromMap(e))
          .toList();

  Future<List<ContactInfo>> getContactInfos() async =>
      DataService.get(Endpoints.contactinfos)
          .map<ContactInfo>((e) => ContactInfo.fromMap(e))
          .toList();

  Future<Product> getProduct(int id) async =>
      Product.fromMap(await DataService.get('${Endpoints.products}/$id'));

  Future<Post> getPost(int id) async =>
      Post.fromMap(await DataService.get('${Endpoints.posts}/$id'));

  Future<Student> getStudent(int id) async =>
      Student.fromMap(await DataService.get('${Endpoints.students}/$id'));

  Future<Lecturer> getLecturer(int id) async =>
      Lecturer.fromMap(await DataService.get('${Endpoints.lecturers}/$id'));

  Future<Employer> getEmployer(int id) async =>
      Employer.fromMap(await DataService.get('${Endpoints.employers}/$id'));

  Future<JobPost> getJobPost(int id) async =>
      JobPost.fromMap(await DataService.get('${Endpoints.jobposts}/$id'));

  Future<ContactInfo> getContactInfo(int id) async => ContactInfo.fromMap(
      await DataService.get('${Endpoints.contactinfos}/$id'));
}

final dataServiceProvider = Provider((ref) => DataService());
