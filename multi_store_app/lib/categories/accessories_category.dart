import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/category_widgets.dart';

import '../utilities/categ_list.dart';

class AccessoriesCategory extends StatelessWidget {
  const AccessoriesCategory({super.key});

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
                CategoryHeaderLabel(headerLabel: "Accessories"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 3,
                    children: List.generate(accessories.length-1, (index) {
                      return SubCategoryModel(
                        mainCategoryName: 'accessories',
                        subCategoryProductName: accessories[index+1],
                        assetName: 'images/accessories/accessories$index.jpg',
                        subCategoryLabel: accessories[index+1],
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
            child: SliderBar(mainCategoryName: "accessories",))
      ]),
    );
  }
}
