import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/screens/authentification/contact_page.dart';

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

    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Contact_Page(),
      ));
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