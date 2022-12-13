import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../error_and_load/error.dart';
import '../error_and_load/load_indicator.dart';
import 'custom_list_tile.dart';



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
      child: accounts.when(
        data: (data) => ListView(

          children: data
              .map(
                (account) => Column(
                  children: [
                    CustomListTile( account: account),
                    const Divider()
                  ],
                ),
              )
              .toList(),
        ),
        loading: () => const LoadIndicator(),
        error: (error, stack) => ErrorView(error: error),
      ),
    );
  }
}

