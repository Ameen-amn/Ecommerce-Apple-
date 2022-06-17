import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../widget/user_prouctItem.dart';
import '../widget/drawer.dart';
import './edit_product_screen.dart';

class UserProdouctScreen extends StatelessWidget {
  static const routeName = '/UserProductScreen';
  @override
  Widget build(BuildContext context) {
    final prodData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderScreen'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemBuilder: (_, i) => Column(
                  children: [
                    UserProductItem(
                      imageUrl: prodData.item[i].imageUrl,
                      title: prodData.item[i].title,
                      id: prodData.item[i].id,
                    ),
                    Divider(),
                  ],
                ),
            itemCount: prodData.item.length),
      ),
    );
  }
}
