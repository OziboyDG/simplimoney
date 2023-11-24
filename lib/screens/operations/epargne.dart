import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/consts/const.dart';
import 'package:simplymoney_mtn/screens/operations/depot.dart';
import 'package:simplymoney_mtn/screens/operations/retrait_epargne.dart';
import 'package:simplymoney_mtn/widget/card.dart';

class Epargne extends StatefulWidget {
  const Epargne({super.key});

  @override
  State<Epargne> createState() => _EpargneState();
}

class _EpargneState extends State<Epargne> {
  int? thriftAmount;
  Future<void> fetchData() async {
    // Simulated asynchronous operation
    await Future.delayed(Duration(milliseconds: 100));
    SharedPreferences pref = await SharedPreferences.getInstance();
    thriftAmount = pref.getInt("thriftAmount") ?? 0;
  }

  @override
  void initState() {
    player.stop();
    player.setAsset('assets/audios/Phrase_14.mp3');
    player.play();
    fetchData().then((data) {
      // Once the data is fetched, update the state or perform necessary operations
      setState(() {
        // Update state variables or perform operations with the fetched data
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repeat(),
      builder: (context, snapshot) =>  Scaffold(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
                        "$thriftAmount F CFA",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  card(
                      context, Colors.green, Icon(Icons.money), "Dépôt", Depot()),
                  card(context, Colors.yellow, Icon(Icons.money_off), "Retrait",
                      Epargne_Retrait()),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
            onPressed: () {
              player.stop();
              player.setAsset('assets/audios/Phrase_14.mp3');
              player.play();
            },
            child: const Icon(Icons.volume_up)),
      ),
    );
  }
}
