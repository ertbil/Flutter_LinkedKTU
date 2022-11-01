import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user_models/lecturer_model.dart';
import '../../services/data_transfer_service.dart';

class LecturerRepo extends ChangeNotifier {
  List<Lecturer> _lecturers = [];

  List<Lecturer> get lecturers => _lecturers;

  set lecturers(List<Lecturer> lecturers) {
    _lecturers = lecturers;
  }
  final DataService converter;

  LecturerRepo(this.converter);

  Future<List<Lecturer>> getAll() async {
    lecturers = await converter.getLecturers();
    notifyListeners();
    return lecturers;
  }
}

final productProvider = ChangeNotifierProvider(
  (ref) {
    return LecturerRepo(ref.watch(dataServiceProvider));
  },
);

final FutureProvider<List<Lecturer>> productListProvider =
    FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getLecturers();
});
