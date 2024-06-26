import 'package:bike_tracker/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Маршруты"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                labelStyle: TextStyle(color: Colors.black),
                labelText: "Поиск маршрутов",
                prefixIcon: Icon(Icons.search, color: Colors.black,)
              )
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index){
                    return RouteCard();
                  },
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
                  itemCount: 100
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class RouteCard extends StatefulWidget {
  const RouteCard({super.key});

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),

      width: 300,
      height: 150,
      child: Column(
        children: [
          Container(color: Colors.grey, height: 100,),
          Container(
            color: Colors.blueAccent,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(Images.userIcon),
                  ),
                  SizedBox(width: 16,),
                  FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Средняя скорость: 30 км./ч."),
                        Text("Проиденное расстояние: 64 км."),
                        Row(
                          children: [
                            Icon(Icons.location_on_sharp),
                            Text("г. Череповец, Вологодская область, Россия")
                          ],

                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
