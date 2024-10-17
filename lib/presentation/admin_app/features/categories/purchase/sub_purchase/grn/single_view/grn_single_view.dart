// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:zoom_widget/zoom_widget.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/image_constant.dart';

class GRNSingleView extends StatefulWidget {
  const GRNSingleView({super.key});

  @override
  State<GRNSingleView> createState() =>
      _GRNSingleViewState();
}

class _GRNSingleViewState
    extends State<GRNSingleView> {

  List<Color> tableDataAlternateColor = [
    constantWhite,
    vendorBillColor.withOpacity(0.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 40, top: 5),
        child:Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
            width: double.infinity,
            // height: AppScreenUtil().screenHeight(538),
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
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            ImageCons.imgLeeyetLogo,
                            height: 4.58,
                            width: 17.47,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(1),
                          ),
                          Text(
                            'Gov. Cyber park, sahya building, 2nd floor,',
                            style: vendorBillAddressTextStyle,
                          ),
                          Text(
                            'near hilite mall,, Palazhi.',
                            style: vendorBillAddressTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(3),
                          ),
                          Text(
                            'Kozhikode 673016 Kerala',
                            style: vendorBillAddressTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(2),
                          ),
                          Text(
                            'Phone: xxxxxxxxxx',
                            style: vendorBillAddressTextStyle,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'GRN',
                            style: branchSettingsTextFieldTitleLabelStyle,
                          ),
                          Text(
                            'GRN/2024/05/32',
                            style: adminDashBoardThisWeekTextStyle,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(7),
                  ),
                  Text(
                    'Vendor Address',
                    style: vendorBillSubAddressTextStyle,
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(3),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mr. Munshid',
                            style: vendorBillAddressTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(1),
                          ),
                          Text(
                            'TRN 5467547678463',
                            style: vendorBillAddressTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(1),
                          ),
                          Text(
                            'Ipix Technologies Cyberpark kerala',
                            style: vendorBillAddressTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(1),
                          ),
                          Text(
                            'Kozhikode 673016 Kerala',
                            style: vendorBillAddressTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(1),
                          ),
                          Text(
                            'Phone: xxxxxxxxxx',
                            style: vendorBillAddressTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(1),
                          ),
                          Text(
                            'Ipix@gmail.com',
                            style: vendorBillAddressTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Date :',
                                style: vendorBillDateTextStyle,
                              ),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(10),
                              ),
                              Text(
                                '13 May 2023',
                                style: vendorBillDateTextStyle,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(7),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///Table heading
                        Container(
                          height: AppScreenUtil().screenHeight(23),
                          width: double.infinity,
                          color: vendorBillColor.withOpacity(0.9),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                AppScreenUtil().screenWidth(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(5),
                                      child: Center(
                                        child: Text(
                                          'No.',
                                          style: vendorTitleHeadStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(30),
                                      child: Center(
                                        child: Text(
                                          'Product',
                                          style: vendorTitleHeadStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(20),
                                      child: Center(
                                        child:  Text(
                                          'UOM',
                                          style: vendorTitleHeadStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(20),
                                      child: Center
                                        (
                                        child: Text(
                                          'Order Qty',
                                          style: vendorTitleHeadStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(15),
                                      child: Center(
                                        child:   Text(
                                          'Received Qty',
                                          style: vendorTitleHeadStyle,
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
                        Column(
                            children: List.generate(8, (index) {
                              return InkWell(
                                child: Container(
                                  height: AppScreenUtil().screenHeight(23),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: whiteColor.withOpacity(0.7),
                                        width: 0.8),
                                    color: tableDataAlternateColor[
                                    index % tableDataAlternateColor.length],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        AppScreenUtil().screenWidth(10)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil().screenWidth(5),
                                              child: Center(
                                                child: Text(
                                                  '1',
                                                  style: purchaseSingleViewStyle,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil().screenWidth(30),
                                              child: Center(
                                                child: Text(
                                                  'Beef Biriyani',
                                                  style: purchaseSingleViewStyle,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil().screenWidth(20),
                                              child: Center(
                                                child:  Text(
                                                  'Units',
                                                  style: purchaseSingleViewStyle,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil().screenWidth(20),
                                              child: Center
                                                (
                                                child: Text(
                                                  '50',
                                                  style: purchaseSingleViewStyle,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil().screenWidth(15),
                                              child: Center(
                                                child:   Text(
                                                  '25',
                                                  style: purchaseSingleViewStyle,
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
                                onTap: () {
                                  setState(() {});
                                },
                              );
                            })),
                        Container(
                          height: AppScreenUtil().screenHeight(23),
                          width: double.infinity,
                          color: vendorBillColor.withOpacity(0.9),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                AppScreenUtil().screenWidth(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(5),
                                      child: Center(
                                        child: Text(
                                          '',
                                          style: vendorTitleHeadStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(25),
                                      child: Center(
                                        child: Text(
                                          '',
                                          style: vendorTitleHeadStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(20),
                                      child: Center(
                                        child:  Text(
                                          'Total',
                                          style: vendorTitleHeadStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(20),
                                      child: Center
                                        (
                                        child: Text(
                                          '500',
                                          style: vendorTitleHeadStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(15),
                                      child: Center(
                                        child:   Text(
                                          '250',
                                          style: vendorTitleHeadStyle,
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
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class ZoomableWidget extends StatefulWidget {
  final Widget child;

  ZoomableWidget({required this.child});

  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details) {
        _previousScale = _scale;
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          _scale = _previousScale * details.scale;
        });
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
