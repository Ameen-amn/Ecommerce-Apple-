import 'package:flutter/material.dart';
import '../provider/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  CartItem(
      {required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removieItem(productId);
      },
      confirmDismiss: (Direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Delete'),
                  content: Text("are you sure to remove"),
                  actions: [
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Yes')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text('No'))
                      ],
                    )
                  ],
                ));
      },
      background: Container(
        child: Icon(Icons.delete),
        decoration: BoxDecoration(color: Colors.red),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerRight,
      ),
      child: Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
              child: FittedBox(
            child: Text('\$$price'),
          )),
          title: Text('title'),
          subtitle: Text('Total:\$${(price * quantity)}'),
          trailing: Text('$quantity'),
        ),
      ),
    );
  }
}
