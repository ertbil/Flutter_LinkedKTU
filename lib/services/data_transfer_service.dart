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

class DataService {
  final String baseUrl = 'https://635f8c7fca0fe3c21a9e7fa5.mockapi.io';

  Future<List<Product>> getProducts() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      final l = jsonDecode(response.body);
      return l.map<Product>((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception(
          'Product download ended with failure ${response.statusCode}');
    }
  }

  Future<List<Lecturer>> getLecturers() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      final l = jsonDecode(response.body);
      return l.map<Lecturer>((e) => Lecturer.fromMap(e)).toList();
    } else {
      throw Exception(
          'Lecturer download ended with failure ${response.statusCode}');
    }
  }

  Future<List<Student>> getStudents() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      final l = jsonDecode(response.body);
      return l.map<Student>((e) => Student.fromMap(e)).toList();
    } else {
      throw Exception(
          'Student download ended with failure ${response.statusCode}');
    }
  }

  Future<List<Employer>> getEmployers() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      final l = jsonDecode(response.body);
      return l.map<Employer>((e) => Employer.fromMap(e)).toList();
    } else {
      throw Exception(
          'Employer download ended with failure ${response.statusCode}');
    }
  }

  Future<List<Post>> getPosts() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      final l = jsonDecode(response.body);
      return l.map<Post>((e) => Post.fromMap(e)).toList();
    } else {
      throw Exception(
          'Post download ended with failure ${response.statusCode}');
    }
  }

  Future<List<JobPost>> getJobPosts() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      final l = jsonDecode(response.body);
      return l.map<JobPost>((e) => JobPost.fromMap(e)).toList();
    } else {
      throw Exception(
          'JobPost download ended with failure ${response.statusCode}');
    }
  }

  Future<List<ContactInfo>> getContactInfos() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      final l = jsonDecode(response.body);
      return l.map<ContactInfo>((e) => ContactInfo.fromMap(e)).toList();
    } else {
      throw Exception(
          'ContactInfo download ended with failure ${response.statusCode}');
    }
  }
}

final dataServiceProvider = Provider((ref) => DataService());
