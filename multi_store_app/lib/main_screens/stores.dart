import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/main_screens/visitStore.dart';
import 'package:multi_store_app/widgets/appBar_widgets.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBarTitle(
          title: 'Stores',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('Suppliers').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 25,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VisitStore(
                                      supplierId: snapshot.data!.docs[index]
                                          ['supplier-ID'],
                                    )));
                      },
                      child: Column(
                        children: [
                          Stack(children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Image.asset('images/inapp/store.jpg'),
                            ),
                            Positioned(
                                bottom: 28,
                                left: 10,
                                child: SizedBox(
                                  height: 48,
                                  width: 100,
                                  child: Image.network(
                                    snapshot.data!.docs[index]['storeLogoUrl'],
                                    fit: BoxFit.cover,
                                  ),
                                ))
                          ]),
                          Text(
                            snapshot.data!.docs[index]['storename'],
                            style: TextStyle(
                                fontFamily: 'Protest_Riot', fontSize: 27),
                          )
                        ],
                      ),
                    );
                  });
            }
            return const Center(
              child: Text("No Stores Yet!!!!"),
            );
          },
        ),
      ),
    );
  }
}
