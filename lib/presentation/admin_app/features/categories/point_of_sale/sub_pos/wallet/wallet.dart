// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/uom_table.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  ScrollController walletController = ScrollController();
  double walletControllerPosition = 0.0;

  List<String> date = [
    '09/12/2023',
    '09/12/2023',
    '09/12/2023',
    '09/12/2023',
    '09/12/2023',
    '09/12/2023',
    '09/12/2023',
    '09/12/2023',
    '09/12/2023',
    '09/12/2023',
  ];
  List<String> sequence = [
    'PAY/2024/04/20',
    'PAY/2024/04/20',
    'PAY/2024/04/20',
    'PAY/2024/04/20',
    'PAY/2024/04/20',
    'PAY/2024/04/20',
    'PAY/2024/04/20',
    'PAY/2024/04/20',
    'PAY/2024/04/20',
    'PAY/2024/04/20',
  ];
  List<String> orderRef = [
    'BIL/17',
    'BIL/17',
    'BIL/17',
    'BIL/17',
    'BIL/17',
    'BIL/17',
    'BIL/17',
    'BIL/17',
    'BIL/17',
    'BIL/17',
  ];
  List<String> customer = [
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
  ];
  List<String> branch = [
    'Jabel Ali',
    'Jabel Ali',
    'Jabel Ali',
    'Jabel Ali',
    'Jabel Ali',
    'Jabel Ali',
    'Jabel Ali',
    'Jabel Ali',
    'Jabel Ali',
    'Jabel Ali',
  ];
  List<String> shift = [
    'SHIFT 11',
    'SHIFT 11',
    'SHIFT 11',
    'SHIFT 11',
    'SHIFT 11',
    'SHIFT 11',
    'SHIFT 11',
    'SHIFT 11',
    'SHIFT 11',
    'SHIFT 11',
  ];
  List<String> employee = [
    'Name Of employee',
    'Name Of employee',
    'Name Of employee',
    'Name Of employee',
    'Name Of employee',
    'Name Of employee',
    'Name Of employee',
    'Name Of employee',
    'Name Of employee',
    'Name Of employee',
  ];
  List<String> paymentMethod = [
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
  ];
  List<String> amount = [
    '09/12/2024',
    '09/12/2024',
    '09/12/2024',
    '09/12/2024',
    '09/12/2024',
    '09/12/2024',
    '09/12/2024',
    '09/12/2024',
    '09/12/2024',
    '09/12/2024',
  ];

  @override
  void initState() {
    walletController.addListener(() {
      setState(() {
        walletControllerPosition =
            (walletController.offset / walletController.position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    walletController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16, bottom: 10),
            child: Text(
              'Wallet',
              style: addOnSubTextStyle,
            ),
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: AppScreenUtil().screenHeight(30),
                  left: AppScreenUtil().screenWidth(16)),
              child: UOMProductTable(
                  visible: false,
                  scrollController: walletController,
                  slidingIndicatorPosition: walletControllerPosition,
                  tableDataWidgets: List.generate(date.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(33),
                        width: AppScreenUtil().screenWidth(963),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                          border: Border.all(  color: posPaymentBorderColor.withOpacity(1)),
                          color: whiteColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(18)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(95),
                                    child: Center(
                                      child: Text(date[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(130),
                                    child: Center(
                                      child: Text(sequence[index],
                                          style: tableSubTitleLabelStyle,
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(orderRef[index],
                                          style: tableSubTitleLabelStyle,
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(customer[index],
                                          style: tableSubTitleLabelStyle,
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(branch[index],
                                          style: tableSubTitleLabelStyle,
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(shift[index],
                                          style: tableSubTitleLabelStyle,
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(employee[index],
                                          style: tableSubTitleLabelStyle,
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(paymentMethod[index],
                                          style: tableSubTitleLabelStyle,
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(amount[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    );
                  }),
                  tableRowWidth: 963,
                  titleWidgets: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(95),
                          child: Center(
                            child: Text(
                              'Date',
                              style: tableTitleLabelStyleForEmployeeDashBoard,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(   color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(130),child: Center(child: Text(
                            'Sequence',
                            style: tableTitleLabelStyleForEmployeeDashBoard,
                          ),),)
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
                              'Order Ref',
                              style: tableTitleLabelStyleForEmployeeDashBoard,
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
                              'Customer',
                              style: tableTitleLabelStyleForEmployeeDashBoard,
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
                              'Branch',
                              style: tableTitleLabelStyleForEmployeeDashBoard,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container( color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),child: Center(child:   Text(
                            'Shift',
                            style: tableTitleLabelStyleForEmployeeDashBoard,
                            maxLines: 1,
                          ),),)
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
                              'Employee',
                              style: tableTitleLabelStyleForEmployeeDashBoard,
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
                              'Payment Method',
                              style: tableTitleLabelStyleForEmployeeDashBoard,
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
                          child: Center(child:  Text(
                            'Amount',
                            style: tableTitleLabelStyleForEmployeeDashBoard,
                            maxLines: 1,
                          ),),
                        )
                      ],
                    ),
                  ]),
            )),
      ],
    );
  }
}
