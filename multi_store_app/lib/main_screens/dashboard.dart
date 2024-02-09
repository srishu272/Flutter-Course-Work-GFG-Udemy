import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/dashboard_screen/editProfile.dart';
import 'package:multi_store_app/dashboard_screen/manageProducts.dart';
import 'package:multi_store_app/dashboard_screen/myStore.dart';
import 'package:multi_store_app/dashboard_screen/suppliers_orders.dart';
import 'package:multi_store_app/dashboard_screen/supplier_balance.dart';
import 'package:multi_store_app/dashboard_screen/supplier_statics.dart';
import 'package:multi_store_app/widgets/alertDialogBox.dart';
import 'package:multi_store_app/widgets/appBar_widgets.dart';

List<String> cardLabels = [
  'My Store',
  'Orders',
  'Edit Profile',
  'Manage Products',
  'Balance',
  'Statics'
];

List<IconData> cardIcons = [
  Icons.store,
  Icons.shop,
  Icons.edit,
  Icons.settings,
  Icons.money,
  Icons.auto_graph
];

List<Widget> cardWidgets = [
  MyStoreScreen(),
  OrdersScreen(),
  EditProfileScreen(),
  ManageProductsScreen(),
  SupplierBalanceScreen(),
  SupplierStaticsScreen()
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: "Dashboard"),
        actions: [
          IconButton(
            onPressed: () {
              MyAlertDialogBox.showMyAlertDialog(
                context: context,
                title: "Logout",
                text: "Are you sure you want to logout",
                onPressingYes: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/welcome_screen');
                },
                onPressingNo: () {
                  Navigator.pop(context);
                },
              );
            },
            icon: const Icon(Icons.logout),
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          children: List.generate(6, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cardWidgets[index]));
              },
              child: Card(
                elevation: 10,
                shadowColor: Colors.blueGrey,
                color: Colors.teal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      cardIcons[index],
                      color: Colors.blueGrey.shade50,
                      size: 50,
                    ),
                    Center(
                      child: Text(
                        cardLabels[index],
                        style: TextStyle(fontSize: 20, color: Colors.white60),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
