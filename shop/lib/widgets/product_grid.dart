import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/widgets/product_grid_item.dart';

class ProductGrid extends StatelessWidget {

  final bool showFavoriteOnly;
  
  const ProductGrid(this.showFavoriteOnly, {Key? key})
   : super(key: key);

  @override
  Widget build(BuildContext context) {
    // recebendo a lista de produtos
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
     showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      
      itemBuilder: (context, index) =>
        ChangeNotifierProvider.value(
          value: loadedProducts[index],
          child: const ProductGridItem(),
      ),
    );
  }
}