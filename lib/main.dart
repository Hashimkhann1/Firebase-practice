import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practfire/data/provider/loading_provider.dart';
import 'package:practfire/view/home_screen.dart';
import 'package:practfire/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: SplashScreen()
      ),
    );
  }
}

