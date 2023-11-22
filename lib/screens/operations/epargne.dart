import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/screens/operations/depot.dart';
import 'package:simplymoney_mtn/screens/operations/retrait_epargne.dart';
import 'package:simplymoney_mtn/widget/card.dart';

class Epargne extends StatefulWidget {
  const Epargne({super.key});

  @override
  State<Epargne> createState() => _EpargneState();
}

class _EpargneState extends State<Epargne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 224, 224),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 224, 224),
        centerTitle: true,
        title: const Text(
          "Épargne",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 200,
            width: double.infinity,
            child: Card(
              color: AppColors.BotColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Compte Épargne ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "0 F CFA",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ), 
                ],
              ),
            ),
          ),),
          Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      card(context, Colors.green, Icon(Icons.money), "Dépôt", Depot()),
                      card(context, Colors.yellow,Icon(Icons.money_off), "Retrait", Epargne_Retrait()),
                     ],
                    ),
                  ),
        ],
      ),
      floatingActionButton: ElevatedButton(onPressed: (){}, child: const Icon(Icons.volume_up)),
    );
  }
}