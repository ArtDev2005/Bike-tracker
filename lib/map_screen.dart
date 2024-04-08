import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'google_map.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MyAppState();
}

class _MyAppState extends State<MapScreen> {
  int _currentIndex = 0;

  void _toggle(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Map(),
        Positioned(
          bottom: 10,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black))
            ),
            child: Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.black,),
                SizedBox(width: 16,),
                Text(
                  "Начать запись маршрута",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            onPressed: (){},


          ),
        )
      ],
    );
  }
}

