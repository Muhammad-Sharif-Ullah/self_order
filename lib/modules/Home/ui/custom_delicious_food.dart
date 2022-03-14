import 'package:flutter/material.dart';

Widget customDeliciousFood ()
{
  return  Padding(
    padding: EdgeInsets.only(left: 37),
    child: SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 50),
            child: Column(
              children: [
                Image(image: AssetImage("assets/images/smallBurger.png"),height: 56,width: 76,),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                    child: Text('Burger',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
                  ),
                )

              ],
            ),
          );
        },
      ),
    ),
  );


}


