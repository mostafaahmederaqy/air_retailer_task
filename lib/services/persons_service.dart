import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/persons_model.dart';
import '../utilities/api_status.dart';

class PersonsService {
  Future<Object> getPersons() async {
    final String response = await rootBundle.loadString('assets/mock.json');
    final data = await json.decode(response);
    return Success(response: PersonsModel.fromJson(data));
  }
}
