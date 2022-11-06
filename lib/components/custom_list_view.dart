import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                (product) => ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_outlined),
                  ),
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
