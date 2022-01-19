import 'package:flutter/material.dart';
import 'package:shop_app/models/app_tab.dart';

class AppStateManager extends ChangeNotifier {
  bool _isSplashed = false;
  bool _isLogin = false;
  bool _logInSucess = false;
  int _selectedTab = AppTab.home;
  bool _displayProduct = false;
  bool _displayCart = false;

  bool get isLogin => _isLogin;
  int get selectTab => _selectedTab;
  bool get logInSucess => _logInSucess;
  bool get isSplashed => _isSplashed;
  bool get displayProduct => _displayProduct;
  bool get displayCart => _displayCart;

  void plashed() {
    _isSplashed = true;
    notifyListeners();
  }

  void login() {
    _isLogin = true;
    notifyListeners();
  }

  void loginSucess() {
    _logInSucess = true;
    notifyListeners();
  }

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void setDisplayProduct(bool val) {
    _displayProduct = val;
    notifyListeners();
  }

  void goToCart() {
    _displayCart = true;
    notifyListeners();
  }

  void setCart(bool val) {
    _displayCart = val;
    notifyListeners();
  }
}
