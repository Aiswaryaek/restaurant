// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';

class StaffBankDetails extends StatefulWidget {
  const StaffBankDetails({super.key});

  @override
  State<StaffBankDetails> createState() => _StaffBankDetailsState();
}

class _StaffBankDetailsState extends State<StaffBankDetails> {
  final accountHolderController = TextEditingController();
  final bankNameController = TextEditingController();
  final ifscController = TextEditingController();
  final accountNumberController = TextEditingController();
  final branchLocationController = TextEditingController();
  final panController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFieldWithTitle(
                  controller: accountHolderController, title: 'Account Holder'),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: CustomTextFieldWithTitle(
                  controller: accountNumberController, title: 'Account Number'),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextFieldWithTitle(
                  controller: accountHolderController, title: 'Bank name'),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: CustomTextFieldWithTitle(
                  controller: ifscController, title: 'IFSC / IBAN'),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextFieldWithTitle(
                  controller: branchLocationController, title: 'Branch Location'),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: CustomTextFieldWithTitle(
                  controller: panController, title: 'PAN / Income Tax Code'),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
      ],
    );
  }
}
