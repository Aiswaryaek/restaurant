// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/colored_textfield.dart';
import 'bank_reconciliation_radios.dart';

class BankConciliationChargeDifference extends StatefulWidget {
  const BankConciliationChargeDifference({super.key});

  @override
  State<BankConciliationChargeDifference> createState() =>
      _BankConciliationChargeDifferenceState();
}

class _BankConciliationChargeDifferenceState
    extends State<BankConciliationChargeDifference> {
///Textfield controllers
  final accountController = TextEditingController();
  final dateController = TextEditingController();
  final amountController = TextEditingController();
  final refController = TextEditingController();
  final journalController = TextEditingController();
  bool status = false;
  bool isPosted = false;

  @override
  Widget build(BuildContext context) {
    return isPosted == true?BankReconciliationRadio():Container(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
        child:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Bank Charge Difference Setup',
            style: tableHeadingLabelStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(12),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11, right: 11),
            child: Column(
              children: [
                ColoredTextField(
                    color: textFieldColor,
                    controller: accountController,
                    title: 'Account'),
                SizedBox(
                  height: AppScreenUtil().screenHeight(14),
                ),
                ColoredTextField(
                    color: textFieldColor,
                    controller: dateController,
                    title: 'Date'),
                SizedBox(
                  height: AppScreenUtil().screenHeight(14),
                ),
                ColoredTextField(
                    color: textFieldColor,
                    controller: amountController,
                    title: 'Amount'),
                SizedBox(
                  height: AppScreenUtil().screenHeight(14),
                ),
                ColoredTextField(
                    color: textFieldColor,
                    controller: refController,
                    title: 'Ref'),
              ],
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Amount Transfer',
                style: tableHeadingLabelStyle,
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(5),
              ),
              FlutterSwitch(
                width: 35,
                height: 16,
                toggleSize: 10.0,
                value: status,
                borderRadius: 60.0,
                padding: 2.0,
                toggleColor: status == false ? confirmColor : greenColor,
                switchBorder: Border.all(
                  color: status == false ? confirmColor : greenColor,
                  width: 1,
                ),
                toggleBorder: Border.all(
                  color: status == false ? confirmColor : greenColor,
                  width: 1,
                ),
                activeColor: whiteColor,
                inactiveColor: whiteColor,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ],
          ),
          status == true
              ? Padding(
            padding: EdgeInsets.only(left: 11, right: 11),
            child: Column(
              children: [
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                ColoredTextField(
                    color: textFieldColor,
                    controller: journalController,
                    title: 'Journal'),
                SizedBox(
                  height: AppScreenUtil().screenHeight(14),
                ),
                ColoredTextField(
                    color: textFieldColor,
                    controller: dateController,
                    title: 'Date'),
                SizedBox(
                  height: AppScreenUtil().screenHeight(14),
                ),
                ColoredTextField(
                    color: textFieldColor,
                    controller: amountController,
                    title: 'Amount'),
                SizedBox(
                  height: AppScreenUtil().screenHeight(14),
                ),
                ColoredTextField(
                    color: textFieldColor,
                    controller: refController,
                    title: 'Ref'),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
              ],
            ),
          )
              : SizedBox(
            height: AppScreenUtil().screenHeight(25),
          ),Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(onTap: (){
                setState(() {
                  isPosted=true;
                });
              },
                child: Container(
                    width: 92,
                    height: 28,
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Post',
                          style: completeButtonTextStyle,
                          textAlign: TextAlign.center),
                    )),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(10),
              ),
              Container(
                  width: 92,
                  height: 28,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: blackColor)),
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Cancel',
                        style: taxCreateEnterAPassWordLabelStyle,
                        textAlign: TextAlign.center),
                  )),
            ],
          ),

        ]));
  }
}
