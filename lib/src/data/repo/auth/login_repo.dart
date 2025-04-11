import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intuji_infogrid/src/src.dart';

class LoginRepo {
  Future<ApiResponse> login(String email, String password) async {
    try {
      var response = await rootBundle.loadString(Assets.loginJsonPath).then((
        value,
      ) {
        return value;
      });
      final apiResponse = ApiResponse.fromJson(
        json.decode(response) as Map<String, dynamic>,
      );

      if (apiResponse.status) {
        final loginData = loginUserModelFromJson(json.encode(apiResponse.data));
        if (loginData.email == email &&
            password == AppConstants.defaultUserPassword) {
          return ApiResponse(
            status: true,
            message: "Login successful",
            data: loginData,
          );
        } else {
          return ApiResponse(
            status: false,
            message: "Invalid email or password",
          );
        }
      } else {
        return ApiResponse(status: false, message: apiResponse.message);
      }
    } catch (e) {
      return ApiResponse(status: false, message: "An error occurred: $e");
    }
  }
}
