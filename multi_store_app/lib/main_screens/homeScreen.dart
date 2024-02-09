import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/galleries/accessories_gallery.dart';
import 'package:multi_store_app/galleries/bags_gallery.dart';
import 'package:multi_store_app/galleries/beauty_gallery.dart';
import 'package:multi_store_app/galleries/electronics_gallery.dart';
import 'package:multi_store_app/galleries/homegarden_gallery.dart';
import 'package:multi_store_app/galleries/kids_gallery.dart';
import 'package:multi_store_app/galleries/men_gallery.dart';
import 'package:multi_store_app/galleries/shoes_gallery.dart';
import 'package:multi_store_app/galleries/women_gallery.dart';
import 'package:multi_store_app/minor_screens/searchScreen.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/fakeSearch.dart';
import 'package:multi_store_app/widgets/reapeatedTabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: maincateg.length-1,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: FakeSearch(),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              tabs: [
                RepeatedTab(tabName: maincateg[1].toUpperCase()),
                RepeatedTab(tabName: maincateg[2].toUpperCase()),
                RepeatedTab(tabName: maincateg[3].toUpperCase()),
                RepeatedTab(tabName: maincateg[4].toUpperCase()),
                RepeatedTab(tabName: maincateg[5].toUpperCase()),
                RepeatedTab(tabName: maincateg[6].toUpperCase()),
                RepeatedTab(tabName: maincateg[7].toUpperCase()),
                RepeatedTab(tabName: maincateg[8].toUpperCase()),
                RepeatedTab(tabName: maincateg[9].toUpperCase()),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MenGalleryScreen(),
              WomenGalleryScreen(),
              ElectronicsGalleryScreen(),
              AccessoriesGalleryScreen(),
              ShoesGalleryScreen(),
              Home_GardenGalleryScreen(),
              BeautyGalleryScreen(),
              KidsGalleryScreen(),
              BagsGalleryScreen(),
            ],
          ),
        ),
      ),
    );
  }
}




