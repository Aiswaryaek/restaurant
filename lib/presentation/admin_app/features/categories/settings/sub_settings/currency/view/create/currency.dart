// ignore_for_file: prefer_const_constructors

import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../../widgets/colored_textfield.dart';
import '../../controller/currency_controller.dart';

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  final List<String> symbolPosition = ['Left', 'Right'];
  dynamic selectedSymbolPosition = 'Left';

  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  bool isValidName = true;
  bool isValidSymbol = true;
  bool isValidCurrencySubUnit = true;
  bool isValidCurrencyUnit = true;
  bool isValidCurrencyCode = true;
  bool isValidUnitPerUSD = true;
  bool isValidUnitPerUnit = true;
  final currencyCtrl = Get.find<CurrencyController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 40),
        child: Obx(
          () => (currencyCtrl.isCurrencyLoading.value == true)
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: confirmColor,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColoredTextField(
                        errorMessage: 'Enter a valid name*',
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9_.]')),
                        ],
                        isValidData: currencyCtrl.isValidName.value,
                        errorMsgTextStyle: errorTextTextStyle,
                        color: textFieldColor,
                        controller: currencyCtrl.nameController,
                        title: 'Name'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    ColoredTextField(
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[^|\-|\,|\ ]'))
                        ],
                        errorMessage: 'Enter a valid Symbol*',
                        isValidData: currencyCtrl.isValidSymbol.value,
                        errorMsgTextStyle: errorTextTextStyle,
                        color: textFieldColor,
                        controller: currencyCtrl.symbolController,
                        title: 'Symbol'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    Text(
                      'Country',
                      style: bookedTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    CSCPicker(
                      selectedItemStyle: searchInputTextStyle,
                      flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                      disabledDropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.transparent,
                      ),
                      dropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: textFieldColor,
                      ),
                      dropdownHeadingStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      showCities: false,
                      showStates: false,
                      dropdownItemStyle: subTitleTextStyle,
                      // searchBarRadius: 41,
                      defaultCountry: CscCountry.India,
                      onStateChanged: (value) {
                        setState(() {
                          ///store value in state variable
                          stateValue = value;
                        });
                      },

                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {
                        setState(() {
                          ///store value in city variable
                          cityValue = value;
                        });
                      },
                      countryDropdownLabel: currencyCtrl.countryValue.value,
                      onCountryChanged: (value) {
                        setState(() {
                          currencyCtrl.countryValue.value = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    ColoredTextField(
                        errorMessage: 'Enter a valid Currency Sub Unit*',
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9_.]')),
                        ],
                        isValidData: currencyCtrl.isValidCurrencySubUnit.value,
                        errorMsgTextStyle: errorTextTextStyle,
                        color: textFieldColor,
                        controller: currencyCtrl.currencySubUnitController,
                        title: 'Currency Sub Unit'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    ColoredTextField(
                        errorMessage: 'Enter a valid Currency Unit*',
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9_.]')),
                        ],
                        isValidData: currencyCtrl.isValidCurrencyUnit.value,
                        errorMsgTextStyle: errorTextTextStyle,
                        color: textFieldColor,
                        controller: currencyCtrl.currencyUnitController,
                        title: 'Currency Unit'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    ColoredTextField(
                        errorMessage: 'Enter a valid Currency Code*',
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9_.]')),
                        ],
                        isValidData: currencyCtrl.isValidCurrencyCode.value,
                        errorMsgTextStyle: errorTextTextStyle,
                        color: textFieldColor,
                        controller: currencyCtrl.currencyCodeController,
                        title: 'Currency Code'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    ColoredTextField(
                        errorMessage: 'Enter a valid Unit Per USD*',
                        keyboardType: TextInputType.number,
                        isValidData: currencyCtrl.isValidUnitPerUSD.value,
                        errorMsgTextStyle: errorTextTextStyle,
                        color: textFieldColor,
                        controller: currencyCtrl.unitPerUsdController,
                        title: 'Unit Per USD'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    ColoredTextField(
                        errorMessage: 'Enter a valid Unit Per Unit*',
                        keyboardType: TextInputType.number,
                        isValidData: currencyCtrl.isValidUnitPerUnit.value,
                        errorMsgTextStyle: errorTextTextStyle,
                        color: textFieldColor,
                        controller: currencyCtrl.usdPerUnitController,
                        title: 'USD Per Unit'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    ColoredDropDown(
                      isVisible: true,
                      dropDownItems: symbolPosition,
                      title: 'Symbol Position',
                      value: currencyCtrl.selectedSymbolPosition.value,
                      onChanged: (newValue) {
                        setState(() {
                          currencyCtrl.selectedSymbolPosition.value = newValue!;
                        });
                      },
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    Text(
                      'Active / InActive',
                      style: bookedTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterSwitch(
                          width: 43,
                          height: 18,
                          toggleSize: 11.0,
                          value: currencyCtrl.status.value,
                          borderRadius: 60.0,
                          padding: 2.0,
                          toggleColor: currencyCtrl.status.value == false
                              ? confirmColor
                              : greenColor,
                          switchBorder: Border.all(
                            color: currencyCtrl.status.value == false
                                ? confirmColor
                                : greenColor,
                            width: 1,
                          ),
                          toggleBorder: Border.all(
                            color: currencyCtrl.status.value == false
                                ? confirmColor
                                : greenColor,
                            width: 1,
                          ),
                          activeColor: whiteColor,
                          inactiveColor: whiteColor,
                          onToggle: (val) {
                            setState(() {
                              currencyCtrl.status.value = val;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
        ));
  }
}
