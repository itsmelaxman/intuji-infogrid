import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intuji_infogrid/src/src.dart';

class HomeRepo {
  Future<ApiResponse> fetchDashboardData() async {
    try {
      var response = await rootBundle.loadString(Assets.dashboardJsonPath);
      final apiResponse = ApiResponse.fromJson(
        json.decode(response) as Map<String, dynamic>,
      );

      if (apiResponse.status) {
        final dashboardData = dashboardModelFromJson(
          json.encode(apiResponse.data),
        );
        return ApiResponse(
          status: true,
          message: "Dashboard data fetched successfully",
          data: dashboardData,
        );
      } else {
        return ApiResponse(status: false, message: apiResponse.message);
      }
    } catch (e) {
      return ApiResponse(status: false, message: "Something went wrong! $e");
    }
  }
}
