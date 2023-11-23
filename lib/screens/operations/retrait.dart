import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';

class Retrait extends StatefulWidget {
  const Retrait({super.key});

  @override
  State<Retrait> createState() => _RetraitState();
}

class _RetraitState extends State<Retrait> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.BackgroundColor,
          image: DecorationImage(
              image: const AssetImage("assets/images/mtn_momo.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  AppColors.BackgroundColor.withOpacity(0.1),
                  BlendMode.dstATop))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
        backgroundColor: AppColors.BackgroundColor,
        title: const Text("Retrait", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text("Confirmer le retrait", style: TextStyle(
                fontSize: 30
              ),),
            )
          ],
        ) ),),

    );
  }
}