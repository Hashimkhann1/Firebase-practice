import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practfire/data/login_and_logout_services.dart';
import 'package:practfire/view/login_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  final LoginAndLogoutServices loginAndLogoutServices = LoginAndLogoutServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          IconButton(onPressed: () => loginAndLogoutServices.logOut(context), icon: Icon(Icons.logout_outlined))
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(_auth.currentUser!.email.toString())),
      ],),
    );
  }
}
