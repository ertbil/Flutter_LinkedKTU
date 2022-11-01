import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user_models/employer_model.dart';
import '../../services/data_transfer_service.dart';

class EmployerRepo extends ChangeNotifier {
  List<Employer> _employers = [];

  List<Employer> get employers => _employers;

  set employers(List<Employer> employers) {
    _employers = employers;
  }
  final DataService converter;

  EmployerRepo(this.converter);

  Future<List<Employer>> getAll() async {
    employers = await converter.getEmployers();
    notifyListeners();
    return employers;
  }
}

final productProvider = ChangeNotifierProvider(
  (ref) {
    return EmployerRepo(ref.watch(dataServiceProvider));
  },
);

final FutureProvider<List<Employer>> productListProvider =
    FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getEmployers();
});
