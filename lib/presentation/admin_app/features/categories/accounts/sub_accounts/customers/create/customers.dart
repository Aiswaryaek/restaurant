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

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final zipController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final supplierCurrencyController = TextEditingController();
  final contactPersonController = TextEditingController();
  final contactPersonMobileController = TextEditingController();
  final companyCodeController = TextEditingController();
  final phoneController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  bool status2 = false;
  bool status1 = false;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 25),
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
                  controller: cityController,
                  title: 'City',
                ),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller:streetController,
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
                        controller: zipController,
                        title: 'Zip Code',
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
                        title: 'Tax ID',
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
                  controller: mobileController,
                  title: 'Mobile',
                ),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: emailController,
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
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Payment Terms',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: supplierCurrencyController,
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
                  controller: contactPersonController,
                  title: 'Contact Person',
                ),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: contactPersonMobileController,
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
                  controller: companyCodeController,
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
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Customer Group',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                  controller: phoneController,
                  title: 'Phone',
                ),
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
