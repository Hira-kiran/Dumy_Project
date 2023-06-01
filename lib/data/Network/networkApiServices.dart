// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import '../../Model/products_model.dart';
import '../exceptions.dart';
import 'baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkAPIsServices implements BaseApiServices {
  @override

  // *************** For Get APIs *****************
  Future<ProductApiModel> getGetApiResponse(String url, ) async {
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException("No Internet Exception");
    }
    return jsonResponse;
  }

// *************** For Post APIs *****************
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(
          Uri.parse(
            url,
          ),
          body: data)
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException("No Internet Exception");
    }
    return jsonResponse;
  }

// *************** For Handle APIs Response*****************
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body.toString());
        return jsonResponse;
      case 400:
        throw BadRequestException();
      case 404:
        throw UnAuthorizedException();
      default:
        return FatchDataException(
            "Error while communication with server, Status Code: ${response.statusCode.toString()}");
    }
  }
}
