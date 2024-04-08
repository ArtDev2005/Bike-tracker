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
    return Padding(
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
                          color: Colors.red,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                SizedBox(
                                    child: Placeholder(),
                                  width: 30,
                                  height: 30,
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
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
                itemCount: 100
            ),
          ),
        ],
      ),
    );
  }
}
