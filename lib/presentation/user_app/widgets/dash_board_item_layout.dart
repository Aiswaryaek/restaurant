import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class DashBoardItemLayout extends StatelessWidget {
  const DashBoardItemLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                                  padding: EdgeInsets.only(
                                    left:  AppScreenUtil().screenWidth(14),
                                    right:  AppScreenUtil().screenWidth(14),
                                    
                                     bottom:  AppScreenUtil().screenHeight(8),
                                      
                                         ),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(0, 7, 5, 7),
                                    decoration: BoxDecoration(
                                      color: backGroundColor,
                                      borderRadius: BorderRadius.circular(
                                          AppScreenUtil().screenWidth(
                                        5,
                                      )),
                                    ),
                                    child: ListTile(
                                        leading: Transform.translate(
                                          offset: Offset(-3, 0),
                                          child: Container(
                                            padding:const EdgeInsets.fromLTRB(
                                                5, 5, 5, 5),
                                            decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppScreenUtil()
                                                          .screenWidth(
                                                5,
                                              )),
                                            ),
                                            child: Image.network(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9J393bVr7EVNCnuDQUlGbkuxkEUam-CcUf9mB2XDWUPjfcUXwAln0RVKu4e0MvaLHBd8&usqp=CAU',
                                              height: AppScreenUtil()
                                                  .screenHeight(
                                                50,
                                              ),
                                              width: AppScreenUtil()
                                                  .screenWidth(
                                                50,
                                              ),
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
                                              height: AppScreenUtil()
                                                  .screenHeight(
                                                4,
                                              ),
                                            ),
                                            Text(
                                              'Chicken Biriyani',
                                              style: categoryMenuTextStyle,
                                            ),
                                            SizedBox(
                                              height: AppScreenUtil()
                                                  .screenHeight(
                                                4,
                                              ),
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
                                                  padding:
                                                  EdgeInsets.fromLTRB(5, 1, 5, 3),
                                                  decoration: BoxDecoration(
                                                    color: redColor.withOpacity(0.75),
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                  ),
                                                  child: Text(
                                                    'T6-F1',
                                                    style: inventoryCreateButtonLabelStyle,
                                                  ),
                                                ),
                                                SizedBox(height: AppScreenUtil().screenHeight(5)),
                                                Container(
                                                  padding:
                                                  EdgeInsets.fromLTRB(5, 1, 5, 4),
                                                  decoration: BoxDecoration(
                                                    color: greenColor.withOpacity(0.8),
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                  ),
                                                  child: Text(
                                                    'Completed',
                                                    style: inventoryCreateButtonLabelStyle,
                                                  ),
                                                ),
                                              ],
                                            ))),
                                  ),
                                );
                               
  }
}