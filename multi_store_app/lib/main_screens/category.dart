import 'package:flutter/material.dart';
import 'package:multi_store_app/categories/accessories_category.dart';
import 'package:multi_store_app/categories/bags_category.dart';
import 'package:multi_store_app/categories/beauty_category.dart';
import 'package:multi_store_app/categories/electronics_category.dart';
import 'package:multi_store_app/categories/home&garden_category.dart';
import 'package:multi_store_app/categories/kids_category.dart';
import 'package:multi_store_app/categories/men_category.dart';
import 'package:multi_store_app/categories/shoes_category.dart';
import 'package:multi_store_app/categories/women_category.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/fakeSearch.dart';

List<ItemData> categoryItems = [
  ItemData(label: maincateg[0]),
  ItemData(label: maincateg[1]),
  ItemData(label: maincateg[2]),
  ItemData(label: maincateg[3]),
  ItemData(label: maincateg[4]),
  ItemData(label: maincateg[5]),
  ItemData(label: maincateg[6]),
  ItemData(label: maincateg[7]),
  ItemData(label: maincateg[8]),
  ItemData(label: maincateg[9]),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    for (var element in categoryItems) {
      element.isSelected = false;
    }
    setState(() {
      categoryItems[0].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: SideNavigator()),
          Positioned(bottom: 0, right: 0, child: CategoryView())
        ],
      ),
    );
  }

  Widget SideNavigator() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.2,
      child: ListView.builder(
          itemCount: maincateg.length-1,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              child: Container(
                  height: MediaQuery.of(context).size.height / maincateg.length-1,
                  color: categoryItems[index].isSelected == true
                      ? Colors.white
                      : Colors.grey.shade400,
                  child: Center(
                    child: Text(
                      categoryItems[index+1].label.toUpperCase(),
                    ),
                  )),
            );
          }),
    );
  }

  Widget CategoryView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          for (var element in categoryItems) {
            element.isSelected = false;
          }
          setState(() {
            categoryItems[value].isSelected = true;
          });
        },
        children: const [
          MenCategory(),
          WomenCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          ShoesCategory(),
          Home_GardenCategory(),
          BeautyCategory(),
          KidsCategory(),
          BagsCategory()
        ],
      ),
    );
  }
}

class ItemData {
  String label;
  bool isSelected;

  ItemData({required this.label, this.isSelected = false});
}
