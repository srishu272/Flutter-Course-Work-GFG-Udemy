import 'package:flutter/material.dart';
import 'package:meals/provider/favourites_provider.dart';
import 'package:meals/provider/meals_provider.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_Drawer.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';
import '../provider/filter_provider.dart';

class TabsScreesn extends ConsumerStatefulWidget {
  const TabsScreesn({super.key});

  @override
  ConsumerState<TabsScreesn> createState() => _TabsScreesnState();
}

const kInitialFilters = {
  Filter.glutenFree : false,
  Filter.lactoseFree: false,
  Filter.vegetarian : false,
  Filter.vegan : false
};
class _TabsScreesnState extends ConsumerState<TabsScreesn> {
  int _selectedPageIndex = 0;
  var activeScreenTitle = 'Categories';

  void _setStream(String identifier) async {
    Navigator.pop(context);
    if(identifier == 'filters'){
      await Navigator.push<Map<Filter, bool>>(context,
          MaterialPageRoute(builder: (ctx) =>
              FiltersScreen()));
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 1)
        activeScreenTitle = 'Favourites';
      else if (_selectedPageIndex == 0) activeScreenTitle = 'Categories';
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filteredMealsProvider);
    
    Widget activeScreen =
        CategoriesScreen(availableMeals: availableMeals,);
    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activeScreen = MealsScreen(
        meals: favouriteMeals,

      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setStream,),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_rounded), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up), label: 'Favourites')
        ],
      ),
    );
  }
}
