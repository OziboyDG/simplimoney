import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/screens/welcome.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  static late Size mediaSize;
  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
      color: AppColors.BackgroundColor,
      image: DecorationImage(
        image: const AssetImage("assets/images/mtn_momo.jpg"),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(AppColors.BackgroundColor.withOpacity(0.1), BlendMode.dstATop) )
     ),
     child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: mediaSize.height * 0.5,
            width: mediaSize.width * 0.5,
            decoration: const BoxDecoration(
            image: DecorationImage(
               image: AssetImage("assets/SimpliMoney1.png"))),
                        ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text("Félicitation pour votre opération sur SimpliMoney !", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Welcome(number: '',)));
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.home),
                const SizedBox(width: 12,),
                Text('Accueil', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),)
              ]),
            ),
          ),
        ],
      ), 
      floatingActionButton: ElevatedButton(onPressed: (){}, child: const Icon(Icons.volume_up)),),
    );
  }
}