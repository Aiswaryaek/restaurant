// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../widgets/colored_textfield.dart';

class BankReconciliationRadio extends StatefulWidget {
  const BankReconciliationRadio({super.key});

  @override
  State<BankReconciliationRadio> createState() =>
      _BankReconciliationRadioState();
}

class _BankReconciliationRadioState extends State<BankReconciliationRadio> {
  final accountController = TextEditingController();
  int _selectedRadio = 0;
  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
    print('Tapped radio: $_selectedRadio');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.8,
        child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              Transform.translate(offset: Offset(-65,0),child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        activeColor: blackColor,
                        focusColor: blackColor,
                        value: 0,
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        groupValue: _selectedRadio,
                        visualDensity: VisualDensity.compact,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'Receipt',
                        style: bookedTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        activeColor: blackColor,
                        focusColor: blackColor,
                        value: 1,
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        groupValue: _selectedRadio,
                        visualDensity: VisualDensity.compact,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'Payment',
                        style: bookedTextStyle,
                      ),
                    ],
                  ),
                ],
              ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppScreenUtil().screenHeight(15),),
                  ColoredTextField(
                      color: textFieldColor,
                      controller: accountController,
                      title: 'Account'),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredTextField(
                      color: textFieldColor,
                      controller: accountController,
                      title: 'Date'),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredTextField(
                      color: textFieldColor,
                      controller: accountController,
                      title: 'Amount'),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredTextField(
                      color: textFieldColor,
                      controller: accountController,
                      title: 'Approval Code'),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredTextField(
                      color: textFieldColor,
                      controller: accountController,
                      title: 'Ref'),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                ],
              )
            ])));
  }
}
