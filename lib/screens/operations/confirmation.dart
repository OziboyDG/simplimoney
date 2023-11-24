import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/consts/const.dart';
import 'package:simplymoney_mtn/core/entity/base_client.dart';
import 'package:simplymoney_mtn/screens/final.dart';
import 'package:simplymoney_mtn/screens/welcome.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key, this.current, this.number, this.money});
  final int? current;
  final String? number;
  final String? money;

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  late final LocalAuthentication auth;
  bool _isAuthenticating = false;
  bool _isAuthenticated = false;
  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    player.stop();
    player.setAsset('assets/audios/Phrase_9.mp3');
    player.play();
  }

  Future<void> _authenticate() async {
    BaseClient.transfer(widget.number ?? "", widget.money ?? "");
    setState(() {
      _isAuthenticating = true;
    });

    try {
      bool isAuthenticated = await auth.authenticate(
        localizedReason:
            'Veuillez scanner votre empreinte pour vous authentifier',
      );
      setState(() {
        _isAuthenticated = isAuthenticated;
        _isAuthenticating = false;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FinalPage()));
      });
    } catch (e) {
      setState(() {
        _isAuthenticating = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

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
            centerTitle: true,
            backgroundColor: AppColors.BackgroundColor,
            title: const Text(
              "Envoyer",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Confirmer le paiement",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: const Text(
                  "Votre transaction",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(195, 4, 25, 163)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transférer à :"),
                    Text(
                      "DEGUENON SESSEH0 OZIAS AMEN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Numéro :"),
                    Text(
                      "+229 ${widget.number}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: const Text(
                  "Facture",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(195, 4, 25, 163)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Montant :"),
                    Text(
                      "${widget.money} F CFA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Frais de service :"),
                    Text(
                      "0 F CFA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Taxe :"),
                    Text(
                      "0 F CFA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: _authenticate,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                  ),
                  child: const Text(
                    "Confirmer le payement",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          )),
          floatingActionButton: ElevatedButton(
              onPressed: () {
                player.stop();
                player.setAsset('assets/audios/Phrase_9.mp3');
                player.play();
              },
              child: const Icon(Icons.volume_up)),
        ),
      ),
    );
  }
}
