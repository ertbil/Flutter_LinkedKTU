import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user_models/employer_model.dart';
import '../../services/data_transfer_service.dart';

class EmployerRepo extends ChangeNotifier {
  List<Employer> employers = [];
  var employer;
  final DataService converter;

  EmployerRepo(this.converter);

  Future<List<Employer>> getAll() async {
    employers = await converter.getEmployers();
    notifyListeners();
    return employers;
  }

  Future<Employer> getEmployer(String userID) {
    employer = converter.getEmployer(userID);
    notifyListeners();
    return employer;
  }

  addEmployer(Employer employer) {
    converter.addEmployer(employer);
    notifyListeners();
  }
}

final employerProvider = ChangeNotifierProvider(
  (ref) {
    return EmployerRepo(ref.watch(dataServiceProvider));
  },
);

final FutureProvider<List<Employer>> employerListProvider =
    FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getEmployers();
});
