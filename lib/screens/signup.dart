
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();
  TextEditingController userID = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue

        ),

          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              SizedBox(
                height: 200,
              ),
              Text(
                "TravelManiac",
                style: TextStyle(
                    color:Colors.white,
                    fontSize: 50.0
                ),

              ),

              SizedBox(
                height: 70,
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                  ),

                  child:SingleChildScrollView(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: userID,
                          decoration: InputDecoration(
                              hintText: "Username",
                              labelText: 'Username',
                              icon: Icon(Icons.account_circle),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              )
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              hintText: "Password",
                              labelText: 'Password',
                              icon: Icon(Icons.keyboard_sharp),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              )
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),

                        ButtonTheme(
                          buttonColor: Colors.orange,
                          child: OutlineButton(
                            borderSide: BorderSide(color: Colors.black),
                            color: Colors.orange,
                            shape: StadiumBorder(),
                            onPressed: () async{

                              if(userID.text.trim().length == 0){

                                Fluttertoast.showToast(msg: 'Please fill in valid username');
                                
                              }

                              else if(passwordController.text.length<8){
                                 Fluttertoast.showToast(msg: 'Password should be minimum of 8 characters');
                              }

                              else{
                                 Navigator.pushReplacementNamed(context, '/blogList',arguments: userID.text);
                              }



                            },


                            child: Text(

                              "Continue",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        )


                      ],
                    ),

                  )
                ),
              )

            ],
          ),

        )
        );
  }
}
