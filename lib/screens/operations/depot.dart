// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simplymoney_mtn/screens/final.dart';
import 'package:simplymoney_mtn/screens/welcome.dart';
import 'package:simplymoney_mtn/widget/money_card.dart';

class Depot extends StatefulWidget {
  const Depot({
    Key? key,
  }) : super(key: key);

  @override
  State<Depot> createState() => _DepotState();
}

class _DepotState extends State<Depot> {
  TextEditingController moneyCtr = TextEditingController(text: '0');
late final LocalAuthentication auth;
  bool _isAuthenticating = false;
  bool _isAuthenticated = false;
  late final String number;
  late final int money;
  @override
  void initState() {

     super.initState();
     auth = LocalAuthentication(); 
   }
   Future<void> _authenticate(int target) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int e = pref.getInt("thriftAmount")??0;
    int a = pref.getInt("availableAmount")??0;
    pref.setInt("thriftAmount",e+target);
    pref.setInt("availableAmount",a-target);
    setState(() {
      _isAuthenticating = true;
    });

    try {
      bool isAuthenticated = await auth.authenticate(
        localizedReason: 'Veuillez scanner votre empreinte pour vous authentifier',
      );
      setState(() {
        _isAuthenticated = isAuthenticated;
        _isAuthenticating = false;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const FinalPage()));
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
    return Scaffold(
     backgroundColor: const Color.fromARGB(255, 230, 224, 224),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
              const Text(
                   "Constituer le montant à épargner.",
                   style: TextStyle(
                     fontSize: 18,
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
                       icon: const Icon(Icons.close, color: Colors.red, size: 50),
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
                       Width: 130,
                     ),
                     CardMoney(
                       price: '500',
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
                       price: '1000',
                       moneyCtr: moneyCtr,
                       Height: 120,
                       Width: 160,
                     ),
                     CardMoney(
                       price: '2000',
                       moneyCtr: moneyCtr,
                       Height: 100,
                       Width: 175,
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
                 const SizedBox(
                  height: 20,
                 ),
                 InkWell(
                  onTap: ()async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    int availableAmount = pref.getInt("availableAmount")??0;
                    int target = int.parse(moneyCtr.text);
                    if(target <= availableAmount){
                      _authenticate(target);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Solde insuffisant"),
        ),
      );
                    }
                     },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text("Épargner", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                 )
           ],
         ),
       ),
     ),
     floatingActionButton: ElevatedButton(onPressed: (){}, child: const Icon(Icons.volume_up)),
    );
  }
}