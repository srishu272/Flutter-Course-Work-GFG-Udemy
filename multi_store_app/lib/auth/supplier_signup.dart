import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_store_app/widgets/auth_widgets.dart';
import 'package:multi_store_app/widgets/snackBar_widget.dart';

class SupplierRegister extends StatefulWidget {
  const SupplierRegister({super.key});

  @override
  State<SupplierRegister> createState() => _CustomerRegisterState();
}

var textFormFieldDecoration = InputDecoration(
    label: Text('Store Name'),
    hintText: "Enter Your Store Name",
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.teal, width: 3)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.teal, width: 3)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.teal, width: 3)));

class _CustomerRegisterState extends State<SupplierRegister> {
  late String storeName;
  late String email;
  late String password;
  late String storeLogoUrl;
  late String customerID = FirebaseAuth.instance.currentUser!.uid;
  var passwordVisible = false;
  bool processing = false;
  final _signupFormKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  XFile? _imageFile;
  dynamic _pickedImageError;

  CollectionReference suppliers =
      FirebaseFirestore.instance.collection('Suppliers');

  void _pickImageFromCamera() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.camera,
          maxWidth: 300,
          maxHeight: 300,
          imageQuality: 95);

      setState(() {
        _imageFile = pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
    }
  }

  void _pickImageFromGallery() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxWidth: 300,
          maxHeight: 300,
          imageQuality: 95);

      setState(() {
        _imageFile = pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
    }
  }

  void signUp() async {
    setState(() {
      processing = true;
    });
    if (_signupFormKey.currentState!.validate()) {
      if (_imageFile == null) {
        ScaffoldMsgHandler.showSnackBar(
          _scaffoldKey,
          "Please pick an image",
          Colors.red,
        );
        setState(() {
          processing = false;
        });
      } else {
        _signupFormKey.currentState!.save();
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance
              .ref('supplierImages/$email.jpg');
          await ref.putFile(File(_imageFile!.path));
          storeLogoUrl = await ref.getDownloadURL();

          suppliers.doc(customerID).set({
            'storename': storeName,
            'email': email,
            'password': password,
            'storeLogoUrl': storeLogoUrl,
            'phone': '',
            'supplier-ID': customerID,
            'coverImageUrl': '',
          }).then((value) {
            ScaffoldMsgHandler.showSnackBar(
                _scaffoldKey, "$storeName is registered", Colors.green);
            _signupFormKey.currentState!.reset();
            setState(() {
              _imageFile = null;
            });
            Navigator.pushReplacementNamed(context, '/supplier_login');
          });
        } on FirebaseAuthException catch (e) {
          setState(() {
            processing = false;
          });
          ScaffoldMsgHandler.showSnackBar(
              _scaffoldKey, "${e.message}", Colors.red,
              duration: 5);
        }
      }
    } else {
      setState(() {
        processing = false;
      });
      ScaffoldMsgHandler.showSnackBar(
          _scaffoldKey, "Please fill all the details correctly", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _signupFormKey,
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
                        label: 'Sign up',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.teal.shade300,
                              backgroundImage: _imageFile == null
                                  ? null
                                  : FileImage(File(_imageFile!.path)),
                              radius: 60,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 47,
                                  width: 47,
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  child: IconButton(
                                    onPressed: () {
                                      _pickImageFromCamera();
                                    },
                                    icon: Icon(Icons.camera),
                                    style: ButtonStyle(
                                        iconColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.white60)),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  height: 47,
                                  width: 47,
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(13),
                                          bottomRight: Radius.circular(13))),
                                  child: IconButton(
                                    onPressed: () {
                                      _pickImageFromGallery();
                                    },
                                    icon: Icon(Icons.photo),
                                    style: ButtonStyle(
                                        iconColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.white60)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your store name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            storeName = value!;
                          },
                          decoration: textFormFieldDecoration,
                        ),
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                      HaveAccount(
                        haveAccount: 'Log in',
                        actionText: 'already have an account',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/supplier_login');
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
                              buttonText: 'Sign up',
                              onPressed: () {
                                signUp();
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
