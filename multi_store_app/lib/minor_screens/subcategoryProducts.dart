import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/appBar_widgets.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../widgets/productView_Model_widgets.dart';

class SubCategoryProducts extends StatefulWidget {
  const SubCategoryProducts(
      {super.key,
      required this.subCategoryProductName,
      required this.mainCategoryName});

  final String mainCategoryName;
  final String subCategoryProductName;

  @override
  State<SubCategoryProducts> createState() => _SubCategoryProductsState();
}

class _SubCategoryProductsState extends State<SubCategoryProducts> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance
        .collection('Products')
        .where('mainCategory', isEqualTo: widget.mainCategoryName)
        .where('subCategory', isEqualTo: widget.subCategoryProductName.toLowerCase())
        .snapshots();

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: widget.subCategoryProductName),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: AppBarBackButton(),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _productStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  " This category \n\n has no items yet...!!!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, color: Colors.teal),
                ),
              );
            }

            return SingleChildScrollView(
              child: StaggeredGridView.countBuilder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ProductViewTile(
                      products: snapshot.data!.docs[index],
                    );
                  },
                  staggeredTileBuilder: (context) =>
                      const StaggeredTile.fit(1)),
            );
          },
        ));
  }
}
