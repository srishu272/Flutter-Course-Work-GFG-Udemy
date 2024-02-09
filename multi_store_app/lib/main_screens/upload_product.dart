import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/snackBar_widget.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({super.key});

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final _uploadProductFormKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  late double price;
  late int quantity;
  late String productName;
  late String productDescription;
  late String productID;
  String mainCategValue = 'select category';
  String subCategValue = 'subcategory';
  late List<String> subCategList = [];
  bool processing = false;

  List<XFile> imagesFileList = [];
  List<String> imagesUrlList = [];
  dynamic _pickedImageError;

  void _pickProductImages() async {
    try {
      final pickedImages = await ImagePicker()
          .pickMultiImage(maxWidth: 300, maxHeight: 300, imageQuality: 95);
      setState(() {
        imagesFileList = pickedImages;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
    }
  }

  Widget previewImages() {
    if (imagesFileList.isNotEmpty) {
      return ListView.builder(
          itemCount: imagesFileList.length,
          itemBuilder: (context, index) {
            return Image.file(File(imagesFileList[index].path));
          });
    } else {
      return const Center(
        child: Text(
          "You have not picked images yet!!!",
          style: TextStyle(color: Colors.black),
        ),
      );
    }
  }

  void selectingCategory(String? value) {
    if (value == 'select category') {
      subCategList = [];
    } else if (value == 'men') {
      subCategList = menCateg;
    } else if (value == 'women') {
      subCategList = women;
    } else if (value == 'electronics') {
      subCategList = electronics;
    } else if (value == 'accessories') {
      subCategList = accessories;
    } else if (value == 'shoes') {
      subCategList = shoes;
    } else if (value == 'home & garden') {
      subCategList = homeandgarden;
    } else if (value == 'beauty') {
      subCategList = beauty;
    } else if (value == 'kids') {
      subCategList = kids;
    } else if (value == 'bags') {
      subCategList = bags;
    }
    setState(() {
      mainCategValue = value!;
      subCategValue = 'subcategory';
    });
  }

  Future<void> uploadImages() async {
    if (mainCategValue != 'select category' && subCategValue != 'subcategory') {
      if (_uploadProductFormKey.currentState!.validate()) {
        _uploadProductFormKey.currentState!.save();
        if (imagesFileList.isNotEmpty) {
          setState(() {
            processing = true;
          });
          try {
            for (var image in imagesFileList) {
              for (var image in imagesFileList) {
                firebase_storage.Reference ref = firebase_storage
                    .FirebaseStorage.instance
                    .ref('products/${path.basename(image.path)}');

                await ref.putFile(File(image.path)).whenComplete(() async {
                  await ref.getDownloadURL().then((value) {
                    imagesUrlList.add(value);
                  });
                });
              }
            }
          } catch (e) {
            ScaffoldMsgHandler.showSnackBar(_scaffoldKey, "$e", Colors.red);
            setState(() {
              processing = false;
            });
          }
          ScaffoldMsgHandler.showSnackBar(
              _scaffoldKey, "Product Uploaded", Colors.green);
          setState(() {
            processing = false;
          });
          _uploadProductFormKey.currentState!.reset();
        } else {
          ScaffoldMsgHandler.showSnackBar(
              _scaffoldKey, "Select product images...", Colors.red);
          setState(() {
            processing = false;
          });
        }
      } else {
        ScaffoldMsgHandler.showSnackBar(
            _scaffoldKey, "Please enter all the details", Colors.red);
        setState(() {
          processing = false;
        });
      }
    } else {
      ScaffoldMsgHandler.showSnackBar(
          _scaffoldKey, "Please select categories...", Colors.red);
      setState(() {
        processing = false;
      });
    }
  }

  Future<void> uploadData() async {
    if (imagesUrlList.isNotEmpty) {
      CollectionReference productref =
          FirebaseFirestore.instance.collection('Products');

      productID = const Uuid().v4();

      await productref.doc(productID).set({
        'productID': productID,
        'mainCategory': mainCategValue,
        'subCategory': subCategValue,
        'price': price,
        'instock Quantity': quantity,
        'product Name': productName,
        'product Description': productDescription,
        'supplier-ID': FirebaseAuth.instance.currentUser!.uid,
        'productImages': imagesUrlList,
        'discount': 0,
      }).whenComplete(() {
        setState(() {
          processing = false;
          imagesFileList = [];
          imagesUrlList = [];
          mainCategValue = 'select category';
          subCategList = [];
        });
      });
    } else {}
  }

  Future<void> uploadProduct() async {
    await uploadImages().whenComplete(() => uploadData());
    setState(() {
      imagesUrlList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                    onPressed: imagesFileList.isEmpty
                        ? () {
                            _pickProductImages();
                          }
                        : () {
                            setState(() {
                              imagesFileList = [];
                            });
                          },
                    backgroundColor: Colors.teal,
                    child: imagesFileList.isEmpty
                        ? Icon(
                            Icons.photo_library_outlined,
                            color: Colors.blueGrey.shade50,
                          )
                        : Icon(
                            Icons.delete_forever,
                            color: Colors.blueGrey.shade50,
                          )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: processing
                      ? null
                      : () {
                          uploadProduct();
                        },
                  backgroundColor: Colors.teal,
                  child: processing
                      ? CircularProgressIndicator(
                          color: Colors.blueGrey.shade50,
                        )
                      : Icon(
                          Icons.upload,
                          color: Colors.blueGrey.shade50,
                        ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            reverse: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _uploadProductFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          color: Colors.blueGrey.shade200,
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: imagesFileList.isNotEmpty
                                ? previewImages()
                                : const Center(
                                    child: Text(
                                      "You have not picked images yet!!!",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Select main category",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade900),
                                ),
                                DropdownButton(
                                    iconSize: 40,
                                    iconEnabledColor: Colors.blueGrey.shade900,
                                    dropdownColor: Colors.teal,
                                    value: mainCategValue,
                                    menuMaxHeight: 300,
                                    items: maincateg
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value,
                                            style: TextStyle(
                                                color:
                                                    Colors.blueGrey.shade900)),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      selectingCategory(value);
                                    }),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Select sub category",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade900),
                                ),
                                DropdownButton(
                                  iconSize: 40,
                                  iconEnabledColor: Colors.blueGrey.shade900,
                                  dropdownColor: Colors.teal,
                                  menuMaxHeight: 300,
                                  disabledHint: const Text("select category"),
                                  value: subCategValue,
                                  items: subCategList
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value,
                                          style: TextStyle(
                                              color: Colors.blueGrey.shade900)),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      subCategValue = value!;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                    child: Divider(
                      color: Colors.teal,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the price of the product";
                            } else if (value.isValidPrice() != true) {
                              return "Enter valid price";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            price = double.parse(value!);
                          },
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: textFormFieldDecoreation.copyWith(
                              label: const Text("Price"), hintText: "Price")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the quantity of the product";
                            } else if (value.isValidQuantity() != true)
                              return "Enter valid quantity";
                            return null;
                          },
                          onSaved: (value) {
                            quantity = int.parse(value!);
                          },
                          keyboardType: TextInputType.number,
                          decoration: textFormFieldDecoreation.copyWith(
                              label: const Text("Quantity"),
                              hintText: "Add Quantity")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                        maxLength: 100,
                        maxLines: 3,
                        validator: (value) {
                          if (value!.isEmpty)
                            return "Please enter the product name";

                          return null;
                        },
                        onSaved: (value) {
                          productName = value!;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: textFormFieldDecoreation.copyWith(
                            label: const Text("Product Name"),
                            hintText: "Enter Product Name")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                        maxLength: 800,
                        maxLines: 5,
                        validator: (value) {
                          if (value!.isEmpty)
                            return "Please enter the product description";

                          return null;
                        },
                        onSaved: (value) {
                          productDescription = value!;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: textFormFieldDecoreation.copyWith(
                            label: const Text("Product Description"),
                            hintText: "Enter Product Description")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

var textFormFieldDecoreation = InputDecoration(
    label: const Text("Price"),
    hintText: "Price",
    labelStyle: const TextStyle(color: Colors.blueGrey),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.teal, width: 3)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.teal, width: 3)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.teal, width: 3)));

extension QuantityValidator on String {
  bool isValidQuantity() {
    return RegExp(r'^[1-9][0-9]*$').hasMatch(this);
  }
}

extension PriceValidator on String {
  bool isValidPrice() {
    return RegExp(r'^((([1-9][0-9]*[\.]*)||([0][\.]))([0-9]{1,2}))$')
        .hasMatch(this);
  }
}
