import 'package:allpartner/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProductServicer.dart';

class ProductController extends ChangeNotifier {
  ProductController({this.productService = const ProductService()});

  ProductService productService;
  String? token;
  SharedPreferences? pref;
  List<User> productCompany = [];

  // ProductCompany
  Future<void> loadProductCompany({
    required int Id,
  }) async {
    final _loadProduct = await ProductService.getProductCompany(companyId: Id);
    productCompany = (_loadProduct);

    notifyListeners();
  }
}
