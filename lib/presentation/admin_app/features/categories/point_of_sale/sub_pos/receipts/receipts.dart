// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';

import '../../../../../widgets/product_table.dart';

class Receipts extends StatefulWidget {
  const Receipts({super.key});

  @override
  State<Receipts> createState() => _ReceiptsState();
}

class _ReceiptsState extends State<Receipts> {
  final invoiceController = TextEditingController();
  String? selected;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final fromInput = TextEditingController();
  final toInput = TextEditingController();

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

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  List<String> date = [
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023'
  ];
  List<String> invoiceId = [
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812'
  ];
  List<String> customer = [
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812',
    'INV45812'
  ];
  List<String> receiptId = [
    'UPI',
    'Cash',
    'UPI',
    'Cash',
    'UPI',
    'Cash',
    'UPI',
    'Cash',
    'UPI',
    'Cash',
    'UPI'
  ];
  List<String> paidAmount = [
    'RS 11,5214,00',
    'RS 11,5214,00',
    'RS 11,5214,00',
    'RS 11,5214,00',
    'RS 11,5214,00',
    'RS 11,5214,00',
    'RS 11,5214,00',
    'RS 11,5214,00',
    'RS 11,5214,00',
    'RS 11,5214,00',
    'RS 11,5214,00'
  ];

  @override
  void initState() {
    receiptTableController.addListener(() {
      setState(() {
        receiptIndicatorPosition = (receiptTableController.offset /
                receiptTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    receiptTableController.dispose();
    super.dispose();
  }

  ScrollController receiptTableController = ScrollController();
  double receiptIndicatorPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15, bottom: 30),
        child: DefaultProductTable(
            visible: true,
            scrollController: receiptTableController,
            slidingIndicatorPosition: receiptIndicatorPosition,
            tableDataWidgets: List.generate(invoiceId.length, (index) {
              return InkWell(
                child: Padding(
                  padding:
                  EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                  child: Container(
                    height: AppScreenUtil().screenHeight(36),
                    width: AppScreenUtil().screenWidth(810),
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
                                width: AppScreenUtil().screenWidth(80),
                                child: Center(
                                  child:  Text(
                                    invoiceId[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                                  child:  Text(customer[index],
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
                                width: AppScreenUtil().screenWidth(105),
                                child: Center(
                                  child:  Text(
                                    receiptId[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                                width: AppScreenUtil().screenWidth(105),
                                child: Center(
                                  child:  Text(date[index],
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
                                width: AppScreenUtil().screenWidth(105),
                                child: Center(
                                  child:  Text(paidAmount[index],
                                      style: dashBoardTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              )
                            ],
                          ),
                          Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(105),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageCons.imgPrinter,
                                    height: 20,
                                    width: 20,
                                  )
                                ],
                              )),
                          Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(105),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    ImageCons.imgMessage,
                                    height: 18,
                                    width: 20,
                                  ),
                                  SvgPicture.asset(
                                    ImageCons.imgMail,
                                    height: 16,
                                    width: 20,
                                  ),
                                  SvgPicture.asset(
                                    ImageCons.imgWhatsapp,
                                    height: 18,
                                    width: 20,
                                  )
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
            tableRowWidth: 810,
            titleWidgets: [
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Invoice ID',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
              Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Customer',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(105),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Receipt Type',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(105),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Paid Date',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
              Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(105),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Paid Amount',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(105),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Print',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(105),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Send',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ]),);
  }
}
