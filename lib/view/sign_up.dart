import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practfire/data/login_and_logout_services.dart';
import 'package:practfire/data/provider/loading_provider.dart';
import 'package:practfire/utils/utils.dart';
import 'package:practfire/view/login_screen.dart';
import 'package:practfire/widgets/round_btn_widget.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Utils utils = Utils();
  LoginAndLogoutServices loginAndLogoutServices = LoginAndLogoutServices();
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formField,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return "Enter a valid email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock), hintText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                )),
            const SizedBox(
              height: 24,
            ),
            Consumer<LoadingProvider>(builder: (_ , value , child) {
              return RoundBtnWidget(
                title: "Sign up",
                loading: value.isloading,
                onTap: () async {
                  if (_formField.currentState!.validate()) {
                    loginAndLogoutServices.Signup(context, emailController.text.toString(), passwordController.text.toString());
                  }
                },
              );
            }),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an acccount?"),
                TextButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen())),
                    child: Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
