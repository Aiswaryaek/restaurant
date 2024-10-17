// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/product_table.dart';

class LoanDetails extends StatefulWidget {
  const LoanDetails({super.key});

  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  final disbursementController = TextEditingController();
  final installmentController = TextEditingController();
  final nextInstallmentAmountController = TextEditingController();
  ScrollController loanTableController = ScrollController();
  double loanIndicatorPosition = 0.0;
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  List<String> installment = [
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
  ];
  List<String> emi = [
    'AED 1000.00',
    'AED 1000.00',
    'AED 1000.00',
    'AED 1000.00',
    'AED 1000.00',
  ];
  List<String> totalAmountRepaid = [
    'AED 1000.00',
    'AED 1000.00',
    'AED 1000.00',
    'AED 1000.00',
    'AED 1000.00',
  ];
  List<String> remainingAmount = [
    'AED 4000.00',
    'AED 4000.00',
    'AED 4000.00',
    'AED 4000.00',
    'AED 4000.00',
  ];
  List<String> status = [
    'Approved',
    'Approved',
    'Approved',
    'Approved',
    'Approved',
  ];

  dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {
      if (kDebugMode) {
        print("Date is not selected");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'LOAN - 0001',
                    style: billTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Reason: Personal loan',
                    style: rolesAndPermissionModuleAccessTabLabelStyle,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: loanDetailsFirstContainerColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(1)),
                    padding: EdgeInsets.fromLTRB(9, 9, 9, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TOTAL REPAIMENT AMOUNT',
                          style: loanGreenTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Text(
                          'AED 1,000.00',
                          style: loanGreenSubTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: loanDetailsSecondContainerColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(1)),
                    padding: EdgeInsets.fromLTRB(9, 9, 9, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REMAINING AMOUNT',
                          style: loanRedTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Text(
                          'AED 4,000.00',
                          style: loanRedSubTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: loanDetailsThirdContainerColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(1)),
                    padding: EdgeInsets.fromLTRB(9, 9, 9, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REMAINING AMOUNT',
                          style: loanYellowTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Text(
                          'AED 4,000.00',
                          style: loanYellowSubTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: salesReportTableColor.withOpacity(0.8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee',
                          style: xlTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Text(
                          'EMP001-Vaisakh',
                          style: customerLabelStyle,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee loan',
                          style: xlTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Text(
                          'AED 5,000.00',
                          style: customerLabelStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(13),
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextFieldWithDate(
                    controller: disbursementController,
                    title: 'Disbursement Date',
                    onTap: () async {
                      dateSelection(controller: disbursementController);
                    },
                  )),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: installmentController,
                        title: 'Installment Amount'),
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
                        controller: nextInstallmentAmountController,
                        title: 'Next Installment Amount'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CustomTextFieldWithDate(
                    controller: disbursementController,
                    title: 'loan Closing Date',
                    onTap: () async {
                      dateSelection(controller: disbursementController);
                    },
                  )),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(16),
              bottom: AppScreenUtil().screenHeight(30)),
          child: DefaultProductTable(
              visible: false,
              scrollController: loanTableController,
              slidingIndicatorPosition: loanIndicatorPosition,
              tableDataWidgets: List.generate(installment.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(609),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: tableDataAlternateColor[
                            index % tableDataAlternateColor.length],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(5)),

                        ///scrolling row
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child: Text(installment[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(120),
                                  child: Center(
                                    child: Text(emi[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(120),
                                  child: Center(
                                    child:  Text(totalAmountRepaid[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(120),
                                  child: Center(
                                    child:  Text(remainingAmount[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(110),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(bottom: 2),
                                        width: AppScreenUtil().screenWidth(65),
                                        height:
                                            AppScreenUtil().screenHeight(19),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color:
                                              payButtonColor.withOpacity(0.6),
                                        ),
                                        child: Center(
                                          child: Text(
                                            status[index],
                                            style:
                                                inventoryCreateButtonLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                );
              }),
              tableRowWidth: 609,
              titleWidgets: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child:  Text(
                          'Installment',
                          style: tableTitleLabelStyle,
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
                      width: AppScreenUtil().screenWidth(120),
                      child: Center(
                        child:  Text(
                          'EMI',
                          style: tableTitleLabelStyle,
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
                      width: AppScreenUtil().screenWidth(120),
                      child: Center(
                        child:  Text(
                          'Total Amount Repaid',
                          style: tableTitleLabelStyle,
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
                      width: AppScreenUtil().screenWidth(120),
                      child: Center(
                        child:  Text(
                          'Remaining Amount',
                          style: tableTitleLabelStyle,
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
                      width: AppScreenUtil().screenWidth(110),
                      child: Center(
                        child: Text(
                          'Status',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        )
      ],
    );
  }
}
