// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../widgets/colored_textfield.dart';

class SalaryCalculation extends StatefulWidget {
  const SalaryCalculation({super.key});

  @override
  State<SalaryCalculation> createState() => _SalaryCalculationState();
}

class _SalaryCalculationState extends State<SalaryCalculation> {
  final componentController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  List<String> component = [
    'Name Of Component',
    'Name Of Component',
    'Name Of Component',
    'Name Of Component',
    'Name Of Component',
  ];
  List<String> description = [
    'BSC',
    'SDF',
    'AWD',
    'ZXC',
    'BSC',
  ];
  List<String> amount = [
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
  ];
  List<String> deductionComponent = [
    'Name Of Component',
    'Name Of Component',
    'Name Of Component',
    'Name Of Component',
    'Name Of Component',
  ];
  List<String> deductionCode = [
    'BSC',
    'SDF',
    'AWD',
    'ZXC',
    'BSC',
  ];
  List<String> deductionAmount = [
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ColoredTextField(
                  color: textFieldColor,
                  controller: componentController,
                  title: 'Component'),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: ColoredTextField(
                  color: textFieldColor,
                  controller: descriptionController,
                  title: 'Description'),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(18),
        ),
        Row(
          children: [
            Expanded(
              child: ColoredTextField(
                  color: textFieldColor,
                  controller: amountController,
                  title: 'Amount'),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(20),
        ),
        Text('Earnings',style: customerLabelStyle,),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Table heading
              Container(
                height: AppScreenUtil().screenHeight(25),
                width: AppScreenUtil().screenWidth(320),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppScreenUtil().screenWidth(6)),
                      topRight:
                      Radius.circular(AppScreenUtil().screenWidth(6))),
                  color: blackColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(120),
                          child: Center(
                            child: Text(
                              'Component',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'Code',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'Amount',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ///TableDetails
              Column(
                  children: List.generate(component.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(30),
                        width: AppScreenUtil().screenWidth(322),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: tableOutlinedColor.withOpacity(0.7),
                              width: 0.8),
                          color: whiteColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(120),
                                  child: Text(
                                    component[index],
                                    textAlign: TextAlign.center,
                                    style: salesReportSubTitleLabelStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    description[index],
                                    style: salesReportSubTitleLabelStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Text(
                                    amount[index].toString(),
                                    textAlign: TextAlign.center,
                                    style: salesReportSubTitleLabelStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                      },
                    );
                  })),
              ///Table bottom
              Container(
                height: AppScreenUtil().screenHeight(25),
                width: AppScreenUtil().screenWidth(320),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppScreenUtil().screenWidth(6)),
                      bottomRight:
                      Radius.circular(AppScreenUtil().screenWidth(6))),
                  color: blackColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(120),
                          child: Center(
                            child: Text(
                              '',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'Total Earnings',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child:  Text(
                              '2000.00',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(20),
        ),
        Text('Deductions',style: customerLabelStyle,),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Table heading
              Container(
                height: AppScreenUtil().screenHeight(25),
                width: AppScreenUtil().screenWidth(320),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppScreenUtil().screenWidth(6)),
                      topRight:
                      Radius.circular(AppScreenUtil().screenWidth(6))),
                  color: blackColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(120),
                          child: Center(
                            child:  Text(
                              'Component',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'Code',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'Amount',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ///TableDetails
              Column(
                  children: List.generate(component.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(30),
                        width: AppScreenUtil().screenWidth(322),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: tableOutlinedColor.withOpacity(0.7),
                              width: 0.8),
                          color: whiteColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(120),
                                  child: Text(
                                    deductionComponent[index],
                                    textAlign: TextAlign.center,
                                    style: salesReportSubTitleLabelStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    deductionCode[index],
                                    style: salesReportSubTitleLabelStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Text(
                                    deductionAmount[index].toString(),
                                    textAlign: TextAlign.center,
                                    style: salesReportSubTitleLabelStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                      },
                    );
                  })),
              ///Table bottom
              Container(
                height: AppScreenUtil().screenHeight(25),
                width: AppScreenUtil().screenWidth(320),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppScreenUtil().screenWidth(6)),
                      bottomRight:
                      Radius.circular(AppScreenUtil().screenWidth(6))),
                  color: blackColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(120),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'Total Earnings',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child:  Text(
                              '2000.00',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(20),
        ),
        Container(
          padding: EdgeInsets.only(left: 30,right: 30),
          height: AppScreenUtil().screenHeight(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppScreenUtil().screenWidth(6)),
            color: confirmColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(
                'Net Salary',
                style:
                placeOrderingAndConfirmPaymentButtonLabelStyle,
                maxLines: 1,
              ),),
              Expanded(child: Align(child: Text(
                '20500.00',
                style:
                placeOrderingAndConfirmPaymentButtonLabelStyle,
                maxLines: 1,
              ),alignment: Alignment.centerRight,))
            ],
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(20),
        ),
      ],
    );
  }
}
