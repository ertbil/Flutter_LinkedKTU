import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_ym/constants/strings.dart';

import '../constants/enums.dart';
import '../services/data_transfer_service.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage(
      {this.userID = -1, this.accountType = AccountType.onError, Key? key})
      : super(key: key);

  final int userID;
  final AccountType accountType;

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late final  userProvider;
  bool isChecked = false;


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
  void initState() {
    switch (widget.accountType) {
      case AccountType.student:
        userProvider = FutureProvider((ref) async =>
            ref.read(dataServiceProvider).getStudent(widget.userID));
        break;
      case AccountType.lecturer:
        userProvider = FutureProvider((ref) async =>
            ref.read(dataServiceProvider).getLecturer(widget.userID));
        break;
      case AccountType.employer:
        userProvider = FutureProvider((ref) async =>
            ref.read(dataServiceProvider).getEmployer(widget.userID));
        break;
      default:
        return;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<dynamic> user = ref.watch(userProvider);

    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            user = ref.refresh(userProvider);
          },
          child: CustomScrollView(slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: [

                IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
              ],
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    user.when(
                        data: (data) => data.image != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(data.image),
                              )
                            : const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                        loading: () => const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                        error: (error, stack) => const CircleAvatar(
                              child: Icon(Icons.error, color: Colors.red),
                            )),
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
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        icon: isChecked
                            ? const Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              )),
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
                              ListTile(
                                title: Row(
                                  children: const [
                                    Icon(Icons.email),
                                    SizedBox(width: 10),
                                    Text('Email'),
                                  ],
                                ),
                                subtitle: Text(data.contactInfo.email),
                              ),
                              ListTile(
                                title: Row(
                                  children: const [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Phone'),
                                  ],
                                ),
                                subtitle: Text(data.contactInfo.phone),
                              ),
                              ListTile(
                                title: Row(
                                  children: const [
                                    Icon(Icons.location_on),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Address'),
                                  ],
                                ),
                                subtitle: Text(data.contactInfo.address),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (data.accountType == AccountType.student)
                          Column(
                            children: [
                              ListTile(
                                title: Row(
                                  children: const [
                                    Icon(Icons.location_city),
                                    SizedBox(width: 10),
                                    Text('Live in'),
                                  ],
                                ),
                                subtitle: Text(data.city),
                              ),
                              ListTile(
                                title: Row(
                                  children: const [
                                    Icon(Icons.school),
                                    SizedBox(width: 10),
                                    Text('Studied at'),
                                  ],
                                ),
                                subtitle: Text(data.school),
                              ),
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
                      ],
                    ),
                    loading: () => SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator()),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5),
                        ],
                      )),
                    ),
                    error: (error, stack) =>  Center(child: Text(error.toString())),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
