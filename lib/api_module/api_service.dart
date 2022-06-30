import 'dart:convert';

import 'package:fetch_api_data/models/product-models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var cleint = http.Client();

  static Future<List<ProductModel>> fetchProducts() async {
    var url = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie');
    var response = await cleint.get(url);
    var responseData;
    if (response.statusCode == 200) {
      responseData = response.body;
    }
    return productModelFromJson(responseData);
  }
}
