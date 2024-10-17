import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title_and_alert.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/switch_with_title.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';

class SalesCustomers extends StatefulWidget {
  const SalesCustomers({super.key});

  @override
  State<SalesCustomers> createState() => _SalesCustomersState();
}

class _SalesCustomersState extends State<SalesCustomers> {
  ///This list and booleans are used only for testing purpose
  String? _selectedItem;
  final List<String> _dropdownItems = ['01', '02', '03'];
  bool status2 = false;

  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(12),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(16)),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Image Upload',
                        style: bookedTextStyle,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(10),
                      ),
                      SvgPicture.asset(
                        ImageCons.imgPictureUpload,
                        height: 53,
                        width: 55,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(), title: 'Name'),
              ),
            ],
          ),
          constHeight,

          ///Country and state field
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
              ))
            ],
          ),

          ///City and street field
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(), title: 'City'),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(), title: 'Street'),
              ),
            ],
          ),

          ///Zip code and tax id field
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(), title: 'Zip Code'),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(), title: 'Tax ID'),
              ),
            ],
          ),
          constHeight,

          ///Switches
          Row(
            children: [
              ///Is customer switch
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: SwitchWithTitle(
                      onToggle: (val) {
                        setState(() {
                          status2 = val;
                        });
                      },
                      title: 'Is Customer',
                      value: status2),
                ),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),

              ///Is vendor switch
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: SwitchWithTitle(
                      onToggle: (val) {
                        setState(() {
                          status2 = val;
                        });
                      },
                      title: 'Is Vendor',
                      value: status2),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),

          const Divider(
            color: inventorySelectionColor,
            thickness: 1.5,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),

          ///Mobile and email fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(), title: 'Mobile'),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(), title: 'Email'),
              ),
            ],
          ),
          constHeight,

          ///Payment terms and supplier currency field
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CommonDropDownWithTitleAndAlert(
                dropDownItems: _dropdownItems,
                title: 'Payment Terms',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                iconOnTap: () {
                  salesCustomersAlertDialogue(context, () {
                    Navigator.of(context).pop();
                  }, () {
                    ///Submit button Ontap
                  }, title: 'Payment Terms', barrierDismissible: false);
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(),
                    title: 'Supplier Currency'),
              ),
            ],
          ),
          constHeight,

          ///Contact person and contact person mobile fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(),
                    title: 'Contact Person'),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(),
                    title: 'Contact Person Mobile'),
              ),
            ],
          ),
          constHeight,

          ///Company code and branch fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(), title: 'Company Code'),
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
                ),
              ),
            ],
          ),
          constHeight,

          ///Customer group and phone fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CommonDropDownWithTitleAndAlert(
                dropDownItems: _dropdownItems,
                title: 'Customer Group',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                iconOnTap: () {
                  salesCustomersAlertDialogue(context, () {
                    Navigator.of(context).pop();
                  }, () {
                    ///Submit button Ontap
                  }, title: 'Customer Group', barrierDismissible: false);
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: TextEditingController(), title: 'Phone'),
              ),
            ],
          ),
          constHeight,

          ///Active or inactive button
          SwitchWithTitle(
              onToggle: (val) {
                setState(() {
                  status2 = val;
                });
              },
              title: 'Active / Inactive',
              value: status2),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          )
        ],
      ),
    ));
  }

  void salesCustomersAlertDialogue(
      BuildContext context, dynamic cancelOnTap, dynamic submitOnTap,
      {required String title, required bool barrierDismissible}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(55)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: Container(
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(9)),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: AppScreenUtil().screenHeight(19),
                      bottom: AppScreenUtil().screenHeight(27),
                      left: AppScreenUtil().screenWidth(35),
                      right: AppScreenUtil().screenWidth(35)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: salesCustomerAlertTitleLabelStyle,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),

                      Container(
                        width: double.infinity,
                        height: AppScreenUtil().screenHeight(30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color: taxScreenTableBoxShadowColor,
                                offset: Offset(0, 0),
                                blurRadius: 3,
                              )
                            ]),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(8)),
                        child: Center(
                          child: EditableText(
                            focusNode: FocusNode(),
                            controller: TextEditingController(),
                            style: const TextStyle(
                                fontSize: 12.0, color: blackColor),
                            cursorColor: blackColor,
                            backgroundCursorColor: Colors.blue,
                            maxLines: 1,
                            expands: false,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.left,
                            autofocus: true,
                            onChanged: (value) {},
                            onSubmitted: (value) {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(17),
                      ),

                      ///Buttons
                      Row(
                        children: [
                          ///Cancel button
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  onTap: cancelOnTap,
                                  child: CustomButton(
                                    buttonHeight:
                                        AppScreenUtil().screenHeight(20),
                                    buttonColor: whiteColor,
                                    borderRadius: 10.0,
                                    buttonText: 'Cancel',
                                    buttonLabelStyle:
                                        salesCustomerAlertCancelButtonLabelStyle,
                                    border: Border.all(
                                        width: 1, color: subDividerColor),
                                  ))),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(5),
                          ),

                          ///Submit button
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: submitOnTap,
                                child: CustomButton(
                                  buttonHeight:
                                      AppScreenUtil().screenHeight(20),
                                  buttonColor: blackColor,
                                  borderRadius: 10.0,
                                  buttonText: 'Submit',
                                  buttonLabelStyle:
                                      salesCustomerAlertSubmitButtonLabelStyle,
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 5,
                                      color:
                                          clearDataAlertYesButtonBoxShadowColor,
                                    )
                                  ],
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
