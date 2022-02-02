import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

class ProductProvider extends ChangeNotifier {
  List<Cart> _productsInCart = [];

  List<Cart> get productsInCart => _productsInCart;

  int numberOfProductInCart() {
    return _productsInCart.length;
  }

  Cart getProductFromCart(int index) {
    return _productsInCart[index];
  }

  void remouveFromCart(int index) {
    _productsInCart.removeAt(index);
  }

  void addToCart(Cart cart) {
    _productsInCart.add(cart);
    // notifyListeners();
  }
}
