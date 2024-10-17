// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/uom_table.dart';
import 'detail/order_detail.dart';
import 'orders_controller.dart';

class PosOrderList extends StatefulWidget {
  const PosOrderList({super.key});

  @override
  State<PosOrderList> createState() => _PosOrderListState();
}

class _PosOrderListState extends State<PosOrderList> {
  ScrollController paymentController = ScrollController();
  double paymentControllerPosition = 0.0;

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
  List<String> orderNo = [
    'BILL/19',
    'BILL/19',
    'BILL/19',
    'BILL/19',
    'BILL/19',
    'BILL/19',
    'BILL/19',
    'BILL/19',
    'BILL/19',
    'BILL/19',
  ];
  List<String> shift = [
    'SHIFT11',
    'SHIFT11',
    'SHIFT11',
    'SHIFT11',
    'SHIFT11',
    'SHIFT11',
    'SHIFT11',
    'SHIFT11',
    'SHIFT11',
    'SHIFT11',
  ];
  List<String> employee = [
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
  ];
  List<String> customer = [
    'Customer',
    'Customer',
    'Customer',
    'Customer',
    'Customer',
    'Customer',
    'Customer',
    'Customer',
    'Customer',
    'Customer',
  ];
  List<String> orderAmount = [
    '234.00',
    '234.00',
    '234.00',
    '234.00',
    '234.00',
    '234.00',
    '234.00',
    '234.00',
    '234.00',
    '234.00',
  ];
  List<String> amountPaid = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> status = [
    'Active',
    'Ended',
    'Active',
    'Ended',
    'Active',
    'Ended',
    'Active',
    'Ended',
    'Active',
    'Ended',
  ];
bool tappedDetails = false;
  final PosOrderController posOrdersCtrl = Get.put(PosOrderController());
  @override
  void initState() {
    paymentController.addListener(() {
      setState(() {
        paymentControllerPosition =
            (paymentController.offset / paymentController.position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    paymentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return tappedDetails==true?OrderDetail():Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16, bottom: 10),
            child: Text(
              'Orders',
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
                  scrollController: paymentController,
                  slidingIndicatorPosition: paymentControllerPosition,
                  tableDataWidgets: List.generate(date.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(33),
                        width: AppScreenUtil().screenWidth(873),
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
                                      child: Text(orderNo[index],
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
                                      child: Text(orderAmount[index],
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
                                      child: Text(amountPaid[index],
                                          style: tableSubTitleLabelStyle,
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
                                          padding: EdgeInsets.only(bottom: 1),
                                          width: AppScreenUtil().screenWidth(55),
                                          height:
                                          AppScreenUtil().screenHeight(17),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(4),
                                            color: status[index] == 'Active'
                                                ? paymentActiveButtonColor
                                                : paymentEndedButtonColor,
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
                      onTap: () {
                        setState(() {
                          tappedDetails=true;
                          posOrdersCtrl.orderDetailTapped
                              .value = true;

                          print('If Detail Tapped: ${posOrdersCtrl.orderDetailTapped
                              .value}');
                        });
                      },
                    );
                  }),
                  tableRowWidth: 873,
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
                            'Order No.',
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
                              'Shift',
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
                        Container( color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),child: Center(child:   Text(
                            'Order Amount',
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
                              'Amount Paid',
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
                          width: AppScreenUtil().screenWidth(110),
                          child: Center(
                            child:  Text(
                              'Status',
                              style: tableTitleLabelStyleForEmployeeDashBoard,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            )),
      ],
    );
  }
}
