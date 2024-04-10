import 'package:bike_tracker/account_screen.dart';
import 'package:bike_tracker/map_screen.dart';
import 'package:bike_tracker/routes_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  List<Widget> _screens = [MapScreen(), RoutesScreen(), AccountScreen()];

  void _toggle(int index) {
    setState(() {
      if (_currentIndex != index){
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: "Карта"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.route),
                label: "Маршруты"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "Аккаунт"
            )
          ],
          currentIndex: _currentIndex,
          onTap: _toggle,
        ),
        body: _screens[_currentIndex],
      ),
      routes: {
        "/map": (context) => MapScreen(),
        "/routes": (context) => RoutesScreen()
      },
    );
  }
}
