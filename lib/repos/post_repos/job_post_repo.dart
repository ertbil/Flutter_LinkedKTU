import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/post_models/job_post_model.dart';
import '../../services/data_transfer_service.dart';

class JobPostRepo extends ChangeNotifier {
  List<JobPost> _jobPosts = [];

  List<JobPost> get jobPosts => _jobPosts;

  set jobPosts(List<JobPost> jobPosts) {
    _jobPosts = jobPosts;
  }
  final DataService converter;

  JobPostRepo(this.converter);

  Future<List<JobPost>> getAll() async {
    jobPosts = await converter.getJobPosts();
    notifyListeners();
    return jobPosts;
  }
}

final productProvider = ChangeNotifierProvider(
  (ref) {
    return JobPostRepo(ref.watch(dataServiceProvider));
  },
);

final FutureProvider<List<JobPost>> productListProvider =
    FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getJobPosts();
});
