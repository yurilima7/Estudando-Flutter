import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductDetailScreen extends StatelessWidget {

  const ProductDetailScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // recebendo os dados do produto
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
    );
  }
}
