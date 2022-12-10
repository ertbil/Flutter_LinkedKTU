import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/post_models/post_model.dart';
import '../../services/data_transfer_service.dart';

class PostRepo extends ChangeNotifier {
  List<Post> posts = [];
  final DataService converter;

  PostRepo(this.converter);

  Future<List<Post>> getAll() async {
    posts = await converter.getPosts();
    notifyListeners();
    return posts;
  }
}

final productProvider = ChangeNotifierProvider(
  (ref) {
    return PostRepo(ref.watch(dataServiceProvider));
  },
);

final FutureProvider<List<Post>> productListProvider =
    FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getPosts();
});
