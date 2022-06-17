import 'package:flutter/material.dart';
import './screens/products_overview.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './provider/products.dart';
import './provider/cart.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_product.dart';
import './provider/orders.dart';
import './screens/edit_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (ctx) => ProductsOverView(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.rounteName: (ctx) => OrdersScreen(),
          UserProdouctScreen.routeName: (ctx) => UserProdouctScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen()
        },
      ),
    );
  }
}
