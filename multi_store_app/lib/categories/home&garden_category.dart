import 'package:flutter/material.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/category_widgets.dart';

class Home_GardenCategory extends StatelessWidget {
  const Home_GardenCategory({super.key});

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
                CategoryHeaderLabel(headerLabel: "Home and Garden"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 3,
                    children: List.generate(homeandgarden.length-1, (index) {
                      return SubCategoryModel(
                        mainCategoryName: 'home and garden',
                        subCategoryProductName: homeandgarden[index+1],
                        assetName: 'images/homegarden/home$index.jpg',
                        subCategoryLabel: homeandgarden[index+1],
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
            child: SliderBar(mainCategoryName: "homegarden",))
      ]),
    );
  }
}
