// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart => _cart;

  void addToCart(Map<String, dynamic> item) {
    int index = _cart.indexWhere((cartItem) => cartItem['id'] == item['id']);

    if (index != -1) {
      _cart[index]['quantity']++;
    } else {
      item['quantity'] = 1;
      _cart.add(item);
    }
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cart[index]['quantity']++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_cart[index]['quantity'] > 1) {
      _cart[index]['quantity']--;
    } else {
      _cart.removeAt(index);
    }
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
