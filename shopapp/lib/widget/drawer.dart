import 'package:flutter/material.dart';
import 'package:shopapp/screens/orders_screen.dart';
import 'package:shopapp/screens/user_product.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Customer'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('payment'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.rounteName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Product'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProdouctScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
