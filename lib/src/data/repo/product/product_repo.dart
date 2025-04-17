import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intuji_infogrid/src/src.dart';

class ProductRepo {
  Future<ApiResponse> fetchProductDetail(String productId) async {
    try {
      var response = await rootBundle.loadString(Assets.productDetailJsonPath);
      final apiResponse = ApiResponse.fromJson(
        json.decode(response) as Map<String, dynamic>,
      );

      if (apiResponse.status) {
        final productDetail = productDetailModelFromJson(
          json.encode(apiResponse.data),
        );
        return ApiResponse(
          status: true,
          message: "Product details fetched successfully",
          data: productDetail,
        );
      } else {
        return ApiResponse(status: false, message: apiResponse.message);
      }
    } catch (e) {
      return ApiResponse(status: false, message: "Something went wrong! $e");
    }
  }
}
