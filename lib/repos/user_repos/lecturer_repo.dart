import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user_models/lecturer_model.dart';
import '../../services/data_transfer_service.dart';

class LecturerRepo extends ChangeNotifier {
  List<Lecturer> lecturers = [];
  final DataService converter;

  LecturerRepo(this.converter);

  Future<List<Lecturer>> getAll() async {
    lecturers = await converter.getLecturers();
    notifyListeners();
    return lecturers;
  }
}

final lecturerProvider = ChangeNotifierProvider((ref) {
    return LecturerRepo(ref.watch(dataServiceProvider));
  },
);

final FutureProvider<List<Lecturer>> lecturerListProvider =
    FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getLecturers();
});
