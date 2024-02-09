import 'package:flutter/material.dart';
import 'package:multi_store_app/main_screens/customerHome.dart';
import 'package:multi_store_app/widgets/appBar_widgets.dart';

class CartScreen extends StatefulWidget {
  final Widget? backButton;

  const CartScreen({super.key, this.backButton});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Widget mainContent = Text(
    "Your Cart is Empty",
    style: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.normal,
        fontSize: 30),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: widget.backButton,
        backgroundColor: Colors.white,
        title: AppBarTitle(
          title: 'Cart',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
            color: Colors.black,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mainContent,
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.canPop(context)
                    ? Navigator.pop(context)
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomerHomeScreen()));
              },
              child: Text(
                "Continue Shopping",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.teal)),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text(
                  "Total: Rs.",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "0.00",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Check out",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.yellow)),
            )
          ],
        ),
      ),
    );
  }
}
