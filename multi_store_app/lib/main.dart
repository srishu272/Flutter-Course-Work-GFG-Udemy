import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/auth/customer_login.dart';
import 'package:multi_store_app/auth/customer_signup.dart';
import 'package:multi_store_app/auth/supplier_signup.dart';
import 'package:multi_store_app/main_screens/customerHome.dart';
import 'package:multi_store_app/main_screens/supplierHome.dart';
import 'package:multi_store_app/main_screens/welcomeScreen.dart';

import 'auth/supplier_login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomeScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen' :(context) =>  WelcomeScreen(),
        '/customer_home_screen' :(context) =>  CustomerHomeScreen(),
        '/supplier_home_screen' :(context) =>  SupplierHomeScreen(),
        '/customer_signup' :(context) => CustomerRegister(),
        '/customer_login' :(context) => CustomerLogin(),
        '/supplier_signup' :(context) => SupplierRegister(),
        '/supplier_login' :(context) => SupplierLogin(),
      },
    );
  }
}
