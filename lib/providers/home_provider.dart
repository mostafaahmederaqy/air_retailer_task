import 'package:flutter/material.dart';

import '../models/persons_model.dart';
import '../services/persons_service.dart';
import '../utilities/api_status.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    fetchPersons();
  }
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Person> _personList = [];
  List<Person> _foundUser = [];

  List<Person> get foundUser => _foundUser;

  set foundUser(List<Person> value) {
    _foundUser = value;
    notifyListeners();
  }

  List<Person> get personList => _personList;

  set personList(List<Person> value) {
    _personList = value;
    notifyListeners();
  }

  Future<void> fetchPersons() async {
    isLoading = true;
    final result = await PersonsService().getPersons();
    if (result is Success) {
      isLoading = false;
      final personsResponse = result.response as PersonsModel;
      personsResponse.persons.sort((a, b) {
        return a.email.toLowerCase().compareTo(b.email.toLowerCase());
      });
      personList = personsResponse.persons;
      foundUser = personList;
    }
  }

  void runFilter(String enteredKeyword) {
    List<Person> results = [];
    if (enteredKeyword.isEmpty) {
      results = personList;
    } else {
      results = personList
          .where((person) => person.email
              .substring(0, person.email.indexOf('@'))
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    foundUser = results;
  }
}
