import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/welcomeScreen_widgets.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

CollectionReference customers =
FirebaseFirestore.instance.collection('Customers');
late String customerID;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool processing = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/inapp/img_1.png'), fit: BoxFit.cover),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: TextAnimator(
                  "Sky",
                  style: TextStyle(fontSize: 35, color: Colors.white60),
                  atRestEffect: WidgetRestingEffects.wave(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.6,
                height: 130,
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Sell it..",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/supplier_login');
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black12)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/supplier_signup');
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black12)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.6,
              height: 130,
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Buy it..",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/customer_login');
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.black12)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/customer_signup');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.black12)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GoogleFacebookGuestLogin(
            label: 'Google',
            imageLocation: 'images/inapp/google.jpg',
            onPressed: () {},
          ),
          GoogleFacebookGuestLogin(
              label: "Facebook",
              imageLocation: 'images/inapp/facebook.jpg',
              onPressed: () {}),
          processing
              ? CircularProgressIndicator()
              : GoogleFacebookGuestLogin(
              label: "Guest",
              imageLocation: 'images/inapp/guest.jpg',
              onPressed: () async {
                setState(() {
                  processing = true;
                });
                await FirebaseAuth.instance.signInAnonymously().whenComplete(() async {
                  customerID = FirebaseAuth.instance.currentUser!.uid;
                  await customers.doc(customerID).set({
                    'name': '',
                    'email': '',
                    'password': '',
                    'profileImageUrl': '',
                    'phone': '',
                    'address': '',
                    'customer-ID': customerID
                  });
                });

                Navigator.pushReplacementNamed(
                    context, '/customer_home_screen');
              })
        ],
      ),
    );
  }
}
