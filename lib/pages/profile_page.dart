import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/components/error_and_load/error.dart';

import '../components/error_and_load/load_indicator.dart';
import '../components/profile_list_comps/general_profile_list.dart';
import '../components/profile_list_comps/student_profile_list.dart';
import '../constants/enums.dart';
import '../constants/strings.dart';
import '../services/data_transfer_service.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage(
      {this.userID = "-1", this.accountType = AccountType.onError, Key? key})
      : super(key: key);

  final String userID;
  final AccountType accountType;

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  // ignore: prefer_typing_uninitialized_variables
  late final userProvider; // at the initState type can be change that's why we ignore: prefer_typing_uninitialized_variables
  bool isChecked = false;

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
                IconButton(
                    onPressed: () {
                      //TODO edit will be add
                    },
                    icon: const Icon(Icons.edit))
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
                        error: (error, stack) => const Text(Strings.error),
                      ),
                    ),
                    IconButton(
                        //TODO this Icon should be view by auth
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
            user.when(
                data: (data) => SliverList(
                        delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          GeneralProfileList(data: data),
                          if (data.accountType == AccountType.student)
                            StudentProfileList(
                              data: data,
                            ),
                        ],
                      ),
                    ])),
                loading: () => SliverList(
                      delegate: SliverChildListDelegate([
                        const LoadIndicator(),
                      ]),
                    ),
                error: (error, stack) => SliverList(
                    delegate:
                        SliverChildListDelegate([ErrorView(error: error)]))),
          ]),
        ),
      ),
    );
  }
}
