import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/models/product_model.dart';
import '../repos/product_repo.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductRepo productRepo = ref.watch(productProvider);
    AsyncValue<List<Product>> products = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                products = ref.watch(productListProvider);
              },
              child: ListView(

                children: products.when(
                  data: (data) => data
                      .map(
                        (product) => ListTile(
                          leading:
                              const CircleAvatar(child: Icon(Icons.person)),
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
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator()
                        )
                    )
                  ],
                  error: (error, stack) => [Text(error.toString())],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
