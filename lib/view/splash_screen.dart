import 'package:flutter/material.dart';
import 'package:practfire/data/splash_seervices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Firebase Practice...",style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
