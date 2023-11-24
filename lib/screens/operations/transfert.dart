import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplymoney_mtn/consts/const.dart';
import 'package:simplymoney_mtn/screens/operations/confirmation.dart';
import 'package:simplymoney_mtn/widget/money_card.dart';

class Transfert extends StatefulWidget {
  const Transfert({super.key});

  @override
  State<Transfert> createState() => _TransfertState();
}

class _TransfertState extends State<Transfert> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController numberCtr = TextEditingController();
  TextEditingController moneyCtr = TextEditingController(text: '0');
  @override
  void initState() {
    player.stop();
    player.setAsset('assets/audios/Phrase_8.mp3');
    player.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repeat(),
      builder: (context, snapshot) =>  Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 224, 224),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromARGB(255, 230, 224, 224),
          title: Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Envoyer de l'argent",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Saisir le numéro Momo du bénéficiaire.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    child: TextFormField(
                      // autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "ce champ ne peut être nul";
                        } else {
                          return null;
                        }
                      },
                      controller: numberCtr,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.deny('.'),
                        FilteringTextInputFormatter.deny('-'),
                        FilteringTextInputFormatter.deny(','),
                        FilteringTextInputFormatter.deny(' '),
                      ],
                      maxLength: 8,
                      style: const TextStyle(
                          fontSize: 18,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        constraints: const BoxConstraints(maxHeight: 75),
                        helperMaxLines: 1,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        labelText: 'Numéro Momo',
                        prefixIcon: const Icon(Icons.phone_android_outlined),
                        helperText: "(Ex: 97XXXXXX)",
                        labelStyle: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.black54,
                        ),
                        helperStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "Constituer le montant à envoyer.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: moneyCtr,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny('.'),
                      FilteringTextInputFormatter.deny('-'),
                      FilteringTextInputFormatter.deny(','),
                      FilteringTextInputFormatter.deny(' '),
                    ],
                    style: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value == "") {
                        moneyCtr.text = "0";
                      } else {
                        moneyCtr.text = int.parse(value).toString();
                      }
                    },
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(maxHeight: 75),
                      helperMaxLines: 1,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Montant',
                      prefixIcon: const Icon(Icons.money),
                      suffixIcon: IconButton(
                        icon:
                            const Icon(Icons.close, color: Colors.red, size: 50),
                        onPressed: () {
                          moneyCtr.text = '0';
                        },
                      ),
                      helperText: "(Ex: 500)",
                      labelStyle: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.black54,
                      ),
                      helperStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardMoney(
                        price: '25',
                        moneyCtr: moneyCtr,
                        Height: 75,
                        Width: 75,
                      ),
                      CardMoney(
                        price: '50',
                        moneyCtr: moneyCtr,
                        Height: 60,
                        Width: 60,
                      ),
                      CardMoney(
                        price: '100',
                        moneyCtr: moneyCtr,
                        Height: 75,
                        Width: 75,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardMoney(
                        price: '200',
                        moneyCtr: moneyCtr,
                        Height: 75,
                        Width: 100,
                      ),
                      CardMoney(
                        price: '500',
                        moneyCtr: moneyCtr,
                        Height: 100,
                        Width: 150,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardMoney(
                        price: '1000',
                        moneyCtr: moneyCtr,
                        Height: 100,
                        Width: 150,
                      ),
                      CardMoney(
                        price: '2000',
                        moneyCtr: moneyCtr,
                        Height: 100,
                        Width: 170,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardMoney(
                        price: '5000',
                        moneyCtr: moneyCtr,
                        Height: 100,
                        Width: 165,
                      ),
                      CardMoney(
                        price: '10000',
                        moneyCtr: moneyCtr,
                        Height: 100,
                        Width: 175,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () async {
                bool b = _formKey.currentState?.validate() ?? false;
                if (b) {
                  _formKey.currentState?.save();
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  int before = pref.getInt("availableAmount") ?? 0;
                  int current = before - int.parse(moneyCtr.text);
                  if (current >= 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmationPage(
                                current: current,
                                number: numberCtr.text,
                                money: moneyCtr.text)));
                    pref.setInt("availableAmount", current);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "votre solde est insuffisant pour effectuer ce transfert"),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Entrez un numéro valide"),
                    ),
                  );
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Envoyer",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: Colors.white,
                  )
                ],
              )),
        ),
        floatingActionButton: ElevatedButton(
            onPressed: () {
              player.stop();
              player.setAsset('assets/audios/Phrase_8.mp3');
              player.play();
            },
            child: const Icon(Icons.volume_up)),
      ),
    );
  }
}
