


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practfire/data/provider/loading_provider.dart';
import 'package:practfire/utils/utils.dart';
import 'package:practfire/view/login_screen.dart';
import 'package:practfire/view/posts/posts_screen.dart';
import 'package:provider/provider.dart';

class LoginAndLogoutServices {

  Utils utils = Utils();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void Signup(BuildContext context , String email , String password) async {

    final loadingProvider = Provider.of<LoadingProvider>(context,listen: false);

    loadingProvider.startLoading();

    await _auth.createUserWithEmailAndPassword(
        email: email.toString(),
        password: password.toString()).then((value){
      utils.toastMessage('user created :)');
      Navigator.push(context, MaterialPageRoute(builder: (context) => PostsScreen()));
      loadingProvider.stopLoading();
    }).onError((error, stackTrace){
      loadingProvider.stopLoading();
      // if email already in use
      if(error.toString().contains('firebase_auth/email-already-in-use')){
        utils.toastMessage("Email is already in use!");
        // if email length is less than 6 chatacter
      }else if(error.toString().contains('Password should be at least 6 characters')){
        loadingProvider.stopLoading();
        utils.toastMessage("Password should be at least 6 characters");
      }
      else{
        loadingProvider.stopLoading();
        utils.toastMessage(error.toString());
      }
    });
  }

  void login(BuildContext context , String email , String password) async {
    final loadingProvider = Provider.of<LoadingProvider>(context,listen: false);
    loadingProvider.startLoading();
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      utils.toastMessage("User Login");
      Navigator.push(context, MaterialPageRoute(builder: (context) => PostsScreen()));
      loadingProvider.stopLoading();
    }).onError((error, stackTrace) {
      if(error.toString().contains('firebase_auth/network-request-failed')){
        utils.toastMessage("Network error");
      }else{
        utils.toastMessage("Invalid email or password");
        loadingProvider.stopLoading();
      }
    });
    loadingProvider.stopLoading();
  }

  void logOut(BuildContext context) async {
    await _auth.signOut().then((value) {
      utils.toastMessage("User Logout");
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }).onError((error, stackTrace) {
      utils.toastMessage(error.toString());
    });
  }

}