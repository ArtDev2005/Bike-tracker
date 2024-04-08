import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
          ),
        )
      ],
    );
  }
}
