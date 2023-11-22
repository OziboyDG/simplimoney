import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
          title: const Text("Envoyer", style:TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ) ,),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text("Confirmer le paiement", style: TextStyle(
                  fontSize: 30,
                ),),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Text("Votre transaction", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(195, 4, 25, 163)
                ),),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transférer à :"),
                    Text("DEGUENON SESSEH0 OZIAS AMEN", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Numéro :"),
                    Text("+229 96980840", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: const Text("Facture", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(195, 4, 25, 163)
                ),),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Montant :"),
                    Text("2000 F CFA", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Frais de service :"),
                    Text("0 F CFA", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Taxe :"),
                    Text("0 F CFA", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                  ),
                  child: Text("Confirmer le payement", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                ),
              )
        ],)),
        floatingActionButton: ElevatedButton(onPressed: (){}, child: Icon(Icons.volume_up)),
      ),
    );
  }
}