import 'package:flutter/material.dart';

class ComboDrinkMenu extends StatefulWidget {
  const ComboDrinkMenu({Key? key}) : super(key: key);

  @override
  State<ComboDrinkMenu> createState() => _ComboDrinkMenuState();
}

class _ComboDrinkMenuState extends State<ComboDrinkMenu> {
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
