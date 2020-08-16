import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:osk_dev_app/model/core/Category.dart';
import 'package:osk_dev_app/model/core/Product.dart';
import 'package:osk_dev_app/model/services/cateService.dart';
import 'package:osk_dev_app/model/services/prodService.dart';

class ProdProvider extends ChangeNotifier {
//Global variables
  List<ProductElement> _oskProducts = [];
  List<ProductElement> _hobProducts = [];
  List<ProductElement> _cartProducts = [];
  List<ProductElement> _cateProducts = [];
  ProductElement _activeProduct;
  Category _activeCategory;

//Service Api Object
  final _prodService = ProdService();
  final _cateService = CateService();

//Getters
  List<ProductElement> get oskProducts => _oskProducts;
  List<ProductElement> get hobProducts => _hobProducts;
  List<ProductElement> get cartProducts => _cartProducts;
  List<ProductElement> get cateProducts => _cateProducts;
  ProductElement get activeProduct => _activeProduct;
  Category get activeCategory => _activeCategory;

  Future<List<ProductElement>> getProductsonCategory() async {
    _cateService.chosen_cate = _activeCategory.title;
    _cateProducts = await _cateService.getProductsonCategory();
    return cateProducts;
  }

  Future<List<ProductElement>> getTenOskProducts() async {
    _prodService.chosen_brand = "osk";
    _oskProducts = await _prodService.getProducts();
    return oskProducts;
  }

  Future<List<ProductElement>> getTenHobProducts() async {
    _prodService.chosen_brand = "hob";
    _hobProducts = await _prodService.getProducts();
    return hobProducts;
  }

  setActiveProduct(ProductElement p) {
    _activeProduct = p;
  }

  setActiveCategory(Category c) {
    _activeCategory = c;
    notifyListeners();
  }

  addProductToCart(ProductElement p) {
    //Check if the product is already available in the cart.
    //If that is the case then increment the qty by 1
    ProductElement found = _cartProducts
        .firstWhere((element) => element.id == p.id, orElse: () => null);
    if (found != null) {
      found.qty += 1;
    } else {
      _cartProducts.add(p);
    }
    notifyListeners();
  }

  removeProductFromCart(ProductElement p) {
    ProductElement found = _cartProducts
        .firstWhere((element) => element.id == p.id, orElse: () => null);
    if (found != null && found.qty < 1) {
      _cartProducts.remove(p);
    } else {
      found.qty -= 1;
    }
    notifyListeners();
  }
}
