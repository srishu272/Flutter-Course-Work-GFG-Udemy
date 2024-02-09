import 'package:flutter/material.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/category_widgets.dart';

class ShoesCategory extends StatelessWidget {
  const ShoesCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              children: [
                CategoryHeaderLabel(headerLabel: "Shoes"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 3,
                    children: List.generate(shoes.length - 1, (index) {
                      return SubCategoryModel(
                        mainCategoryName: 'shoes',
                        subCategoryProductName: shoes[index + 1],
                        assetName: 'images/shoes/shoes$index.jpg',
                        subCategoryLabel: shoes[index + 1],
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(
              mainCategoryName: "shoes",
            ))
      ]),
    );
  }
}
