import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart' show Orders;
import '../widget/order_item.dart';
import '../widget/drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const rounteName = '/OrderScreen';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(order: orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
