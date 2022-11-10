import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/constants/colors.dart';
import 'package:project_ym/pages/profile_page.dart';

import '../services/routing_services.dart';

// ignore: must_be_immutable
class CustomListView extends ConsumerWidget {
  CustomListView(this.listProvider, {Key? key}) : super(key: key);

  FutureProvider<List<dynamic>> listProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<dynamic>> products = ref.watch(listProvider);
    return RefreshIndicator(
      onRefresh: () async {
        products = ref.refresh(listProvider);
      },
      child: ListView(
        children: products.when(
          data: (data) => data
              .map(
                (product) => Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(product.name),
                      subtitle: Text(product.description, maxLines: 1, overflow: TextOverflow.ellipsis, ),
                      trailing: IconButton(

                        onPressed: () {
                          RouterService.pushRoute(context, ProfilePage(product));
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
