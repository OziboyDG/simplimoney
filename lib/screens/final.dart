import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color.fromARGB(255, 230, 224, 224),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/merci.jpg"))
          ),
         )
       ],
     ), );
  }
}