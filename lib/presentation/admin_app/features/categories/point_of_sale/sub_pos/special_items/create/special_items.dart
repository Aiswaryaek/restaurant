// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../models/product_categories_model.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/dotted_line.dart';
import '../../../../../../widgets/editableTable.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import 'combo_offer.dart';

class PosSpecialItems extends StatefulWidget {
  const PosSpecialItems({super.key});


  @override
  State<PosSpecialItems> createState() => _PosSpecialItemsState();
}

class _PosSpecialItemsState extends State<PosSpecialItems> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final offerNameController = TextEditingController();




  List<String> product = [
    'Chicken',
    'Chicken',
    'Chicken',
  ];

  List<String> unitPrice = [
    '250.00',
    '250.00',
    '250.00',
  ];

  List<String> offerPrice = [
    '200.00',
    '200.00',
    '200.00',
  ];


bool status = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Combo Offer',style:posSettingsDropDownStyle ,),
                    SizedBox(width: AppScreenUtil().screenWidth(6),),
                    FlutterSwitch(
                      width: 43,
                      height: 18,
                      toggleSize: 11.0,
                      value: status,
                      borderRadius: 30.0,
                      padding: 2.0,
                      toggleColor: status== false?blackColor:greenColor,
                      switchBorder: Border.all(
                        color: status== false?blackColor:greenColor,
                        width: 1,
                      ),
                      toggleBorder: Border.all(
                        color: status== false?blackColor:greenColor,
                        width: 1,
                      ),
                      activeColor: whiteColor,
                      inactiveColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ],
                ),
                status==false?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFieldWithTitle(
                        controller: offerNameController,
                        title: 'Offer Name'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child:
                            CommonDropDownWithTitle(
                              dropDownItems: _dropdownItems,
                              title: 'Week Days',
                              value: _selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedItem = newValue;
                                });
                              },
                            )
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child:
                            CommonDropDownWithTitle(
                              dropDownItems: _dropdownItems,
                              title: 'Branch',
                              value: _selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedItem = newValue;
                                });
                              },
                            )
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(18),
                    ),
                    Text(
                      'Image upload',
                      style: dashBoardTextStyle,
                    ),
                    SvgPicture.asset(
                      ImageCons.uploadImage,
                      height: 70,
                      width: 100,
                    ),
                    SizedBox(height: AppScreenUtil().screenHeight(10),),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///Table heading
                        Container(
                          height: AppScreenUtil().screenHeight(25),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft:
                                Radius.circular(AppScreenUtil().screenWidth(6)),
                                topRight:
                                Radius.circular(AppScreenUtil().screenWidth(6))),
                            color: confirmColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(95),
                                    child: Center(
                                      child: Text(
                                        'Product',
                                        style:
                                        cartSelectedTabLabelTextStyle,
                                        maxLines: 1,
                                      ),
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(95),
                                    child: Center(
                                      child:  Text(
                                        'Unit Price',
                                        style:
                                        cartSelectedTabLabelTextStyle,
                                      ),
                                    )
                                ),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(95),
                                    child:  Center(
                                      child: Text(
                                        'Offer Price',
                                        style:
                                        cartSelectedTabLabelTextStyle,
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  List.generate(product.length, (index) {
                            return InkWell(
                              child: Container(
                                height: AppScreenUtil().screenHeight(37),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: inventorySelectionColor),
                                  color: whiteColor,
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
                                      Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(95),
                                          child: Center(
                                            child: Text(
                                                product[index],
                                                style:
                                                imageUploadLabelStyle,
                                                maxLines: 1,
                                                overflow:
                                                TextOverflow.ellipsis),
                                          )),
                                      Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(95),
                                          child:  Center(
                                            child: Text(
                                                unitPrice[index],
                                                style:
                                                imageUploadLabelStyle,
                                                maxLines: 1,
                                                overflow:
                                                TextOverflow.ellipsis),
                                          )
                                      ),
                                      Container(
                                          color: Colors.transparent,
                                          width: AppScreenUtil().screenWidth(95),
                                          child:  Center(
                                            child: Text(
                                                offerPrice[index],
                                                style:
                                                imageUploadLabelStyle,
                                                maxLines: 1,
                                                overflow:
                                                TextOverflow.ellipsis),
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                bottomBar(context);
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: AppScreenUtil().screenHeight(10),),
                    Row(
                      children: [ Container(
                        decoration: BoxDecoration(
                            color: confirmColor,borderRadius: BorderRadius.circular(3)
                        ),
                        padding: EdgeInsets.fromLTRB(5, 4, 30, 5),
                        child: Text('Add Line',style: swipeWhiteLabelStyle,),
                      ),
                        SizedBox(width: AppScreenUtil().screenWidth(5),),
                        Container(
                          decoration: BoxDecoration(
                              color: inventorySelectionColor,borderRadius: BorderRadius.circular(4)
                          ),
                          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: Icon(Icons.add,color: confirmColor,size: 14,),
                        )
                      ],
                    ),
                    SizedBox(height: AppScreenUtil().screenHeight(18),),
                    Container(
                        padding: EdgeInsets.only(left: 7),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                          color:confirmColor,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.fromLTRB(20, 14, 15, 15),
                              decoration: BoxDecoration(borderRadius: BorderRadius.only( bottomRight: Radius.circular(5), topRight: Radius.circular(5)),
                                color:
                                posSpecialItems1Color,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Friday Special',style: titleTextStyle,),
                                  SizedBox(height: AppScreenUtil().screenHeight(9),),
                                  MySeparator(
                                      color: subDividerColor.withOpacity(0.2)),
                                  SizedBox(height: AppScreenUtil().screenHeight(6),),
                                  Text('Chiken Burger',style: specialItemsLabelStyle,),
                                  SizedBox(height: AppScreenUtil().screenHeight(6),),
                                  Text('Beef Burger',style: specialItemsLabelStyle,),
                                  SizedBox(height: AppScreenUtil().screenHeight(6),),
                                  Text('Apple Juice',style: specialItemsLabelStyle,),
                                  SizedBox(height: AppScreenUtil().screenHeight(6),),
                                  Text('Pastha',style: specialItemsLabelStyle,),
                                  SizedBox(height: AppScreenUtil().screenHeight(6),),
                                  Text('Chiken Biriyani',style: specialItemsLabelStyle,),
                                  SizedBox(height: AppScreenUtil().screenHeight(6),),
                                  Text('Mint Lime',style: specialItemsLabelStyle,),
                                ],
                              )
                          ),
                        ))
                  ],
                ):PosComboOffer()
              ],
            )),
      ],
    );
  }
  void bottomBar(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: AppScreenUtil().screenHeight(100),
          decoration: BoxDecoration(
            color: confirmColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              SizedBox(
                width: AppScreenUtil().screenWidth(50),
                child: Center(
                  child: Divider(
                    color: whiteColor,
                    thickness: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InventoryBottomSheetItemLayout(
                        iconHeight: 13.09,
                        iconPath: ImageCons.imgDisabledView,
                        iconWidth: 20.53),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.imgDisabledEdit,
                        iconWidth: 15.29),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDelete,
                        iconWidth: 13.91),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
