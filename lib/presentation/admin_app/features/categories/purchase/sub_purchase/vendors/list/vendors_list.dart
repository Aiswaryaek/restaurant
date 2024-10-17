import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/product_table.dart';

class PurchaseVendorsList extends StatefulWidget {
  const PurchaseVendorsList({super.key});

  @override
  State<PurchaseVendorsList> createState() => _PurchaseVendorsListState();
}

class _PurchaseVendorsListState extends State<PurchaseVendorsList> {
  ScrollController vendorTableController = ScrollController();
  double vendorIndicatorPosition = 0.0;
  List<String> date = [
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023'
  ];
  List<String> name = [
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS'
  ];

  List<String> phone = [
    '7686575672',
    '7686575672',
    '7686575672',
    '7686575672',
    '7686575672',
    '7686575672',
    '7686575672',
    '7686575672',
    '7686575672',
    '7686575672',
    '7686575672'
  ];
  List<String> email = [
    'hfg@gmail.com',
    'hfg@gmail.com',
    'hfg@gmail.com',
    'hfg@gmail.com',
    'hfg@gmail.com',
    'hfg@gmail.com',
    'hfg@gmail.com',
    'hfg@gmail.com',
    'hfg@gmail.com',
    'hfg@gmail.com',
    'hfg@gmail.com'
  ];
  List<String> country = [
    'UAE',
    'India',
    'UAE',
    'India',
    'UAE',
    'India',
    'UAE',
    'India',
    'UAE',
    'India',
    'UAE'
  ];
  List<String> createdBy = [
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid'
  ];


  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    vendorTableController.addListener(() {
      setState(() {
        vendorIndicatorPosition = (vendorTableController.offset /
            vendorTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    vendorTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: DefaultProductTable( visible: true,
                scrollController: vendorTableController,
                slidingIndicatorPosition: vendorIndicatorPosition,
                tableDataWidgets: List.generate(date.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(705),
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
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child:  Text(
                                        date[index],
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
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Center(
                                      child:  Text(name[index],
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
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Center(
                                      child: Text(
                                        phone[index],
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
                                    width: AppScreenUtil().screenWidth(135),
                                    child: Center(
                                      child:  Text(email[index],
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
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Center(
                                      child:  Text(country[index],
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
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Center(
                                      child: Text(createdBy[index],
                                          style: dashBoardTextStyle,
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
                    ),
                    onTap: () {},
                  );
                }),
                tableRowWidth: 704,
                titleWidgets: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Center(
                          child: Text(
                            'Date',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
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
                        Text(
                          'Name',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(110),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Phone',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(135),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Email',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(110),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Country',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(110),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Created By',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        SizedBox(height: AppScreenUtil().screenHeight(30),),
      ],
    );
  }
}
