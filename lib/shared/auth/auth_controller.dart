import 'package:flutter/material.dart';
import 'package:payflow/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      _user = user;
      saveUser(user);
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> curentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final user = instance.get("user") as String;
      setUser(context, UserModel.fromJson(user));
    } else {
      setUser(context, null);
    }

    return;
  }
}