// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/product/create/product.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/product_master/create/product_master.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../user_app/widgets/default_textfield.dart';

class InventoryProductAndProductMasterCreateLayout extends StatefulWidget {
  final dynamic tappedItem;
  const InventoryProductAndProductMasterCreateLayout(this.tappedItem,{super.key});

  @override
  State<InventoryProductAndProductMasterCreateLayout> createState() => _InventoryProductAndProductMasterCreateLayoutState();
}

class _InventoryProductAndProductMasterCreateLayoutState extends State<InventoryProductAndProductMasterCreateLayout> {
   final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();
  String? _selectedItem;
  String? _selected;
  int _selectedRadio = 0;
  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
  }
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> _dropdown = ['01', '02', '03'];


  @override
  Widget build(BuildContext context) {
    return   Container(
      height: MediaQuery.of(context).size.height/1.8,
      child: SingleChildScrollView(
        padding:EdgeInsets.fromLTRB(20,0,20,20) ,
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Name',
                            style: bookedTextStyle,
                          ),
                          Text(
                            'PRD22',
                            style: bookedTextStyle,
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: whiteColor,
                          boxShadow: const[
                            BoxShadow(
                              color:
                              adminDashBoardDateDropDownContainerBoxShadowColor,
                              offset: Offset(0, 0),
                              blurRadius: 2.2,
                            ),
                          ],
                        ),
                        child: SizedBox(
                            height: 37,
                            child: defaultTextField(
                                setState, productNameController)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: AppScreenUtil().screenWidth(20),
                ),
                Column(
                  children: [
                    Text(
                      'Image upload',
                      style: dashBoardTextStyle,
                    ),
                    SvgPicture.asset(
                      ImageCons.uploadImage,
                      height: 70,
                      width: 100,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child:
                 CustomTextFieldWithTitle(
                            controller: TextEditingController(),
                            title: 'Native Name')
                ),
                SizedBox(width: AppScreenUtil().screenWidth(25)),
                Expanded(
                  child: 
                  CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Main Category',
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
              height: AppScreenUtil().screenHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child:
  CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'POS Category',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    )                ),
                SizedBox(width: AppScreenUtil().screenWidth(15)),
                Expanded(
                    child: Transform.translate(
                      offset: Offset(-7, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                value: 0,
                                activeColor: blackColor,
                                focusColor: blackColor,
                                groupValue: _selectedRadio,
                                onChanged: _handleRadioValueChange,
                              ),
                              Text(
                                'Stocks',
                                style: bookedTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                activeColor: blackColor,
                                focusColor: blackColor,
                                value: 1,
                                groupValue: _selectedRadio,
                                onChanged: _handleRadioValueChange,
                              ),
                              Text(
                                'Service',
                                style: bookedTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(5),
            ),
            const  Divider(
              color: inventorySelectionColor,
              thickness: 1.5,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(20),
            ),
            widget.tappedItem == 'Product Create'?Product(): ProductMaster(),
            SizedBox(
              height: AppScreenUtil().screenHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}