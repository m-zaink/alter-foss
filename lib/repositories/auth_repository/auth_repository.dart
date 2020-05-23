// **
// Created by Mohammed Sadiq on 22/05/20.
// **

import 'dart:math';

import 'package:flutter/widgets.dart';

class AuthRepository {
  Future<bool> get isLoggedIn async {
    await Future.delayed(Duration(seconds: 2));
    return Random().nextBool();
  }

  Future<bool> logIn({
    @required String email,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return Random().nextBool();
  }

  Future<bool> signUp({
    @required String username,
    @required String email,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return Random().nextBool();
  }

  void logout() {
    // Run log-out logic here.
  }
}
