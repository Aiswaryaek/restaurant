import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/kot_cancelled_item.dart';
import 'package:restaurant/presentation/admin_app/widgets/kot_item_layout.dart';
import 'package:restaurant/presentation/user_app/widgets/custom_button.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class KotTabItemLayout extends StatelessWidget {
  final String orderNumber;
  final String time;

  final String tableNumber;
  final String date;
  final String tokenNumber;
  final String type;
  final String waiterName;
  final List<String> cancelledItemName;
  final List<String> cancelledItemCount;
  final List<String> orderedItemName;
  final List<String> orderedItemCount;
  final bool isDarkMode;

  final List<bool> isNoteAddedList;

  final int orderStatus;
 const KotTabItemLayout(
      {super.key,
      required this.orderStatus,
      required this.cancelledItemCount,
      required this.cancelledItemName,
      required this.date,
      required this.isNoteAddedList,
      required this.orderNumber,
      required this.orderedItemCount,
      required this.orderedItemName,
      required this.tableNumber,
      required this.time,
      required this.tokenNumber,
      required this.type,
      required this.isDarkMode,
      required this.waiterName});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:(isDarkMode == false)? kotMainContainerColor:blackColor),
          child: Padding(
            padding: EdgeInsets.only(
              top: AppScreenUtil().screenHeight(15),
              bottom: AppScreenUtil().screenHeight(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(26),
                      right: AppScreenUtil().screenWidth(26)),
                  child: Column(
                    children: [
                      ///Order number layout
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order No : $orderNumber',
                            style: pangramMedium(size: 10.0, color: whiteColor),
                          ),
                          Text(
                            'Table No : $tableNumber',
                            style: pangramMedium(size: 10.0, color: whiteColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
      
                      ///Time and token details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$time, $date',
                            style: pangramRegular(size: 9.0, color: whiteColor),
                          ),
                          Text(
                            'Token No : $tokenNumber',
                            style: pangramRegular(size: 9.0, color: whiteColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
      
                      ///Type layout
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TYPE',
                            style: pangramRegular(size: 9.0, color: whiteColor),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(8),
                          ),
                          Text(
                            ': $type',
                            style: pangramRegular(size: 9.0, color: whiteColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(7),
                ),
                Container(
                  height: AppScreenUtil().screenHeight(22),
                  width: double.infinity,
                  color: whiteColor.withOpacity(0.26),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(26)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Waitor : $waiterName',
                          style: pangramRegular(size: 9.0, color: whiteColor),
                        ),
      
                        /// Print layout
                        Container(
                          height: AppScreenUtil().screenHeight(18),
                          width: AppScreenUtil().screenWidth(39),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(1)),
                          child: Center(
                            child: SvgPicture.asset(
                              ImageCons.imgPrinter,
                              height: 10.51,
                              width: 10.51,
                              color: blackColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(26)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Cancelled items
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            cancelledItemCount.length,
                            (index) => KotCancelledItem(
                                itemCount: cancelledItemCount[index],
                                itemName: cancelledItemName[index])),
                      ),
      
                      ///Ordered items
                      Column(
                        children: List.generate(
                            orderedItemCount.length,
                            (index) => KotItemLayout(
                                itemName: orderedItemName[index],
                                itemCount: orderedItemCount[index],
                                isNoteAdded: isNoteAddedList[index])),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(20),
                      ),
      
                      ///Button layout
      
                      ///New order button
                      (orderStatus == 0)
                          ? Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                      buttonHeight:
                                          AppScreenUtil().screenHeight(23.2),
                                      buttonColor: whiteColor,
                                      borderRadius: 1,
                                      buttonText: 'To Cook',
                                      buttonLabelStyle: pangramMedium(
                                          size: 7.00, color: blackColor)),
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(13),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                      buttonHeight:
                                          AppScreenUtil().screenHeight(23.2),
                                      buttonColor:(isDarkMode == false)? blackColor:kotDarkModeRejectionButtonColor,
                                      borderRadius: 1,
                                      buttonText: 'Reject',
                                      buttonLabelStyle: pangramMedium(
                                          size: 7.00, color: whiteColor)),
                                ),
                              ],
                            )
                          : (orderStatus == 1)
                              ?
      
                              ///Preparing order button
      
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: CustomButton(
                                      buttonWidth:
                                          AppScreenUtil().screenWidth(115.34),
                                      buttonHeight:
                                          AppScreenUtil().screenHeight(23.2),
                                      buttonColor: whiteColor,
                                      borderRadius: 1,
                                      buttonText: 'Completed',
                                      buttonLabelStyle: pangramMedium(
                                          size: 7.00, color: blackColor)),
                                )
                              :
      
                              ///Completed order button
                              Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                          buttonHeight:
                                              AppScreenUtil().screenHeight(23.2),
                                          buttonColor: whiteColor,
                                          borderRadius: 1,
                                          buttonText: 'Delivery',
                                          buttonLabelStyle: pangramMedium(
                                              size: 7.00, color: blackColor)),
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(13),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                          buttonHeight:
                                              AppScreenUtil().screenHeight(23.2),
                                          buttonColor: (isDarkMode == false)? blackColor:kotDarkModeRejectionButtonColor,
                                          borderRadius: 1,
                                          buttonText: 'Reset',
                                          buttonLabelStyle: pangramMedium(
                                              size: 7.00, color: whiteColor)),
                                    ),
                                  ],
                                )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
