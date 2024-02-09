import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/customer_screens/customer_orders.dart';
import 'package:multi_store_app/customer_screens/customer_wishlist.dart';
import 'package:multi_store_app/main_screens/cart.dart';
import 'package:multi_store_app/widgets/alertDialogBox.dart';
import 'package:multi_store_app/widgets/appBar_widgets.dart';
import 'package:multi_store_app/widgets/profile_widgets.dart';

class ProfileScreen extends StatefulWidget {
  final String documentId;

  const ProfileScreen({super.key, required this.documentId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('Customers');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: Stack(children: [
              Container(
                height: 230,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.teal, Colors.blueGrey],
                        begin: Alignment.topLeft)),
              ),
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    centerTitle: true,
                    pinned: true,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    expandedHeight: 140,
                    flexibleSpace:
                        LayoutBuilder(builder: (context, constraints) {
                      return FlexibleSpaceBar(
                        title: AnimatedOpacity(
                          opacity: constraints.biggest.height <= 120 ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            "Account",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: 'PlayfairDisplay'),
                          ),
                        ),
                        background: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.teal, Colors.blueGrey],
                                  begin: Alignment.topLeft)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              data['profileImageUrl'] == null
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          NetworkImage(data['profileImageUrl']),
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage('images/inapp/guest.jpg'),
                                    ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: data['name'] == null
                                    ? Text(
                                        data['name'].toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      )
                                    : Text(
                                        "Guest".toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SliverToBoxAdapter(
                      child: Column(children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular((50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            child: TextButton(
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    "Cart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen(
                                              backButton: AppBarBackButton(),
                                            )));
                              },
                            ),
                          ),
                          Container(
                            color: Colors.teal,
                            child: TextButton(
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    "Orders",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CustomerOrdersScreen()));
                              },
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: TextButton(
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    "Wishlist",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 21.5),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WishlistScreen()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100,
                            child: Image(
                              image: AssetImage('images/inapp/logo.jpg'),
                            ),
                          ),
                          ProfileHeaderLabel(headerLabel: 'Account Info.'),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ProfileRepeatedSubTile(
                                    title: 'Email Address',
                                    subTitle: data['email'] == ''
                                        ? "No email address entered"
                                        : data['email'],
                                    icon: Icons.mail,
                                  ),
                                  ProfileTileDivider(),
                                  ProfileRepeatedSubTile(
                                    title: 'Phone Number',
                                    subTitle: data['phone'] == ''
                                        ? "No phone number entered"
                                        : data['email'],
                                    icon: Icons.phone,
                                  ),
                                  ProfileTileDivider(),
                                  ProfileRepeatedSubTile(
                                    title: "Address",
                                    subTitle: data['address'] == ''
                                        ? "No  address entered"
                                        : data['address'],
                                    icon: Icons.location_city,
                                  )
                                ],
                              ),
                            ),
                          ),
                          ProfileHeaderLabel(
                            headerLabel: 'Account Settings',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ProfileRepeatedSubTile(
                                    title: 'Edit Profile',
                                    icon: Icons.edit,
                                    onPressed: () {},
                                  ),
                                  ProfileTileDivider(),
                                  ProfileRepeatedSubTile(
                                      title: "Change Password",
                                      icon: Icons.lock,
                                      onPressed: () {}),
                                  ProfileTileDivider(),
                                  ProfileRepeatedSubTile(
                                    title: "LogOut",
                                    icon: Icons.logout,
                                    onPressed: () {
                                      MyAlertDialogBox.showMyAlertDialog(
                                        context: context,
                                        title: "Logout",
                                        text: "Are you sure you want to logout",
                                        onPressingYes: () async {
                                          await FirebaseAuth.instance.signOut();
                                          Navigator.pop(context);
                                          Navigator.pushReplacementNamed(
                                              context, '/welcome_screen');
                                        },
                                        onPressingNo: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]))
                ],
              ),
            ]),
          );
        }

        return Center(
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        );
      },
    );
  }
}
