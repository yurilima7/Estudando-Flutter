import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/product_form_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';
import 'package:shop/screens/products_screen.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),

        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),

        ChangeNotifierProvider(
          create: (_) => OrderList(),
        )
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
      
          fontFamily: 'Lato',
      
        ),
       
        debugShowCheckedModeBanner: false,
      
        routes: {
          AppRoutes.home:(context) => const ProductsOverviewScreen(),
          AppRoutes.productDetail:(context) => const ProductDetailScreen(),
          AppRoutes.cart:(context) => const CartScreen(),
          AppRoutes.orders:(context) => const OrdersScreen(),
          AppRoutes.products:(context) => const ProductsScreen(),
          AppRoutes.productForm:(context) => const ProductFormScreen(),
        },
      ),
    );
  }
}
