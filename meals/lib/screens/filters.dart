import 'package:flutter/material.dart';
import 'package:meals/provider/filter_provider.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_Drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
        ),
        body: Column(
          children: [
            SwitchListTile(
                title: Text(
                  "Gluten-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only Gluten free meals will be served",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
                value: activeFilters[Filter.glutenFree]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
                }),
            SwitchListTile(
                title: Text(
                  "Vegan",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only Vegan meals will be served",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
                value: activeFilters[Filter.vegan]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
                }),
            SwitchListTile(
                title: Text(
                  "Lactose-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only Lactose free meals will be served",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
                value: activeFilters[Filter.lactoseFree]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
                }),
            SwitchListTile(
                title: Text(
                  "Vegetarian",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only Vegetarian meals will be served",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
                value: activeFilters[Filter.vegetarian]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
                }),
          ],
        ),
      );

  }
}
