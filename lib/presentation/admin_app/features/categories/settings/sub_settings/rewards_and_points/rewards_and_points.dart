import 'package:flutter/material.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/colored_textfield.dart';

class RewardsAndPoints extends StatefulWidget {
  const RewardsAndPoints({super.key});

  @override
  State<RewardsAndPoints> createState() => _RewardsAndPointsState();
}

class _RewardsAndPointsState extends State<RewardsAndPoints> {
  final pointsController = TextEditingController();
  final amountsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 8, 25, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredTextField(
              color: textFieldColor,
              controller: pointsController,
              title: 'Points'),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          ColoredTextField(
              color: textFieldColor,
              controller: amountsController,
              title: 'Amount'),
        ],
      ),
    );
  }
}
