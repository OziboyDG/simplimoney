import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/consts/const.dart';
import 'package:simplymoney_mtn/screens/authentification/empreinte.dart';
import 'package:simplymoney_mtn/screens/final.dart';
import 'package:simplymoney_mtn/screens/welcome.dart';

class Retrait extends StatefulWidget {
  const Retrait({super.key});

  @override
  State<Retrait> createState() => _RetraitState();
}

class _RetraitState extends State<Retrait> {
  @override
  void initState() {
    super.initState();
    player.stop();
    player.setAsset('assets/audios/Phrase_11.mp3');
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repeat(),
      builder: (context, snapshot) => Container(
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
            title: const Text(
              "Retrait",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          const Center(
            child: Text(
              "Confirmer le retrait",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Text(
              "Votre retrait en attente.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(195, 4, 25, 163)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            color: Colors.white54,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 200,
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    "Vous avez lancer un retrait de :",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("2100 F CFA",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(195, 4, 25, 163),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EmpreinteDigitale(number: number!, nextPage: const FinalPage()),)),
                        child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green,
                          ),
                          child: const Center(
                              child: Text(
                            "Confirmer",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          player.stop();
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red,
                          ),
                          child: const Center(
                              child: Text(
                            "Annuler",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
            ],
          ),
          floatingActionButton: ElevatedButton(
              onPressed: () {
                player.stop();
                player.setAsset('assets/audios/Phrase_11.mp3');
                player.play();
              },
              child: const Icon(Icons.volume_up)),
        ),
      ),
    );
  }
}