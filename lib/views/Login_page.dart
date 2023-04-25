
import 'dart:developer';

import 'package:et/views/round_btn.dart';
import 'package:et/views/second_page.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
@override
  // void initState() {
  //   Login("demo@extensionerp.com", "demo@001");
  //   super.initState();
  // }
  // final _auth = FirebaseAuth.instance;
  final emilcont = TextEditingController();
  final passcont = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> Login(String email,String pass)
  async {
    Response response =  await http.post(Uri.parse('https://demo.extensionerp.com/api/method/login'),
    body: {
        "usr": email,
        "pwd": pass
        });
    try
    {
      if(response.statusCode == 200)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context) => Second_page()));
      }
    }
    catch (e){
      print(e.toString());
    }
    print("error");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                    key: _formkey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height*0.3,
                            width: MediaQuery.of(context).size.width*0.6,
                            child: Image.asset('assets/login.png')),
                        SizedBox(height: 25,),
                        TextFormField(
                          controller: emilcont,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: [AutofillHints.email],
                          decoration: InputDecoration(
                              label: Text('Email'),
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Email';
                            }
                            else if(!EmailValidator.validate(value))
                            {
                              return 'Enter email';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: passcont,
                          decoration: InputDecoration(
                              label: Text('Password'),
                              prefixIcon: Icon(Icons.password_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'Password';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 30,),
                      ],
                    )),
                Roundbtn(title: 'Login', ontap: (){
                  if(_formkey.currentState!.validate())
                  {
                    log(emilcont.toString());
                    // Login("demo@extensionerp.com", "demo@001");
                    Login(emilcont.text.toString(), passcont.text.toString());
                  }
                }),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(thickness: 1,color: Colors.black,)),
                      Text('  Or  '),
                      Expanded(child: Divider(thickness: 1,color: Colors.black,))
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account ?"),
                    TextButton(onPressed: (){
                      // Get.to(SignupScreen());
                    }, child: Text('Register'))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
