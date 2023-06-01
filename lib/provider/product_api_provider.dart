import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Model/products_model.dart';

class ProductApiProvider with ChangeNotifier {
  List<Datum> products = [];
  int page = 1;
  bool isLoading = false;

  Future<void> fetchProducts() async {
    if (isLoading) return;
    isLoading = true;

    var response =
        await http.get(Uri.parse("https://api.disneyapi.dev/character?page=$page"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      ProductApiModel productApiModel = ProductApiModel.fromJson(data);
      products = productApiModel.data;
      page++;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (isLoading) return;
    isLoading = true;

    var response =
        await http.get(Uri.parse("https://api.disneyapi.dev/character?page=$page"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      ProductApiModel productApiModel = ProductApiModel.fromJson(data);
      products.addAll(productApiModel.data);
      page++;
    }

    isLoading = false;
    notifyListeners();
  }
}
