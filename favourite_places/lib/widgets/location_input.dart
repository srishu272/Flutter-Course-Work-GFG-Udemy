import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput_Widget extends StatefulWidget {
  const LocationInput_Widget({super.key});

  @override
  State<LocationInput_Widget> createState() => _LocationInput_WidgetState();
}

class _LocationInput_WidgetState extends State<LocationInput_Widget> {
  void _getCurrentLocation()async{
    Location location = new Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.5))),
            child: Text('No location selected', textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.location_on),
                    label: Text('Get current location')),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text('Select on map'))

          ],
        )
      ],
    );
  }
}
