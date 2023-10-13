import 'package:flutter/material.dart';

import '../pages/location_selection_page.dart';

class LocationSelectionWidget extends StatefulWidget {
  @override
  _LocationSelectionWidgetState createState() =>
      _LocationSelectionWidgetState();
}

class _LocationSelectionWidgetState extends State<LocationSelectionWidget> {
  Map<String, String> fromLocation = {};

  Map<String, String> toLocation = {};
  final List<Map<String, String>> staticLocations = [
    {
      'short': 'ADD',
      'city': 'Addis Ababa',
      'airport': 'Bole International Airport',
    },
    {
      'short': 'JFK',
      'city': 'New York',
      'airport': 'John F. Kennedy International Airport',
    },
    {
      'short': 'LAX',
      'city': 'Los Angeles',
      'airport': 'Los Angeles International Airport',
    },
    {
      'short': 'LHR',
      'city': 'London',
      'airport': 'Heathrow Airport',
    },
    {
      'short': 'CDG',
      'city': 'Paris',
      'airport': 'Charles de Gaulle Airport',
    },
    {
      'short': 'DXB',
      'city': 'Dubai',
      'airport': 'Dubai International Airport',
    },
    {
      'short': 'NRT',
      'city': 'Tokyo',
      'airport': 'Narita International Airport',
    },
    {
      'short': 'PEK',
      'city': 'Beijing',
      'airport': 'Beijing Capital International Airport',
    },
    {
      'short': 'SYD',
      'city': 'Sydney',
      'airport': 'Sydney Kingsford Smith Airport',
    },
    {
      'short': 'SIN',
      'city': 'Singapore',
      'airport': 'Changi Airport',
    },
  ];

  void swapLocations() {
    setState(() {
      final temp = fromLocation;
      fromLocation = toLocation;
      toLocation = temp;
    });
  }

  Future<void> _selectLocation(String field) async {
    final selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationSelectionPage(
          locations: staticLocations, // Pass your list of available locations
        ),
      ),
    );

    if (!selectedLocation.isEmpty) {
      setState(() {
        if (field == 'from') {
          fromLocation = selectedLocation;
        } else if (field == 'to') {
          toLocation = selectedLocation;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                Text("From",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    _selectLocation('from');
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: fromLocation.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Select Departing",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "${fromLocation['short']}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "${fromLocation['city']}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "${fromLocation['airport']}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: IconButton(
              icon: Icon(
                Icons.swap_horizontal_circle,
                color: Colors.white,
              ),
              onPressed: swapLocations,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("To",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    _selectLocation('to');
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: toLocation.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Select Destination",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "${toLocation['short']}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "${toLocation['city']}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "${toLocation['airport']}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
