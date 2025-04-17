import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intuji_infogrid/src/src.dart';

class TeamRepo {
  Future<ApiResponse> fetchTeamMembers() async {
    try {
      var response = await rootBundle.loadString(Assets.teamJsonPath);
      final apiResponse = ApiResponse.fromJson(
        json.decode(response) as Map<String, dynamic>,
      );

      if (apiResponse.status) {
        final teamMembers = teamModelFromJson(json.encode(apiResponse.data));
        return ApiResponse(
          status: true,
          message: "Team members fetched successfully",
          data: teamMembers,
        );
      } else {
        return ApiResponse(status: false, message: apiResponse.message);
      }
    } catch (e) {
      return ApiResponse(status: false, message: "Something went wrong! $e");
    }
  }
}
