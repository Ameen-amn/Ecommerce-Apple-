import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart' show Cart;
import '../widget/cart_item.dart';
import '../provider/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Total'),
                  Spacer(),
                  Chip(
                    label: Text('${cart.total.toStringAsFixed(2)}'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false)
                            .addOrder(cart.items.values.toList(), cart.total);
                        cart.clear();
                      },
                      child: Text('Order Now'))
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (cxt, i) => CartItem(
                id: cart.items.values.toList()[i].id,
                productId: cart.items.keys.toList()[i],
                quantity: cart.items.values.toList()[i].quantity,
                price: cart.items.values.toList()[i].price,
                title: cart.items.values.toList()[i].title),
            itemCount: cart.items.length,
          ))
        ],
      ),
    );
  }
}
