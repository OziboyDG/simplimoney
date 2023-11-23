import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/screens/operations/epargne.dart';
import 'package:simplymoney_mtn/screens/operations/retrait.dart';
import 'package:simplymoney_mtn/screens/operations/transfert.dart';
import 'package:simplymoney_mtn/widget/card.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key, required this.number});
  final String number;
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // static String number = '';
  // Future getData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   number = pref.getString('NUMBER') ?? 'loading...';
  // }

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Container(
            height: 200,
            width: double.infinity,
            child: Card(
              color: Color.fromARGB(142, 1, 27, 176),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "10,000 F CFA",
                    style: TextStyle(
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
                      Icon(Icons.compare_arrows_outlined),
                      "Transfère",
                      Transfert()),
                  card(
                      context,
                      Colors.red,
                      Icon(Icons.add_to_home_screen_outlined),
                      "Retrait",
                      Retrait()),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  card(context, Colors.green, Icon(Icons.savings_outlined),
                      "Epargne", Epargne())
                ],
              )
            ],
          ),
        )
      ]),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Icon(Icons.volume_up),
      ),
    );
  }
}
