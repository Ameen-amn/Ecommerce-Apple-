import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String title;
  int quantity;
  double price;
  CartItem(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.title});
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(
    String prodId,
    double price,
    String title,
  ) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (existingitem) => CartItem(
              id: existingitem.id,
              quantity: existingitem.quantity + 1,
              price: existingitem.price,
              title: existingitem.title));
    } else {
      _items.putIfAbsent(
        prodId,
        () => CartItem(
          id: DateTime.now().toString(),
          quantity: 1,
          price: price,
          title: title,
        ),
      );
    }
    notifyListeners();
  }

  double get total {
    double totalAmount = 0.0;
    _items.forEach((key, cartItem) {
      totalAmount += cartItem.price * cartItem.quantity;
    });
    return totalAmount;
  }

  void removieItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void singleCartItem(String prodId) {
    if (!_items.containsKey(prodId)) {
      return;
    }
    if (_items[prodId]!.quantity > 1) {
      _items.update(
          prodId,
          (cartItem) => CartItem(
              id: cartItem.id,
              quantity: cartItem.quantity - 1,
              price: cartItem.price,
              title: cartItem.title));
    } else {
      _items.remove(prodId);
    }
    notifyListeners();
  }
}
