import 'package:bike_tracker/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final double _icon_radius = 50;
  final empty_val = 0;

  @override
  Widget build(BuildContext context) {
    final contentAreaHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom
        + kToolbarHeight + kBottomNavigationBarHeight);
    return Scaffold(
      appBar: AppBar(
        title: Text("Профиль"),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: contentAreaHeight / 3,
                        color: Colors.red,
                        child: Image.asset(Images.forest, fit: BoxFit.cover,)
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: _icon_radius + 10,
                          left: 8,
                          right: 8
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Даниил Лазукин",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 24,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Mои маршруты:",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            SizedBox(height: 24,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index){
                                  return RouteCard();
                                },
                                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
                                itemCount: 100,
                              ),
                            ),
                            SizedBox(height: 24,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Избранные маршруты:",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            SizedBox(height: 24,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index){
                                  return RouteCard();
                                },
                                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
                                itemCount: 100,
                              ),
                            ),
                            SizedBox(height: 24,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Статистика:",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            SizedBox(height: 24,),
                            Row(
                              children: [
                                Icon(Icons.explore_outlined),
                                SizedBox(width: 4,),
                                Text("Пройденное расстояние: ${empty_val}"),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Icon(Icons.speed),
                                SizedBox(width: 4,),
                                Text("Средняя скорость: ${empty_val}"),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Icon(Icons.access_time),
                                SizedBox(width: 4,),
                                Text("Длительность: ${empty_val}"),
                              ],
                            ),
                            SizedBox(height: 24,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: contentAreaHeight / 3 - _icon_radius,
                  left: MediaQuery.of(context).size.width / 2 - _icon_radius,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(Images.userIcon),
                    radius: _icon_radius,
                  ),
                )
              ],
            )
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