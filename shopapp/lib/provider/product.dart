import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String title;
  final String id;
  final String description;
  final double price;
  final String imageUrl;
  bool? isFavorite;
  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.price,
      this.isFavorite = false});

  void toggleFavouriteStats() {
    isFavorite = !isFavorite!;
    notifyListeners();
  }
}
