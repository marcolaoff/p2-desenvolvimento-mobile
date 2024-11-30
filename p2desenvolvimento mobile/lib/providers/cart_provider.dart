import 'package:flutter/material.dart';
import '../models/item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ItemModel> _cartItems = [];

  List<ItemModel> get cartItems => _cartItems;

  double get totalPrice =>
      _cartItems.fold(0, (sum, item) => sum + item.price);

  void addToCart(ItemModel item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(ItemModel item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}