import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplymoney_mtn/screens/authentification/contact_page.dart';
import 'package:simplymoney_mtn/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'SimpliMoney_MTN',
      theme: ThemeData(  
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(253,203,12,5)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () async{
      SharedPreferences pref = await SharedPreferences.getInstance();
      var number = pref.getString('NUMBER');
      if(number== null){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Contact_Page(),
      ));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Welcome(number: number,),
      ));
      }
    });
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/SimpliMoney_logo.jpg"),
        ],

      )),
    );
  }
}