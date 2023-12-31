


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practfire/view/login_screen.dart';
import 'package:practfire/view/posts/posts_screen.dart';

class SplashServices {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void isLogin(BuildContext context) {
    _auth.currentUser != null ? Timer(Duration(seconds: 3), () =>
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PostsScreen()))) : Timer(Duration(seconds: 3), () =>
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

}