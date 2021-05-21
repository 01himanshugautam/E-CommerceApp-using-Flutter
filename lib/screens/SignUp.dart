import 'package:e_commerce_app/screens/Login.dart';
import 'package:e_commerce_app/widgets/chooseAccount.dart';
import 'package:e_commerce_app/widgets/myButton.dart';
import 'package:e_commerce_app/widgets/myTextFormField.dart';
import 'package:e_commerce_app/widgets/passwordTextFormField.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obscureText = true;

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyTextFormField(
                        hintText: "UserName",
                        validation: (value) {
                          if (value == "") {
                            return "Please Fill UserName";
                          } else if (value!.length < 6) {
                            return "UserNAme Too Short";
                          }
                          return "";
                        },
                      ),
                      MyTextFormField(
                        hintText: "Email",
                        validation: (value) {
                          if (value == "") {
                            return "Please Fill Email";
                          } else if (!regExp.hasMatch(value.toString())) {
                            return "Email is invalid";
                          }
                          return "";
                        },
                      ),
                      PasswordTextFormField(
                        hintText: "Password",
                        obscureText: true,
                        validation: (value) {
                          if (value == "") {
                            return "Please Fill Password";
                          } else if (value!.length < 8) {
                            return "Password Is Too Short";
                          }
                          return "";
                        },
                      ),
                      MyTextFormField(
                        hintText: "Phone Number",
                        validation: (value) {
                          if (value == "") {
                            return "Please Fill Phone Number";
                          } else if (value!.length < 11) {
                            return "Phone Number Must Be 11";
                          }
                          return "";
                        },
                      ),
                      MyButton(
                        text: "Register",
                        onPressed: () {
                          validation();
                        },
                      ),
                      ChooseAccount(
                        text: "I Have Already An Account!",
                        urlText: "Login",
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
