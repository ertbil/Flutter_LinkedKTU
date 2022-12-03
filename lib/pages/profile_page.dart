import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/constants/strings.dart';

import '../constants/enums.dart';
import '../services/data_transfer_service.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage(
      {this.userID = -1, this.accountType = AccountType.onError, Key? key})
      : super(key: key);

  final int userID;
  final AccountType accountType;

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: const EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userProvider;

    switch (accountType) {
      case AccountType.student:
        userProvider = FutureProvider(
            (ref) async => ref.read(dataServiceProvider).getStudent(userID));
        break;
      case AccountType.lecturer:
        userProvider = FutureProvider(
            (ref) async => ref.read(dataServiceProvider).getLecturer(userID));
        break;
      case AccountType.employer:
        userProvider = FutureProvider(
            (ref) async => ref.read(dataServiceProvider).getEmployer(userID));
        break;
      default:
        return const Center(child: Text('Error'));
    }

    AsyncValue<dynamic> user = ref.watch(userProvider);

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: user.when(
                    data: (data) => data.image != null
                        ? Image.network(data.image!)
                        : const Icon(Icons.person),
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stack) => const Icon(Icons.person),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: user.when(
                    data: (data) => Text(
                      data.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stack) => const Text('Error'),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              user.when(
                data: (data) => Column(
                  children: [
                    const SizedBox(height: 20),
                    ListTile(
                      title: const Text(Strings.about),
                      subtitle: Text(data.description),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      title: const Text('Contact'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.email),
                          Text(data.phone),
                          Text(data.address),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (data.accountType == AccountType.student)
                      ListTile(
                        title: const Text('Skills'),
                        subtitle: data.technologies != null
                            ? Wrap(
                                spacing: 6.0,
                                children: [
                                  for (var skill in data.technologies)
                                    _buildChip(skill, Colors.blue),
                                ],
                              )
                            : const Text('No skills'),
                      ),
                  ],
                ),
                loading: () => const Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator())),
                error: (error, stack) => const Center(child: Text('Error')),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
