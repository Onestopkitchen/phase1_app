import 'package:flutter/foundation.dart';
import 'package:osk_dev_app/model/core/Product.dart';

class MyStore extends ChangeNotifier {
  //Global variable
  List<Product> _products = [];
  List<Product> _cartProducts = [];
  Product _activeProduct = null;

  //Constructor to initialize the variable
  MyStore() {
    _products = [
      Product(
          id: 1,
          name: 'Margerita Pizza',
          description: "Pizza Made with love",
          img: 'assets/images/product_1.png',
          qty: 0,
          price: 300),
      Product(
          id: 2,
          name: 'Burger',
          description: "Burger From India",
          img: 'assets/images/product_2.png',
          qty: 0,
          price: 250),
      Product(
          id: 3,
          name: 'Chinese Items Rice Bowl',
          description: "Chinese bu made in India",
          img: 'assets/images/product_1.png',
          qty: 0,
          price: 150),
      Product(
          id: 4,
          name: 'French Fries',
          description: "French Fries from US",
          img: 'assets/images/product_1.png',
          qty: 0,
          price: 200),
      Product(
          id: 5,
          name: 'Rolls',
          description: "Rolls from Haryana",
          img: 'assets/images/product_2.png',
          qty: 0,
          price: 100),
    ];
    //send notifications to the provider
    //notifyListeners();
  }

  //To access this valus outside we use getter
  List<Product> get products => _products;
  List<Product> get cartProducts => _cartProducts;
  Product get activeProduct => _activeProduct;
}
