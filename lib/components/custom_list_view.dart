import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/constants/colors.dart';

import '../pages/profile_page.dart';
import '../services/routing_services.dart';

// ignore: must_be_immutable
class CustomListView extends ConsumerWidget {
  CustomListView(this.listProvider, {Key? key}) : super(key: key);

  FutureProvider<List<dynamic>> listProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    AsyncValue<List<dynamic>> accounts = ref.watch(listProvider);

    return RefreshIndicator(
      onRefresh: () async {
        accounts = ref.refresh(listProvider);
      },
      child: ListView(
        children: accounts.when(
          data: (data) => data
              .map(
                (account) => Column(
                  children: [
                    ListTile(
                      leading:  account.image != null ? CircleAvatar(
                        backgroundImage: NetworkImage(account.image!),
                      ) : const CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                      title: Text(account.name),
                      subtitle: Text(
                        account.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          RouterService.pushRoute(context, ProfilePage(userID: account.id, accountType: account.accountType));
                        },
                        icon: const Icon(Icons.arrow_forward_outlined),
                        splashColor: MyColors.themeColor[500],
                        highlightColor: MyColors.themeColor[700],
                        color: MyColors.themeColor[300],
                      ),
                    ),
                    const Divider()
                  ],
                ),
              )
              .toList(),
          loading: () => const [
            Center(
                child: SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator()))
          ],
          error: (error, stack) => [Text(error.toString())],
        ),
      ),
    );
  }
}
