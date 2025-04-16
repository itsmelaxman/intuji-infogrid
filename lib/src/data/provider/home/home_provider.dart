import 'package:flutter/material.dart';
import 'package:intuji_infogrid/src/src.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepo _homeRepo = HomeRepo();
  DataFetchStatus _status = DataFetchStatus.initial;
  DashboardModel? _dashboardData;

  DataFetchStatus get status => _status;
  DashboardModel? get dashboardData => _dashboardData;

  Future<void> fetchDashboardData() async {
    _status = DataFetchStatus.loading;
    notifyListeners();

    final response = await _homeRepo.fetchDashboardData();

    if (response.status) {
      _dashboardData = response.data as DashboardModel;
      _status = DataFetchStatus.success;
    } else {
      _status = DataFetchStatus.error;
    }
    notifyListeners();
  }
}
