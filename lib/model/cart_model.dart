import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items on sale
  final List _shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    ["Banana", "7.0", "lib/images/bananas.png", Colors.yellow],
    ["Orange", "5.0", "lib/images/orange-juice.png", Colors.orange],
    ["Strawberry", "3.0", "lib/images/strawberry.png", Colors.red],
    ["Watermelon", "10.0", "lib/images/watermelon.png", Colors.green],
  ];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  //list of cart items
  List _cartItems = [];

  //adding to the cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //removing from the cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculating the total price
  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
