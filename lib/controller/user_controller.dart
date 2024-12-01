import 'package:flutter/material.dart';

import '../model/user.dart';
import '../network/api_service.dart';

class UserController extends ChangeNotifier {
  final ApiService _apiService;

  UserController(this._apiService);

  List<User> users = [];
  bool isLoading = false;

    Future<void> getUsers() async {
    isLoading = true;
    notifyListeners();
    users = await _apiService.fetchUser();
    isLoading = false;
    notifyListeners();
  }
}
