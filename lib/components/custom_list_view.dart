import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/constants/colors.dart';

import '../pages/profile_page.dart';
import '../services/routing_services.dart';
import 'custom_list_tile.dart';
import 'error.dart';
import 'load_indicator.dart';

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
        error: (error, stack) => SingleChildScrollView(child: ErrorView(error: error)),
      ),
    );
  }
}

