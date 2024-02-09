import 'package:favourite_places/main.dart';
import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/provider/user_places.dart';
import 'package:favourite_places/screens/add_places.dart';
import 'package:favourite_places/screens/places_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListScreen extends ConsumerWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placesList = ref.watch(userPlacesProvider);
    Widget _mainContent = Center(
      child: Text(
        "No Items added yet....",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );

    if (placesList.isNotEmpty) {
      _mainContent = Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: placesList.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: FileImage(placesList[index].image),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) =>
                      PlaceDetailsScreen(place: placesList[index])));
            },
            title: Text(placesList[index].title),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => AddPlacesScreen()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: _mainContent,
    );
  }
}
