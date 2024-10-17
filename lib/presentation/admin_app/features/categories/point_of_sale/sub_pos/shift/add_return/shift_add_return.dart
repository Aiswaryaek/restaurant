// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../widgets/product_table.dart';

class ShiftAddReturn extends StatefulWidget {
  const ShiftAddReturn({super.key});

  @override
  State<ShiftAddReturn> createState() => _ShiftAddReturnState();
}

class _ShiftAddReturnState extends State<ShiftAddReturn> {
  ScrollController shiftPaymentTableController = ScrollController();
  double shiftPaymentIndicatorPosition = 0.0;
  List<Color> tableDataAlternateColor = [
      shiftContainerColor.withOpacity(0.4),
    shiftTableFirstColor.withOpacity(0.6),
  ];
  List<String> paymentMethod = [
    'Bank',
    'Jabel All Cash',
  ];
  List<String> paymentSummaryIn = [
    '100.00',
    '0.00',
  ];
  List<String> paymentSummaryOut = [
    '0.00',
    '3.94',
  ];
  List<String> paymentSummaryBalance = [
    '100.00',
    '-3.94',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            children: [
              Container(
                height: AppScreenUtil().screenHeight(130),
                width: double.infinity,
                color: shiftContainerColor,
                padding: EdgeInsets.fromLTRB(10, 18, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SHIFT1',
                      style: pangramMedium(size: 14.0, color: blackColor),
                    ),
                    SizedBox(height: AppScreenUtil().screenHeight(8),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Branch',  style: pangramMedium(size: 9.0, color: blackColor.withOpacity(0.5)),),
                            SizedBox(height: AppScreenUtil().screenHeight(7),),
                            Text('Employee',  style: pangramMedium(size: 9.0, color: blackColor.withOpacity(0.5)),),
                            SizedBox(height: AppScreenUtil().screenHeight(7),),
                            Text('Opening Date',  style: pangramMedium(size: 9.0, color: blackColor.withOpacity(0.5)),),
                            SizedBox(height: AppScreenUtil().screenHeight(7),),
                            Text('Closing Date',  style: pangramMedium(size: 9.0, color: blackColor.withOpacity(0.5)),),
                          ],
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(30),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jabel Ali',  style: pangramMedium(size: 9.0, color: blackColor),),
                            SizedBox(height: AppScreenUtil().screenHeight(7),),
                            Text('BranchWise Shift',  style: pangramMedium(size: 9.0, color: blackColor),),
                            SizedBox(height: AppScreenUtil().screenHeight(7),),
                            Text('2024/03/22 11:23:AM',  style: pangramMedium(size: 9.0, color: blackColor),),
                            SizedBox(height: AppScreenUtil().screenHeight(7),),
                            Text('2024/03/22 11:32:AM',  style: pangramMedium(size: 9.0, color: blackColor),),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(25),),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: adminDashBoardDateDropDownContainerBoxShadowColor,
                      offset: Offset(0, 0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                height: AppScreenUtil().screenHeight(39),
                width: double.infinity,
                child: Center(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ImageCons.imgShiftOrders,height: AppScreenUtil().screenHeight(14.45),),
                          SizedBox(width: AppScreenUtil().screenWidth(5),),
                          Text('Orders',style: pangramMedium(size: 9.0, color: blackColor),)
                        ],
                      ),
                      Text('2', style: pangramMedium(size: 9.0, color: blackColor),)
                    ],
                  )
                ),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(20),),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: adminDashBoardDateDropDownContainerBoxShadowColor,
                      offset: Offset(0, 0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                height: AppScreenUtil().screenHeight(39),
                width: double.infinity,
                child: Center(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(ImageCons.imgShiftPickings,height: AppScreenUtil().screenHeight(14.45),),
                            SizedBox(width: AppScreenUtil().screenWidth(5),),
                            Text('Pickings',style: pangramMedium(size: 9.0, color: blackColor),)
                          ],
                        ),
                        Text('5', style: pangramMedium(size: 9.0, color: blackColor),)
                      ],
                    )
                ),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(20),),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: adminDashBoardDateDropDownContainerBoxShadowColor,
                      offset: Offset(0, 0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                height: AppScreenUtil().screenHeight(39),
                width: double.infinity,
                child: Center(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(ImageCons.imgShiftPayments,height: AppScreenUtil().screenHeight(14.45),),
                            SizedBox(width: AppScreenUtil().screenWidth(5),),
                            Text('Payments',style: pangramMedium(size: 9.0, color: blackColor),)
                          ],
                        ),
                        Text('2', style: pangramMedium(size: 9.0, color: blackColor),)
                      ],
                    )
                ),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(20),),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: adminDashBoardDateDropDownContainerBoxShadowColor,
                      offset: Offset(0, 0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                height: AppScreenUtil().screenHeight(39),
                width: double.infinity,
                child: Center(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(ImageCons.imgShiftWallet,height: AppScreenUtil().screenHeight(14.45),),
                            SizedBox(width: AppScreenUtil().screenWidth(5),),
                            Text('Wallet',style: pangramMedium(size: 9.0, color: blackColor),)
                          ],
                        ),
                        Text('0', style: pangramMedium(size: 9.0, color: blackColor),)
                      ],
                    )
                ),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(35),),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                  color: shiftContainerColor.withOpacity(0.4),
                ),
                height: AppScreenUtil().screenHeight(39),
                width: double.infinity,
                child: Center(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text('Payment Summery', style: pangramMedium(size: 11.0, color: blackColor),),
                  )
                )
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 16,bottom: 30),child: SingleChildScrollView(
          physics:ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: shiftPaymentTableController,
          child: Padding(
            padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(16)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Table heading
                Padding(
                  padding: EdgeInsets.only(
                      bottom: AppScreenUtil().screenWidth(5)),
                  child: Container(
                    height: AppScreenUtil().screenHeight(36),
                    width: AppScreenUtil().screenWidth(401),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: constantWhite,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(18),
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
                                width: AppScreenUtil().screenWidth(95),
                                child: Center(
                                  child: Text(
                                    'Payment Method',
                                    style: pangramMedium(size: 9.0, color: blackColor),
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(
                                    'In',
                                    style: pangramMedium(size: 9.0, color: blackColor),
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child:  Text(
                                    'Out',
                                    style: pangramMedium(size: 9.0, color: blackColor),
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(
                                    'Balance',
                                    style: pangramMedium(size: 9.0, color: blackColor),
                                    maxLines: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Column(children: List.generate(paymentMethod.length, (index) {
                  return InkWell(
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(401),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: tableDataAlternateColor[
                        index % tableDataAlternateColor.length],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(18)),

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
                                  width: AppScreenUtil().screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      paymentMethod[index],
                                      style: pangramMedium(size: 9.0, color: blackColor.withOpacity(0.5)),
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
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(paymentSummaryIn[index],
                                        style: pangramMedium(size: 9.0, color: blackColor.withOpacity(0.5)),
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
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(
                                      paymentSummaryOut[index],
                                      style: pangramMedium(size: 9.0, color: blackColor.withOpacity(0.5)),
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
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(paymentSummaryBalance[index],
                                        style: pangramMedium(size: 9.0, color: blackColor.withOpacity(0.5)),
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
                })),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: AppScreenUtil().screenWidth(5)),
                  child: Container(
                    height: AppScreenUtil().screenHeight(36),
                    width: AppScreenUtil().screenWidth(401),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: constantWhite,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(18),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(95),
                                child: Center(
                                  child:  Text(
                                    'Total',
                                    style:shiftTotalListTextStyle,
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child:   Text(
                                    '100.00',
                                    style:shiftTotalListTextStyle,
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child: Text(
                                    '3.94',
                                    style: shiftTotalListTextStyle,
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
                                width: AppScreenUtil().screenWidth(90),
                                child: Center(
                                  child:  Text(
                                    '96.06',
                                    style: shiftTotalListTextStyle,
                                    maxLines: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),)
      ],
    );
  }
}
