import 'package:flutter/material.dart';

Widget card(BuildContext context, Color color, Widget icon, String title, Widget Context) {
  return Container(
    height: 160,
    width: 160,
    child: Card(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 60,
            onPressed :() {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Context)); 
            },
            icon: icon,
            ),
          Text(title, style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ],
      ),
    ),
  );
}