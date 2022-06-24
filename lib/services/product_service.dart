import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos/models/models.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'flutter-productos-3734f-default-rtdb.firebaseio.com';

  final List<Product> productos = [];
  late Product selectedProduct;

  bool isLoading = true;

  ProductService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    productsMap.forEach(((key, value) {
      final tempProduct = Product.fromMap( value );
      tempProduct.id = key;
      productos.add( tempProduct );
    }));

    isLoading = false;
    notifyListeners();
    return productos;
  }
}