import 'package:flutter/material.dart';

class ComboSideMenu extends StatefulWidget {
  const ComboSideMenu({Key? key}) : super(key: key);

  @override
  State<ComboSideMenu> createState() => _ComboSideMenuState();
}

class _ComboSideMenuState extends State<ComboSideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Choose a Drinks'),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
