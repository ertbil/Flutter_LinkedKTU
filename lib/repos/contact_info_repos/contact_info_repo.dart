import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/contact_models/contact_info_model.dart';
import '../../services/data_transfer_service.dart';

class ContactInfoRepo extends ChangeNotifier {
  List<ContactInfo> contactInfos = [];
  ContactInfo? contactInfo;
  final DataService converter;

  ContactInfoRepo(this.converter);

  Future<List<ContactInfo>> getAll() async {
    contactInfos = await converter.getContactInfos();
    notifyListeners();
    return contactInfos;
  }

  Future<ContactInfo> getContactInfoById(int id) async {
    contactInfo = await converter.getContactInfo(id);
    notifyListeners();
    return contactInfo!;
  }
}

final productProvider = ChangeNotifierProvider(
  (ref) {
    return ContactInfoRepo(ref.watch(dataServiceProvider));
  },
);

final FutureProvider<List<ContactInfo>> productListProvider =
    FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getContactInfos();
});
