import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:multi_store_app/minor_screens/image_fullscreenView.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../widgets/productView_Model_widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic productList;

  const ProductDetailsScreen({super.key, required this.productList});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance
      .collection('Products')
      .where('mainCategory', isEqualTo: widget.productList['mainCategory'])
      .where('subCategory', isEqualTo: widget.productList['subCategory'])
      .snapshots();
  late List<dynamic> imagesUrlList = widget.productList['productImages'];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageFullScreenView(imagesUrlList: imagesUrlList,)));
                    },
                    child: Stack(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Swiper(
                            pagination: const SwiperPagination(
                                builder: SwiperPagination.fraction),
                            itemBuilder: (context, index) {
                              return Image(
                                image: NetworkImage(imagesUrlList[index]),
                              );
                            },
                            itemCount: imagesUrlList.length),
                      ),
                      Positioned(
                          left: 15,
                          top: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.blueGrey.shade100,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )),
                      Positioned(
                          right: 15,
                          top: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: IconButton(
                              icon: Icon(
                                Icons.share,
                                color: Colors.blueGrey.shade100,
                              ),
                              onPressed: () {},
                            ),
                          ))
                    ]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productList['product Name'],
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Rs. ",
                                style: TextStyle(
                                    color: Colors.teal.shade700,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.productList['price'].toString(),
                                style: TextStyle(
                                    color: Colors.teal.shade700,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_outlined),
                            color: Colors.teal.shade900,
                          )
                        ],
                      ),
                      Text(
                        "${widget.productList['instock Quantity']} pieces are available in stock",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const ProductDetailsHeader(
                        headerLabel: '   Product Description    ',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.productList['product Description'],
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const ProductDetailsHeader(
                          headerLabel: '     Similar Products    '),
                      SizedBox(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: _productStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                  style: TextStyle(
                                      fontSize: 26, color: Colors.teal),
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
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.store)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.shopping_cart))
                  ],
                ),
                SizedBox(
                  height: 30,
                  width: 170,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.teal)),
                    onPressed: () {},
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.blueGrey.shade100),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailsHeader extends StatelessWidget {
  final String headerLabel;

  const ProductDetailsHeader({
    super.key,
    required this.headerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.teal.shade900,
              thickness: 1,
            ),
          ),
          Text(
            "$headerLabel",
            style: TextStyle(
                color: Colors.teal.shade900,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.teal.shade900,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
