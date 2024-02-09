import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/auth_widgets.dart';
import 'package:multi_store_app/widgets/snackBar_widget.dart';

class CustomerLogin extends StatefulWidget {
  const CustomerLogin({super.key});

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

var textFormFieldDecoration = InputDecoration(
    label: Text('Full Name'),
    hintText: "Enter Your Name",
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.teal, width: 3)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.teal, width: 3)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.teal, width: 3)));

class _CustomerLoginState extends State<CustomerLogin> {
  late String email;
  late String password;
  var passwordVisible = false;
  bool processing = false;
  final _loginFormKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  void login() async {
    setState(() {
      processing = true;
    });

    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState?.save();
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password).then((
            value) {
          _loginFormKey.currentState?.reset();
          Navigator.pushReplacementNamed(context, '/customer_home_screen');
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          processing = false;
        });
        ScaffoldMsgHandler.showSnackBar(_scaffoldKey, e.message!, Colors.red);
      }
    } else {
      setState(() {
        processing = false;
      });
      ScaffoldMsgHandler.showSnackBar(
          _scaffoldKey, "Enter valid details", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _loginFormKey,
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                reverse: true,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      AuthHeaderLabel(
                        label: 'Login',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your email address';
                            } else if (!value.isValidEmail()) {
                              return "Enter valid email address";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: textFormFieldDecoration.copyWith(
                            label: const Text('Email Address'),
                            hintText: "Enter Your Email Address",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                          obscureText: !passwordVisible,
                          decoration: textFormFieldDecoration.copyWith(
                            label: Text('Password'),
                            hintText: "Enter Your Password",
                            suffixIcon: IconButton(
                              icon: passwordVisible
                                  ? Icon(
                                Icons.visibility,
                                color: Colors.teal,
                              )
                                  : Icon(
                                Icons.visibility_off,
                                color: Colors.teal,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            )),
                      ),
                      HaveAccount(
                        haveAccount: 'Sign up',
                        actionText: "Don't have an account?",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/customer_signup');
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      processing
                          ? CircularProgressIndicator(
                        color: Colors.teal,
                      )
                          : AuthButton(
                        buttonText: 'Login',
                        onPressed: () {
                          login();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
