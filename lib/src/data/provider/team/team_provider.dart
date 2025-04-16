import 'package:flutter/material.dart';
import 'package:intuji_infogrid/src/src.dart';

class TeamProvider extends ChangeNotifier {
  final TeamRepo _teamRepo = TeamRepo();
  DataFetchStatus _status = DataFetchStatus.initial;
  List<TeamModel> _teamMembers = [];

  DataFetchStatus get status => _status;
  List<TeamModel> get teamMembers => _teamMembers;

  Future<void> fetchTeamMembers() async {
    _status = DataFetchStatus.loading;
    notifyListeners();

    final response = await _teamRepo.fetchTeamMembers();

    if (response.status) {
      _teamMembers = List<TeamModel>.from(response.data);
      _status = DataFetchStatus.success;
    } else {
      _teamMembers = [];
      _status = DataFetchStatus.error;
    }
    notifyListeners();
  }
}
