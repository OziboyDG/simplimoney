import 'package:flutter/material.dart';

class CardMoney extends StatefulWidget {
  const CardMoney(
      {super.key,
      required this.price,
      required this.moneyCtr,
      required this.Height,
      required this.Width});
  final String price;
  final TextEditingController moneyCtr;
  final double Height;
  final double Width;

  @override
  State<CardMoney> createState() => _CardMoneyState();
}

class _CardMoneyState extends State<CardMoney> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.Height,
      width: widget.Width,
      child: GestureDetector(
        onTap: () {
          // setState(() {
            int currentMoney = int.parse(widget.moneyCtr.text);
            int newMoney = currentMoney + int.parse(widget.price);
            widget.moneyCtr.text = newMoney.toString();
          // });
        },
        child: Image.asset('assets/images/${widget.price}f.png'),
      ),
    );
  }
}
