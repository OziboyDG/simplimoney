import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';
import 'package:simplymoney_mtn/screens/authentification/pin_page.dart';

class Contact_Page extends StatefulWidget {
  const Contact_Page({super.key});

  @override
  State<Contact_Page> createState() => _Contact_PageState();
}

class _Contact_PageState extends State<Contact_Page> {
  static late Size mediaSize;
  TextEditingController _mynumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
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
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Positioned(
                  top: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: mediaSize.height * 0.5,
                          width: mediaSize.width * 0.5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/SimpliMoney1.png"))),
                        ),
                      ],
                    ),
                  )),
            ),
            Positioned(
                top: mediaSize.height * 0.35,
                child: SizedBox(
                  width: mediaSize.width,
                  height: mediaSize.height * 0.4,
                  child: Card(
                    color: Colors.white60,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Bienvenue !',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: mediaSize.height * 0.02,
                          ),
                          const Text(
                            "Veuillez entrer votre numéro Momo.",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: mediaSize.height * 0.02,
                          ),
                          Form(
                            child: IntlPhoneField(
                              style: const TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.normal,
                              ),
                              initialCountryCode: "BJ",
                              decoration: InputDecoration(
                                  labelText: "Numéro Momo",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              controller: _mynumber,
                            ),
                          ),
                          InkWell(
                            onTap: () async{
                              print(_mynumber.text);
                              String number = _mynumber.text;
                              if (number.isNotEmpty && number.length == 8) {
                                SharedPreferences pref = await SharedPreferences.getInstance();
                                pref.setString('NUMBER', number);
                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  PinPage(number: number,
                                            )));
                              }
                            },
                            child: Center(
                              child: Container(
                                width: mediaSize.width * 0.3,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Text(
                                  'Validez',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            Positioned(
                bottom: mediaSize.height * 0.03,
                right: mediaSize.width * 0.02,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.volume_up),
                ))
          ],
        ),
      ),
    );
  }
}
