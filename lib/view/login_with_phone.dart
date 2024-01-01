import 'package:flutter/material.dart';
import 'package:practfire/data/login_and_logout_services.dart';
import 'package:practfire/data/provider/loading_provider.dart';
import 'package:practfire/widgets/round_btn_widget.dart';
import 'package:provider/provider.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {

  final LoginAndLogoutServices loginAndLogoutServices = LoginAndLogoutServices();
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Login"),
            const SizedBox(width: 10,),
            Icon(Icons.phone)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.24,),
              Text("Login with Phone ",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 22.0),),
              const SizedBox(height: 100.0,),
              Column(
                children: [
                  Form(
                      key: _formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                            hintText: "+92 xxxxxxxxxx",
                            prefixIcon: Icon(Icons.phone)
                        ),
                        validator: (val) {
                          if(val!.isEmpty){
                            return "Enter Phone Number";
                          }
                        },
                      )
                  ),
                  const SizedBox(height: 20.0,),
                  Consumer<LoadingProvider>(builder: (context , value , child) {
                    return RoundBtnWidget(
                        title: "Login",
                        loading: value.isloading,
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            loginAndLogoutServices.loginWithPhoneNum(context, phoneNumberController.text.toString());
                          }
                        });
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
