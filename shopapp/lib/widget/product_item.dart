import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../provider/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                icon: Icon(product.isFavorite!
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () => product.toggleFavouriteStats(),
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added a product to cart'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.singleCartItem(product.id);
                    },
                  ),
                ));
              },
            ),
          )),
    );
  }
}
