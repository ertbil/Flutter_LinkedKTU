import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/models/user_models/student_model.dart';
import '../../services/data_transfer_service.dart';

class StudentRepo extends ChangeNotifier {
  List<Student> students = [];
  final DataService converter;

  StudentRepo(this.converter);

  Future<List<Student>> getAll() async {
    students = await converter.getStudents();
    notifyListeners();
    return students;
  }
}

final productProvider = ChangeNotifierProvider(
  (ref) {
    return StudentRepo(ref.watch(dataServiceProvider));
  },
);

final FutureProvider<List<Student>> productListProvider =
    FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getStudents();
});
