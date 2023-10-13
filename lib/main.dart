import 'package:flutter/material.dart';
import 'package:guzogo/features/home_page/presentation/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plane Ticket Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isReturnSelected = true;

  void onToggleSelection(bool returnSelected) {
    // Handle the isReturnSelected value in your main widget
    setState(() {
      isReturnSelected = returnSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Color(0xFF071952),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.suitcase),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            // Return the content for each tab here
            // You can switch based on the index if you have different content for each tab.
            // For example:
            if (index == 0) {
              return SearchScreen();
            } else if (index == 1) {
              return Container();
              // return BookingScreen();
            } else if (index == 2) {
              return Container();
              // return NotificationsScreen();
            } else {
              return Container();
              // return SettingsScreen();
            }
          },
        );
      },
    );
  }
}
