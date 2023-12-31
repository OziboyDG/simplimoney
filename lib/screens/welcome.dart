import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/consts/const.dart';
import 'package:simplymoney_mtn/screens/operations/epargne.dart';
import 'package:simplymoney_mtn/screens/operations/retrait.dart';
import 'package:simplymoney_mtn/screens/operations/transfert.dart';
import 'package:simplymoney_mtn/widget/card.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int? availableAmount;
  // static String number = '';
  // Future getData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   number = pref.getString('NUMBER') ?? 'loading...';
  // }

  Future<void> fetchData() async {
    // Simulated asynchronous operation
    await Future.delayed(const Duration(milliseconds: 100));
    SharedPreferences pref = await SharedPreferences.getInstance();
    availableAmount = pref.getInt("availableAmount") ?? 0;
  }

  @override
  void initState() {
    super.initState();
    player.stop();
    player.setAsset("assets/audios/Phrase_567.mp3");
    player.play();
    // final player1 = AudioPlayer();
    // final player2 = AudioPlayer();

    fetchData().then((data) {
      // Once the data is fetched, update the state or perform necessary operations
      setState(() {
        // Update state variables or perform operations with the fetched data
      });
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repeat(),
      builder: (context, snapshot) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: const Text(
            "Accueil",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.notifications_none,
              ),
            )
          ],
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Card(
                color: const Color.fromARGB(142, 1, 27, 176),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      number ?? "Chargement...",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "$availableAmount F CFA",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "Solde du compte",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    card(
                        context,
                        AppColors.BackgroundColor,
                        const Icon(Icons.compare_arrows_outlined),
                        "Transfère",
                        const Transfert()),
                    card(
                        context,
                        Colors.red,
                        const Icon(Icons.add_to_home_screen_outlined),
                        "Retrait",
                        const Retrait()),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    card(
                        context,
                        Colors.green,
                        const Icon(Icons.savings_outlined),
                        "Epargne",
                        const Epargne())
                  ],
                )
              ],
            ),
          )
        ]),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            player.stop();
            player.setAsset('assets/audios/Phrase_7.mp3');
            player.play();
          },
          child: const Icon(Icons.volume_up),
        ),
      ),
    );
  }
}
