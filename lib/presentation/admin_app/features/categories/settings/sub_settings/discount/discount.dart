import 'package:flutter/material.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../widgets/colored_textfield.dart';

class Discount extends StatefulWidget {
  const Discount({super.key});

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  final discountAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 8, 25, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredTextField(
              color: textFieldColor,
              controller: discountAmount,
              title: 'Discount Amount'),
          Align(alignment: Alignment.centerRight,
              child: Text(
                'Discount : %',
                style: discountErrorTextStyle,
              ))
        ],
      ),
    );
  }
}
