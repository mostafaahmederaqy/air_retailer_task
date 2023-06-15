import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/users_model.dart';
import '../utilities/api_status.dart';



class UsersService {
  Future<Object> getUsers() async {
    final String response = await rootBundle.loadString('assets/users_list.json');
    final data = await json.decode(response);
    return Success(response: UsersModel.fromJson(data));
  }
}
