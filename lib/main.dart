import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplymoney_mtn/consts/const.dart';
import 'package:simplymoney_mtn/screens/authentification/contact_page.dart';
import 'package:simplymoney_mtn/screens/authentification/empreinte.dart';
import 'package:simplymoney_mtn/screens/welcome.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  number = pref.getString('NUMBER');
  player.setVolume(1);
  runApp(const HomePage());
  // Timer(const Duration(seconds: 3), () {
  //   runApp(const MyApp());
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SimpliMoney_MTN',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(253, 203, 12, 5)),
        useMaterial3: true,
      ),
      home: number == null
          ? const ContactPage()
          : EmpreinteDigitale(number: number!, nextPage: const Welcome()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();

  //   Timer(const Duration(milliseconds: 1000), () {
  //     // SharedPreferences pref = await SharedPreferences.getInstance();
  //     // var number = pref.getString('NUMBER');
  //     if (number == null) {
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (context) => const Contact_Page(),
  //       ));
  //     } else {
  // Navigator.of(context).pushReplacement(MaterialPageRoute(
  //   builder: (context) => const Welcome(),
  // ));
  //     }
  //   });
  // }

  Future<bool> futurePage() => Future.delayed(const Duration(seconds: 3), () {
        return true;
      });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: futurePage(),
      initialData: false,
      builder: (context, snapshot) => snapshot.data!
          ? const MyApp()
          : MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'SimpliMoney_MTN',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color.fromRGBO(253, 203, 12, 5)),
                useMaterial3: true,
              ),
              home: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/SimpliMoney_logo.jpg"),
                  ],
                )),
              ),
            ),
    );
  }
}
