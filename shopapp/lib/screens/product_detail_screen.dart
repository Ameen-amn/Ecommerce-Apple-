import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/ProductDetailScreen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
