import 'package:e_commerce_app/screens/SignUp.dart';
import 'package:e_commerce_app/widgets/chooseAccount.dart';
import 'package:e_commerce_app/widgets/myButton.dart';
import 'package:e_commerce_app/widgets/myTextFormField.dart';
import 'package:e_commerce_app/widgets/passwordTextFormField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obscureText = true;

class _LoginState extends State<Login> {
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
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
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
                      MyButton(
                        text: "Login",
                        onPressed: () {
                          validation();
                        },
                      ),
                      ChooseAccount(
                        text: "I Have Not Account!",
                        urlText: "Sign Up",
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
