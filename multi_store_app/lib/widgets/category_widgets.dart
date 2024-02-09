import 'package:flutter/material.dart';
import 'package:multi_store_app/minor_screens/subcategoryProducts.dart';

class SliderBar extends StatelessWidget {
  final String mainCategoryName;

  const SliderBar({
    super.key,
    required this.mainCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.brown.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30)),
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mainCategoryName == "bags"
                    ? Text(" ")
                    : Text(
                        "<<",
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 12),
                      ),
                Text(
                  mainCategoryName.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 12),
                ),
                mainCategoryName == "men"
                    ? Text(" ")
                    : Text(
                        ">>",
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 12),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategoryModel extends StatelessWidget {
  final String mainCategoryName;
  final String subCategoryProductName;
  final String assetName;
  final String subCategoryLabel;

  const SubCategoryModel({
    super.key,
    required this.mainCategoryName,
    required this.subCategoryProductName,
    required this.assetName,
    required this.subCategoryLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategoryProducts(
                      subCategoryProductName:
                          '${subCategoryProductName.toUpperCase()}',
                      mainCategoryName: mainCategoryName,
                    )));
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage(assetName),
            ),
          ),
          Text(
            subCategoryLabel.toUpperCase(),
            style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CategoryHeaderLabel extends StatelessWidget {
  const CategoryHeaderLabel({
    super.key,
    required this.headerLabel,
  });

  final String headerLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Text(
        headerLabel,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            letterSpacing: 1.6,
            fontFamily: 'PlayfairDisplay'),
      ),
    );
  }
}
