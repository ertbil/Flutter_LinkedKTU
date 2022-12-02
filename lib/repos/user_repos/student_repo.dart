import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/models/user_models/student_model.dart';

import '../../services/data_transfer_service.dart';

class StudentRepo extends ChangeNotifier {
  List<Student> students = [];
  var student;
  final DataService converter;

  StudentRepo(this.converter);

  Future<List<Student>> getAll() async {
    students = await converter.getStudents();
    notifyListeners();
    return students;
  }

  Future<Student> getStudent(int id) async {
    student = await converter.getStudent(id);
    notifyListeners();
    return student;
  }
}

final studentProvider = ChangeNotifierProvider(
  (ref) {
    return StudentRepo(ref.watch(dataServiceProvider));
  },
);

final FutureProvider<List<Student>> studentListProvider =
    FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getStudents();
});




