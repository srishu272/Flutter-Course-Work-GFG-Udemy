import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Firebase_Read_Write extends StatefulWidget {
  const Firebase_Read_Write({super.key});

  @override
  State<Firebase_Read_Write> createState() => _Firebase_Read_WriteState();
}

class _Firebase_Read_WriteState extends State<Firebase_Read_Write> {
  TextEditingController _fname = new TextEditingController();
  TextEditingController _lname = new TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey();
  String name="";

  void onSubmit(String docName){
    FirebaseFirestore.instance
        .collection('User')
        .doc(docName).set({
      'firstName' : _fname.text,
      'lastName' : _lname.text
    });
    _fname.text = "";
    _lname.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NextPage()));
        },
        child: Icon(Icons.arrow_forward),
      ),
      appBar: AppBar(

        title: Text("Firebase Read & Write",style: TextStyle(fontFamily: 'BioRhyme'),),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)
            )
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _fname,
                  validator: (value) {
                    if(value!.isEmpty)
                      return "Enter First Name";
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: "Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.redAccent)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _lname,
                  validator: (value) {
                    if(value!.isEmpty)
                      return "Enter Last Name";
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: "Last Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.redAccent)
                      )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        onSubmit(_fname.text);
                      }
                    },
                    child: Text("Submit"),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Next Page",style: TextStyle(fontFamily: 'BioRhyme'),),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)
            )
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('User').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(doc['firstName']),
                        SizedBox(
                          width: 10,
                        ),
                        Text(doc['lastName']),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          );
        }
      ),
    );
  }
}

