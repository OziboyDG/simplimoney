import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/screens/authentification/empreinte.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key, required this.number});
  final String number;
  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  @override
  late Size mediaSize;
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController pin5 = TextEditingController();
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
        body:  Container(
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
           top: 100,
          ),
          child: Column(
            children: [
              const Text("Vérification Pin", style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              ),),
              const SizedBox(
                height: 5.0,
              ),
              const Text("Veuillez entrer votre code Pin Momo",style: TextStyle(
                  fontSize: 15,
                ),),
                const SizedBox(
                height: 15.0,
              ),
                Form(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        controller: pin1,
                        onChanged: (value){
                          if (value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      )
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        controller: pin2,
                        onChanged: (value){
                          if (value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      )
                    ),SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        controller: pin3,
                        onChanged: (value){
                          if (value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      )
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        controller: pin4,
                        onChanged: (value){
                          if (value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      )
                    ),SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        controller: pin5,
                        onChanged: (value){
                          if (value.length==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                )),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: (){
                      String pin = "${pin1.text}${pin2.text}${pin3.text}${pin4.text}${pin5.text}";
                      print(pin);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmpreinteDigitale(number: widget.number)));
                    },
                    child: Center(
                      child: Container(
                        width: mediaSize.width*0.3,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text('Se Connecter',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),),
                      ),
                    ),
                  )
            ],
          ),
        ),
        floatingActionButton:  ElevatedButton(
            onPressed: (){}, child: const Icon(Icons.volume_up),),
      ),
    );
  }
}