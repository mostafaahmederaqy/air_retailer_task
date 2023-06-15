import 'package:flutter/material.dart';

import '../models/users_model.dart';
import '../services/persons_service.dart';
import '../utilities/api_status.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    fetchUsers();
  }
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<User> _userList = [];
  List<User> _foundUser = [];

  List<User> get foundUser => _foundUser;

  set foundUser(List<User> value) {
    _foundUser = value;
    notifyListeners();
  }

  List<User> get userList => _userList;

  set userList(List<User> value) {
    _userList = value;
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    isLoading = true;
    final result = await UsersService().getUsers();
    if (result is Success) {
      isLoading = false;
      final personsResponse = result.response as UsersModel;
      personsResponse.response.users.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });
      userList = personsResponse.response.users;
      foundUser = userList;
    }
  }

  void runFilter(String enteredKeyword) {
    List<User> results = [];
    if (enteredKeyword.isEmpty) {
      results = userList;
    } else {
      results = userList
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    foundUser = results;
  }
}
