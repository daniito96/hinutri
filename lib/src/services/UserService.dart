import 'package:flutter/material.dart';
import 'package:hinutri/src/models/User.dart';
import 'package:http/http.dart' as http;

class UserService with ChangeNotifier {
  final userRequest = 'https://reqres.in/api/users?page=2';

  List<Persona> usuarios = [];

  UserService() {
    this.getUsers();
  }

  getUsers() async {
    final users = userRequest;

    final resp = await http.get(users);

    final userResponse = userResponseFromJson(resp.body);
    // print(response.data.length);
    usuarios.addAll(userResponse.data);
    notifyListeners();
  }
}
