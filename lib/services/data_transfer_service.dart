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

  Future<List<Product>> getProducts() async {
    final l = await DataService.get(Endpoints.products);
    return l.map<Product>((e) => Product.fromMap(e)).toList();
  }



  Future<List<Post>> getPosts() async {
    final l = await DataService.get(Endpoints.posts);
    return l.map<Post>((e) => Post.fromMap(e)).toList();
  }

  Future<List<Student>> getStudents() async {
    final l = await DataService.get(Endpoints.students);
    return l.map<Student>((e) => Student.fromMap(e))
          .toList();
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



 Future<List<Product>> getProduct (int id) async {
    final l = await DataService.get('${Endpoints.products}/$id');
    return l.map<Product>((e) => Product.fromMap(e)).toList();
  }

  Future<List<Post>> getPost (int id) async {
    final l = await DataService.get('${Endpoints.posts}/$id');
    return l.map<Post>((e) => Post.fromMap(e)).toList();
  }

  Future<List<Student>> getStudent (int id) async {
    final l = await DataService.get('${Endpoints.students}/$id');
    return l
          .map<Student>((e) => Student.fromMap(e))
          .toList();
  }



  // Future<Product> createProduct(Product product) async {
  //   final l = await DataService.post('products', product.toMap());
  //   return Product.fromMap(l);
  // }
  //
  // Future<Post> createPost(Post post) async {
  //   final l = await DataService.post('posts', post.toMap());
  //   return Post.fromMap(l);
  // }
  //
  // Future<Student> createStudent(Student student) async {
  //   final l = await DataService.post('students', student.toMap());
  //   return Student.fromMap(l);
  // }
  //
  // Future<Lecturer> createLecturer(Lecturer lecturer) async {
  //   final l = await DataService.post('lecturers', lecturer.toMap());
}

final dataServiceProvider = Provider((ref) => DataService());
