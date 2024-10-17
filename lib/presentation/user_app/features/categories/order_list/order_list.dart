// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../models/subcategories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final options = <Subcategories>[];
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    options.add(Subcategories(('  All  ')));
    options.add(Subcategories(('Processing')));
    options.add(Subcategories(('Preparing')));
    options.add(Subcategories((' Ready ')));
    options.add(Subcategories(('Completed')));
    options.add(Subcategories((' Paid ')));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backGroundColor,
            body: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppScreenUtil().screenWidth(25)),
                      topRight:
                          Radius.circular(AppScreenUtil().screenWidth(25))),
                  color: whiteColor),
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: AppScreenUtil().screenHeight(25),
                  ),
                  Text(
                    'Order List',
                    style: dashBoardBlackLabelTextStyle,
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(20),
                  ),
                  SizedBox(
                    height: 23,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: options.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(9, 0, 9, 2),
                          decoration: BoxDecoration(
                            color: (currentTabIndex == index)
                                ? dashBoardTabSelectedColor
                                : subcategoriesColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              options[index].text!,
                              style: (currentTabIndex == index)
                                  ? placeOrderingAndConfirmPaymentButtonLabelStyle
                                  : dashBoardTextStyle,
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(20),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) => Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 7, 5, 7),
                                  decoration: BoxDecoration(
                                    color: backGroundColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ListTile(
                                      leading: Transform.translate(
                                        offset: Offset(-3, 0),
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Image.network(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9J393bVr7EVNCnuDQUlGbkuxkEUam-CcUf9mB2XDWUPjfcUXwAln0RVKu4e0MvaLHBd8&usqp=CAU',
                                            height: AppScreenUtil()
                                                .screenHeight(50),
                                            width:
                                                AppScreenUtil().screenWidth(50),
                                          ),
                                        ),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order #21047',
                                            style: tableHeadingLabelStyle,
                                          ),
                                          SizedBox(
                                            height:
                                                AppScreenUtil().screenHeight(4),
                                          ),
                                          Text(
                                            'Chicken Biriyani',
                                            style: categoryMenuTextStyle,
                                          ),
                                          SizedBox(
                                            height:
                                                AppScreenUtil().screenHeight(4),
                                          ),
                                          Text(
                                            '21 Jan 2021 - 11:30 AM',
                                            style: greenTextStyle,
                                          )
                                        ],
                                      ),
                                      trailing: Transform.translate(
                                          offset: Offset(9, 6),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 1, 5, 3),
                                                decoration: BoxDecoration(
                                                  color: redColor
                                                      .withOpacity(0.75),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  'T6-F1',
                                                  style:
                                                      inventoryCreateButtonLabelStyle,
                                                ),
                                              ),
                                              SizedBox(
                                                  height: AppScreenUtil()
                                                      .screenHeight(5)),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 1, 5, 4),
                                                decoration: BoxDecoration(
                                                  color: greenColor
                                                      .withOpacity(0.8),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  'Completed',
                                                  style:
                                                      inventoryCreateButtonLabelStyle,
                                                ),
                                              ),
                                            ],
                                          ))),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(10),
                                )
                              ],
                            )),
                  )
                ],
              ),
            )));
  }
}
