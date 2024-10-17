// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/company_settings/controller/controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_dropdown.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/company_settings_table.dart';
import '../../../../../../widgets/reason_textfield.dart';

class CompanySettings extends StatefulWidget {
  const CompanySettings({super.key});

  @override
  State<CompanySettings> createState() => _CompanySettingsState();
}

class _CompanySettingsState extends State<CompanySettings> {
  String tab1 = 'Profile Info';
  String tab2 = 'Account Settings';
  String tab3 = 'GST & TAX';
  bool tappedTab1 = true;
  bool tappedTab2 = false;
  bool tappedTab3 = false;
  String? _selectedItem;
  dynamic item = 'Profile Info';
  final List<String> _dropdownItems = ['01', '02', '03'];
  final companyAddressController = TextEditingController();
  final contactPersonController = TextEditingController();
  final websiteController = TextEditingController();
  final accountHolderController = TextEditingController();
  final accountTypeController = TextEditingController();
  final accountNumberController = TextEditingController();
  final accountNReEmberController = TextEditingController();
  final ifscController = TextEditingController();
  final upiController = TextEditingController();
  final upiIdController = TextEditingController();
  final sellerRegisteredController = TextEditingController();
  final gstController = TextEditingController();
  final panController = TextEditingController();
  final arabicName = TextEditingController();
  bool status = true;
  List<String> upiName = [
    'Munshid',
    'Munshid',
    'Munshid',
  ];
  List<String> upiID = [
    'Mun345@okicici',
    'Mun345@okicici',
    'Mun345@okicici',
  ];
  List<String> qrCodeUpload = [
    ImageCons.uploadImage,
    ImageCons.uploadImage,
    ImageCons.uploadImage,
  ];
  List<Color> tableDataAlternateColor = [
    textFieldColor,
    constantWhite,
  ];
  bool isValidCompanyName = true;
  bool isValidCompanyEmail = true;

  final companyCtrl = Get.find<CompanySettingsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: InkWell(
                  child: Container(
                      height: 24,
                      decoration: BoxDecoration(
                          color: tappedTab1 == true ? blackColor : whiteColor,
                          borderRadius: BorderRadius.circular(11)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(tab1,
                            style: tappedTab1 == true
                                ? placeOrderingAndConfirmPaymentButtonLabelStyle
                                : subCompanySettingsTextStyle,
                            textAlign: TextAlign.center),
                      )),
                  onTap: () {
                    setState(() {
                      item = tab1;
                      tappedTab1 = true;
                      tappedTab2 = false;
                      tappedTab3 = false;
                    });
                  },
                )),
                Expanded(
                    child: InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                          color: tappedTab2 == true ? blackColor : whiteColor,
                          borderRadius: BorderRadius.circular(11)),
                      height: 24,
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(tab2,
                            style: tappedTab2 == true
                                ? placeOrderingAndConfirmPaymentButtonLabelStyle
                                : subCompanySettingsTextStyle,
                            textAlign: TextAlign.center),
                      )),
                  onTap: () {
                    setState(() {
                      item = tab2;
                      tappedTab1 = false;
                      tappedTab2 = true;
                      tappedTab3 = false;
                    });
                  },
                )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      item = tab3;
                      tappedTab1 = false;
                      tappedTab2 = false;
                      tappedTab3 = true;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: tappedTab3 == true ? blackColor : whiteColor,
                          borderRadius: BorderRadius.circular(11)),
                      height: 24,
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(tab3,
                            style: tappedTab3 == true
                                ? placeOrderingAndConfirmPaymentButtonLabelStyle
                                : subCompanySettingsTextStyle,
                            textAlign: TextAlign.center),
                      )),
                )),
              ],
            ),
            Transform.translate(
                offset: Offset(0, -9),
                child: Padding(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: Divider(
                    color: blackColor,
                    thickness: 1.5,
                  ),
                )),
            SizedBox(
              height: AppScreenUtil().screenHeight(10),
            ),
            item == 'Profile Info'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColoredTextField(
                        color: textFieldColor,
                        controller: companyCtrl.companyNameController,
                        title: 'Company Name',
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'اسم الشركة',
                          style: bookedTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: textFieldColor,
                            border:
                                Border.all(color: textFieldColor, width: 3)),
                        child: SizedBox(
                            height: 35.5,
                            child: TextField(
                              maxLines: 10,
                              controller: arabicName,
                              style: searchInputTextStyle,
                              textAlign: TextAlign.center,
                              cursorColor: whiteColor,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                isDense: true,
                                hintStyle: placeholderTextStyle,
                                fillColor: blackColor,
                                focusColor: textFieldColor,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textFieldColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textFieldColor),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textFieldColor),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textFieldColor),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      ColoredTextField(
                        color: textFieldColor,
                        controller: companyCtrl.companyEmailController,
                        title: 'Company Email',
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      ReasonTextField(
                          color: textFieldColor,
                          controller: companyAddressController,
                          title: 'Company Address'),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(10),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: 83,
                            height: 24,
                            decoration: BoxDecoration(
                                color: blackColor,
                                borderRadius: BorderRadius.circular(11)),
                            padding: EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Add Outlet',
                                  style: confirmTextStyle,
                                  textAlign: TextAlign.center),
                            )),
                      ),
                      ColoredTextField(
                          color: textFieldColor,
                          controller: contactPersonController,
                          title: 'Contact Person'),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      ColoredTextField(
                          color: textFieldColor,
                          controller: websiteController,
                          title: 'Website'),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      Text(
                        'Logo',
                        style: bookedTextStyle,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 5),
                          height: 41,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: textFieldColor,
                              border:
                                  Border.all(color: textFieldColor, width: 3)),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                width: 62,
                                height: 22,
                                decoration: BoxDecoration(
                                    color: confirmColor,
                                    borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.only(bottom: 2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Browse',
                                      style: confirmTextStyle,
                                      textAlign: TextAlign.center),
                                )),
                          )),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      ColoredDropDown(
                        isVisible: true,
                        dropDownItems: _dropdownItems,
                        title: 'Country',
                        value: _selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      ColoredDropDown(
                        isVisible: true,
                        dropDownItems: _dropdownItems,
                        title: 'Currency',
                        value: _selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      ColoredDropDown(
                        isVisible: true,
                        dropDownItems: _dropdownItems,
                        title: 'Language',
                        value: _selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: bookedTextStyle,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          decoration: BoxDecoration(
                              color: textFieldColor,
                              borderRadius: BorderRadius.circular(9)),
                          child: Text(
                            '"Lorem ipsum" dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                            style: searchInputTextStyle,
                          )),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(14),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'البنود و الظروف',
                          style: bookedTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          decoration: BoxDecoration(
                              color: textFieldColor,
                              borderRadius: BorderRadius.circular(9)),
                          child: Text(
                            'لكن لا بد أن أوضح لك أن كل هذه الأفكار المغلوطة حول استنكار  النشوة وتمجيد الألم نشأت بالفعل، وسأعرض لك التفاصيل لتكتشف حقيقة وأساس تلك السعادة البشرية، فلا أحد يرفض أو يكره أو يتجنب الشعور بالسعادة، ولكن بفضل هؤلاء الأشخاص الذين لا يدركون بأن السعادة لا بد أن نستشعرها بصورة أكثر عقلانية ومنطقية فيعرضهم هذا ',
                            style: searchInputTextStyle,
                          )),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(20),
                      ),
                    ],
                  )
                : item == 'Account Settings'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bank Account Details :',
                            style: tableDetailHeadTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(10),
                          ),
                          ColoredTextField(
                              color: textFieldColor,
                              controller: accountHolderController,
                              title: 'Account Holder'),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          ColoredTextField(
                              color: textFieldColor,
                              controller: accountTypeController,
                              title: 'Account Type'),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          ColoredTextField(
                              color: textFieldColor,
                              controller: accountNumberController,
                              title: 'Account Number'),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          ColoredTextField(
                              color: textFieldColor,
                              controller: accountNReEmberController,
                              title: 'Re-Enter Account Number'),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          ColoredTextField(
                              color: textFieldColor,
                              controller: ifscController,
                              title: 'IFSC / IBAN Code'),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(30),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Divider(
                              color: blackColor,
                              thickness: 1.5,
                            ),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          Text(
                            'UPI Details :',
                            style: tableDetailHeadTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(15),
                          ),
                          ColoredTextField(
                              color: textFieldColor,
                              controller: upiController,
                              title: 'UPI Name'),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          ColoredTextField(
                              color: textFieldColor,
                              controller: upiIdController,
                              title: 'UPI ID'),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          Text(
                            'Qr Code Upload',
                            style: dashBoardTextStyle,
                          ),
                          SvgPicture.asset(
                            ImageCons.uploadImage,
                            height: 70,
                            width: 100,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),

                          ///App update button
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                width: 83,
                                height: 24,
                                decoration: BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.circular(11)),
                                padding: EdgeInsets.only(bottom: 2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Update',
                                      style: confirmTextStyle,
                                      textAlign: TextAlign.center),
                                )),
                          ),

                          SizedBox(
                            height: AppScreenUtil().screenHeight(25),
                          ),

                          ///Company Settings Table
                          CompanySettingsTable(
                              scrollIndicatorVisibility: false,
                              // tableHeight: MediaQuery.of(context).size.height/2,
                              tableDataWidgets:
                                  List.generate(upiID.length, (index) {
                                return InkWell(
                                  child: Container(
                                    height: AppScreenUtil().screenHeight(38),
                                    width: AppScreenUtil().screenWidth(350),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            color: searchTextColor
                                                .withOpacity(0.15)),
                                        color: Colors.transparent),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              AppScreenUtil().screenWidth(18)),

                                      ///scrolling row
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(80),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ///Upi name
                                                  Text(
                                                    upiName[index],
                                                    style:
                                                        tableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            color: Colors.transparent,
                                            width: AppScreenUtil()
                                                .screenWidth(110),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ///Upi name
                                                Text(upiName[index],
                                                    style:
                                                        tableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ],
                                            ),
                                          ),
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(95),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    qrCodeUpload[index],
                                                    height: 23,
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                );
                              }),
                              tableRowWidth: 350,
                              titleWidgets: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(80),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'UPI Name',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'UPI ID',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(95),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'QR Code Upload',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                              ]),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(20),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Enter Tax Details',
                                style: tableDetailHeadTextStyle,
                              ),
                              FlutterSwitch(
                                width: 36,
                                height: 16,
                                toggleSize: 11.0,
                                value: status,
                                borderRadius: 30.0,
                                padding: 2.0,
                                toggleColor:
                                    status == false ? confirmColor : greenColor,
                                switchBorder: Border.all(
                                  color: status == false
                                      ? confirmColor
                                      : greenColor,
                                  width: 1,
                                ),
                                toggleBorder: Border.all(
                                  color: status == false
                                      ? confirmColor
                                      : greenColor,
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
                          SizedBox(
                            height: AppScreenUtil().screenHeight(10),
                          ),
                          ColoredTextField(
                              color: textFieldColor,
                              controller: sellerRegisteredController,
                              title: 'Seller Registered Name'),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          ColoredTextField(
                            color: textFieldColor,
                            controller: gstController,
                            title: 'GST Number',
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          ColoredTextField(
                              color: textFieldColor,
                              controller: panController,
                              title: 'Pan Number'),
                        ],
                      ),
          ],
        ));
  }

  ///Validate text fields
  validateFields() {
    isValidCompanyName =
        AppUtils.validationOfName(companyCtrl.companyNameController.text);
    isValidCompanyEmail =
        AppUtils.validationOfEmail(companyCtrl.companyEmailController.text);
  }
}
