import 'package:flutter/material.dart';
import '../widget/drawer.dart';
import '../provider/product.dart';
import '../widget/products_grid.dart';
import './cart_screen.dart';

enum selectedState { All, Favorite }

class ProductsOverView extends StatefulWidget {
  @override
  _ProductsOverViewState createState() => _ProductsOverViewState();
}

class _ProductsOverViewState extends State<ProductsOverView> {
 

  var _showOnlyFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopApp'),
        actions: [
          PopupMenuButton(
              onSelected: (selectedState selectedValue) {
                setState(() {
                  if (selectedValue == selectedState.Favorite) {
                    _showOnlyFav = true;
                  } else {
                    _showOnlyFav = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('All'),
                      value: selectedState.All,
                    ),
                    PopupMenuItem(
                      child: Text('Fvourite'),
                      value: selectedState.Favorite,
                    ),
                  ]),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Productsgrid(showFav: _showOnlyFav),
      drawer: MainDrawer(),
    );
  }
}
