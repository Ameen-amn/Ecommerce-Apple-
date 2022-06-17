import 'package:flutter/material.dart';
import '../provider/orders.dart' as ord;
import 'dart:math';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem({required this.order});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 100, 180),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                          children: [
                            Text(prod.title),
                            Text('${prod.quantity * prod.price}')
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
