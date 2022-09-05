import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  // recebendo a lista de produtos
  final List<Product> loadedProducts = dummyProducts;
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ), 

        itemBuilder: (context, index) => ProductItem(product: loadedProducts[index]),
      ),
    );
  }
}
