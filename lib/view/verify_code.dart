import 'package:flutter/material.dart';
import 'package:practfire/data/login_and_logout_services.dart';
import 'package:practfire/data/provider/loading_provider.dart';
import 'package:practfire/widgets/round_btn_widget.dart';
import 'package:provider/provider.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;

  VerifyCodeScreen({super.key,required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {

  final LoginAndLogoutServices loginAndLogoutServices = LoginAndLogoutServices();
  final _formKey = GlobalKey<FormState>();
  TextEditingController verifyCodeCOntrolleer = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    verifyCodeCOntrolleer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.24,),
              Text("Verify Your Phone Number!",style: TextStyle(color: Colors.deepPurple,fontSize: 20.0,fontWeight: FontWeight.bold),),
              const SizedBox(height: 30.0,),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: verifyCodeCOntrolleer,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "6 Digit Code",
                  ),
                  validator: (val) {
                    if(val!.isEmpty){
                      return "Enter Verification Code";
                    }
                  },
                ),
              ),
              const SizedBox(height: 20.0,),
              Consumer<LoadingProvider>(builder: (_ , value , child) {
                return RoundBtnWidget(title: "Verify" , loading: value.isloading, onTap: () {
                  if(_formKey.currentState!.validate()){
                    loginAndLogoutServices.verifyPhoneNumber(context, verifyCodeCOntrolleer.text.toString(), widget.verificationId.toString());
                    print(widget.verificationId);
                  }
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
