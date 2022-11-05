import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../services/data_transfer_service.dart';


class ProductRepo extends ChangeNotifier{
  List<Product> places = [];
  final DataService converter;

  ProductRepo(this.converter);

  Future<List<Product>> getAll() async {
    places = await converter.getProducts();
    notifyListeners();
    return places;
  }
}
final productProvider = ChangeNotifierProvider((ref) {
  return ProductRepo(ref.watch(dataServiceProvider));
},
);

final FutureProvider<List<Product>> productListProvider = FutureProvider( (ref)  async{
  return ref.read(dataServiceProvider).getProducts();

}
);