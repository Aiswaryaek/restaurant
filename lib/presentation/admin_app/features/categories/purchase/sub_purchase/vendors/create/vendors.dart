// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/styles/colors.dart';

import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';

class PurchaseVendors extends StatefulWidget {
  const PurchaseVendors({super.key});

  @override
  State<PurchaseVendors> createState() => _PurchaseVendorsState();
}

class _PurchaseVendorsState extends State<PurchaseVendors> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  bool status2 = false;
  bool status1 = false;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          'Image Upload',
                          style: bookedTextStyle,
                        ),
                        Transform.translate(offset: Offset(-10,0),child: SvgPicture.asset(
                          ImageCons.uploadImage,
                          height: 70,
                          width: 100,
                        ),),
                      ],
                    ),
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: TextEditingController(),
                  title: 'Name',
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Country',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'State',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: TextEditingController(),
                  title: 'City',
                ),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: TextEditingController(),
                  title: 'Street',
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFieldWithTitle(
                        controller: TextEditingController(),
                        title: 'Zip Code',
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(18),
                      ),
                      Text(
                        'Is Vendor',
                        style: bookedTextStyle,
                      ),
                      SizedBox(height: AppScreenUtil().screenHeight(10),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlutterSwitch(
                            width: 43,
                            height: 18,
                            toggleSize: 11.0,
                            value: status2,
                            borderRadius: 30.0,
                            padding: 2.0,
                            toggleColor: status2== false?confirmColor:greenColor,
                            switchBorder: Border.all(
                              color: status2== false?confirmColor:greenColor,
                              width: 1,
                            ),
                            toggleBorder: Border.all(
                              color: status2== false?confirmColor:greenColor,
                              width: 1,
                            ),
                            activeColor: whiteColor,
                            inactiveColor: whiteColor,
                            onToggle: (val) {
                              setState(() {
                                status2 = val;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  )
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFieldWithTitle(
                        controller: TextEditingController(),
                        title: 'TRN No',
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(18),
                      ),
                      Text(
                        'Is Customer',
                        style: bookedTextStyle,
                      ),
                      SizedBox(height: AppScreenUtil().screenHeight(10),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlutterSwitch(
                            width: 43,
                            height: 18,
                            toggleSize: 11.0,
                            value: status1,
                            borderRadius: 30.0,
                            padding: 2.0,
                            toggleColor: status1== false?confirmColor:greenColor,
                            switchBorder: Border.all(
                              color: status1== false?confirmColor:greenColor,
                              width: 1,
                            ),
                            toggleBorder: Border.all(
                              color: status1== false?confirmColor:greenColor,
                              width: 1,
                            ),
                            activeColor: whiteColor,
                            inactiveColor: whiteColor,
                            onToggle: (val) {
                              setState(() {
                                status1 = val;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Divider(
            color: inventorySelectionColor,
            thickness: 1.5,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: TextEditingController(),
                  title: 'Mobile',
                ),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: TextEditingController(),
                  title: 'Email',
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            children: [
              Expanded(
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment terms',
                        style: bookedTextStyle,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: whiteColor,
                            boxShadow:const [
                              BoxShadow(
                                color: searchTextColor,
                                offset: Offset(0, 0),
                                blurRadius: 1,
                              ),
                            ]),
                        child: SizedBox(
                          height: 38,
                          child: DropdownButton<String>(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10),
                            value: _selectedItem,
                            items: _dropdownItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: subTitleTextStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue;
                              });
                            },
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      print('TApped');
                                    });
                                  },
                                  child:  Container(
                                    height: AppScreenUtil().screenHeight(16.3),
                                    width: AppScreenUtil().screenWidth(18.12),
                                    decoration: BoxDecoration(color: specialItemsLeftMenuColor,borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child: Icon(Icons.add,color: whiteColor,size: 13,),
                                    ),
                                  ),
                                ),
                                SizedBox(width:AppScreenUtil().screenWidth(3),),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: blackColor,
                                ),
                              ],
                            ),
                            iconSize: 20,
                            isExpanded: true,
                            underline:
                            const SizedBox(), // Removes the default underline
                          ),
                        ),
                      )
                    ],
                  )
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: TextEditingController(),
                  title: 'Supplier Currency',
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: TextEditingController(),
                  title: 'Contact Person Name',
                ),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: TextEditingController(),
                  title: 'Contact Person Mobile',
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: TextEditingController(),
                  title: 'Company Code',
                ),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Branch',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            children: [
              Expanded(
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer Group',
                        style: bookedTextStyle,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: whiteColor,
                            boxShadow:const [
                              BoxShadow(
                                color: searchTextColor,
                                offset: Offset(0, 0),
                                blurRadius: 1,
                              ),
                            ]),
                        child: SizedBox(
                          height: 38,
                          child: DropdownButton<String>(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10),
                            value: _selectedItem,
                            items: _dropdownItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: subTitleTextStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue;
                              });
                            },
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      print('TApped');
                                    });
                                  },
                                  child:  Container(
                                    height: AppScreenUtil().screenHeight(16.3),
                                    width: AppScreenUtil().screenWidth(18.12),
                                    decoration: BoxDecoration(color: specialItemsLeftMenuColor,borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child: Icon(Icons.add,color: whiteColor,size: 13,),
                                    ),
                                  ),
                                ),
                                SizedBox(width:AppScreenUtil().screenWidth(3),),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: blackColor,
                                ),
                              ],
                            ),
                            iconSize: 20,
                            isExpanded: true,
                            underline:
                            const SizedBox(), // Removes the default underline
                          ),
                        ),
                      )
                    ],
                  )
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CommonDropDownWithTitle(
                  dropDownItems: _dropdownItems,
                  title: 'Phone',
                  value: _selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                )
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Text(
            'Active / InActive',
            style: bookedTextStyle,
          ),
          SizedBox(height: AppScreenUtil().screenHeight(10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlutterSwitch(
                width: 43,
                height: 18,
                toggleSize: 11.0,
                value: status,
                borderRadius: 30.0,
                padding: 2.0,
                toggleColor: status== false?confirmColor:greenColor,
                switchBorder: Border.all(
                  color: status== false?confirmColor:greenColor,
                  width: 1,
                ),
                toggleBorder: Border.all(
                  color: status== false?confirmColor:greenColor,
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
          )
        ],
      ),
    );
  }
}
