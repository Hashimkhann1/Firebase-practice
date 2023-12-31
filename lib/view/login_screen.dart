import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practfire/data/login_and_logout_services.dart';
import 'package:practfire/data/provider/loading_provider.dart';
import 'package:practfire/utils/utils.dart';
import 'package:practfire/view/sign_up.dart';
import 'package:practfire/widgets/round_btn_widget.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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


    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          automaticallyImplyLeading: false,
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
                          if(value!.isEmpty || !value.contains('@')){
                            return "Enter a valid email";
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 14,),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Password"
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Enter Password";
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 24,),
              Consumer<LoadingProvider>(builder: (context , value , child) {
                return RoundBtnWidget(title: "Login",loading: value.isloading,onTap: () {
                  if(_formField.currentState!.validate()){
                    loginAndLogoutServices.login(context , emailController.text.toString() , passwordController.text.toString());
                  }
                },);
              }),
              const SizedBox(height: 6.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an acccount?"),
                  TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())), child: Text('Sign Up'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
