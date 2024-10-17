import 'package:flutter/material.dart';
import 'package:restaurant/styles/textstyles.dart';

class CartPriceLayout extends StatelessWidget {
  final String text;
  final String values;
  final TextStyle style;

  const CartPriceLayout(
      {super.key,
      required this.text,
      required this.values,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: style,
        ),
        Text(
          values,
          style: style,
        )
      ],
    );
  }
}
