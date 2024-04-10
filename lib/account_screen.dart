import 'package:bike_tracker/resources/resources.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final double _icon_radius = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Профиль"),
        backgroundColor: Colors.blue,
      ),
      body: CustomMultiChildLayout(
        delegate: OwnMultiChildLayoutDelegate(),
        children: [
          LayoutId(
            id: 1,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(Images.forest, fit: BoxFit.cover,),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                )
              ],
            ),
          ),
          LayoutId(
            id: 2,
            child: CircleAvatar(
              backgroundImage: AssetImage(Images.userIcon),
              radius: _icon_radius,
            ),
          ),
          LayoutId(
            id: 3,
            child: Text(
              "Даниил Лазукин",
              style: Theme.of(context).textTheme.titleLarge
            )
          ),

        ],
      ),
    );
  }
}

class OwnMultiChildLayoutDelegate extends MultiChildLayoutDelegate{
  // Возвращает размеры CustomSingleChildLayout, принимает ограничения от родителя

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return super.getSize(constraints);
  }

  @override
  void performLayout(Size size) {
    layoutChild(1, BoxConstraints.loose(size));
    final icon_rad = layoutChild(2, BoxConstraints.loose(size)).width;
    final username_size = layoutChild(3, BoxConstraints.loose(size));
    positionChild(
      2,
      Offset(size.width / 2 - icon_rad / 2, size.height / 4 - icon_rad / 2)
    );
    positionChild(
        3,
        Offset(size.width / 2 - username_size.width / 2, size.height / 4 + icon_rad / 2 + 10)
    );

  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return true;
  }
}
