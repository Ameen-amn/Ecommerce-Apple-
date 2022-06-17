import 'package:flutter/material.dart';
import './product_item.dart';
import '../provider/product.dart';

import '../provider/products.dart';
import 'package:provider/provider.dart';

class Productsgrid extends StatelessWidget {
  final bool showFav;
  Productsgrid({required this.showFav});
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final product = showFav ? productData.favouriteItems : productData.item;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: product[index],
        child: ProductItem(),
      ),
      itemCount: product.length,
    );
  }
}
