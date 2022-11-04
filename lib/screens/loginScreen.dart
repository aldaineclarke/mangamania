import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/network_handler.dart';
import '../services/secure_store.dart';
import '../utilities/colors.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image(
              image: AssetImage("assets/movies_wallpaper.jpg"),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit:BoxFit.cover
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: .98,
                colors: [AppColors.primaryColor.withOpacity(.6), AppColors.primaryColor.withOpacity(.8), AppColors.primaryColor, Color(0xFF091026)],
                tileMode: TileMode.clamp
              ),

            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          LoginForm(),

        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Map _requestState = {
    "hasError" : false,
    "message": "",
    "pending": false,
  };


  void submitForm() async{
    try{
      setState(() {
        _requestState["pending"] = true;
      });
      Map body = {
        "email": emailController.text,
        "password":passwordController.text,
      };
      String responseString = await NetworkHandler.post("/authenticate", body);
      Map<String, dynamic> responseMap = jsonDecode(responseString);
      SecureStore.storeToken("jwt-auth", responseMap["data"]["token"]);
      SecureStore.createUser(responseMap["data"]["user"]);
      Navigator.of(context).pushNamed("/home");

    }catch(error){
      setState(() {
        _requestState["pending"] = false;
        _requestState["hasError"] = true;
        _requestState["message"] = error.toString();
      });
    }
  }


  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      return (_requestState["pending"]) ? Center(child: CircularProgressIndicator(),): Form(
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text("Email", style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.bold),),
                TextFormField(

                  controller: emailController,
                  style: TextStyle(color:AppColors.titleColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    errorText: (_requestState["hasError"] && !(_requestState["message"].toString().contains("password")))? _requestState["message"]: null,
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.titleColor, width:2)),
                  ),
                ),
              SizedBox(height: 20),
              Text("Password", style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.bold),),
              TextFormField(
                controller: passwordController,
                style: TextStyle(color:AppColors.titleColor),
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  isDense: true,
                  errorText: (_requestState["hasError"] && _requestState["message"].toString().contains("password"))? _requestState["message"]: null,
                  contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.titleColor, width:2)),
                ),
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Text("Forget password? ", style: TextStyle(color: AppColors.titleColor, ),),
                  TextButton(
                    onPressed: (){},
                    child: Text("Reset Password", style: TextStyle(color: AppColors.titleColor, fontSize: 12, fontWeight: FontWeight.bold),))
                ],
              ),
              SizedBox(height: 5),
              Row(
                
                children:[ Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        backgroundColor: AppColors.secondaryColor
                      ),
                      onPressed: (){
                        submitForm();
                      },
                      child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)
                  ),
                ),
              ])

            ],
          ),
        )
      ) ;
  }
}

