import 'package:flutter/material.dart';

import '../widgets/custom_table_widget.dart';
import '../widgets/date_selection_widget.dart';
import '../widgets/location_selection_widget.dart';
import '../widgets/toggle_button_group_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isReturnSelected = true;

  void onToggleSelection(bool returnSelected) {
    // Handle the isReturnSelected value in your main widget
    setState(() {
      isReturnSelected = returnSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.44,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/plane3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Color(0xFF071952).withOpacity(0.9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 100),
                        Image.asset(
                          'assets/guzo.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(width: 80),
                        InkWell(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    ToggleButtonGroup(
                      onToggleSelection: onToggleSelection,
                    ),
                    LocationSelectionWidget(),
                  ],
                ),
              ),
            ),
            DateSelectionWidget(
              isReturnSelected: isReturnSelected,
            ),
            CustomTableWidget(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFF1C933),
                  foregroundColor: Color.fromARGB(255, 68, 67, 67),
                  padding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: MediaQuery.of(context).size.width * 0.22),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text('Search Flights'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
