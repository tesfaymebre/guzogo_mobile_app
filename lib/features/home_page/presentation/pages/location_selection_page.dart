import 'package:flutter/material.dart';

class LocationSelectionPage extends StatelessWidget {
  final List<Map<String, String>> locations; // List of available locations

  LocationSelectionPage({required this.locations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Airport'),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              // Pass the selected location data back to the previous page
              Navigator.pop(context, locations[index]);
            },
            title: Text(
                "${locations[index]['city']}, ${locations[index]['airport']} (${locations[index]['short']})"),
          );
        },
      ),
    );
  }
}
