import 'package:flutter/material.dart';
import 'package:simplymoney_mtn/consts/color_app.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: AppColors.BackgroundColor,
      image: DecorationImage(
        image: const AssetImage("assets/images/mtn_momo.jpg"),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(AppColors.BackgroundColor.withOpacity(0.1), BlendMode.dstATop) )
     ),
    );
  }
}