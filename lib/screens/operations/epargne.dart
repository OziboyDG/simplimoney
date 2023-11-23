import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';

class Epargne extends StatefulWidget {
  const Epargne({super.key});

  @override
  State<Epargne> createState() => _EpargneState();
}

class _EpargneState extends State<Epargne> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.BackgroundColor,
    );
  }
}