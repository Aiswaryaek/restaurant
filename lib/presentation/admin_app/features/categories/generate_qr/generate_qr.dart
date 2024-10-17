// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';
import '../../../../../utiles/image_constant.dart';
import '../../../widgets/colored_dropdown.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  int? selectedOption = 0;
  final printQualityController = TextEditingController();
  bool isChecked = false;
  Color borderColor = Colors.blue;
  final companyNameController = TextEditingController();
  bool isGenerated = false;
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppScreenUtil().screenHeight(25),),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Generate QR / Barcode',
                    style: btnTextStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Transform.translate(
                    offset: Offset(0, -20),
                    child: SvgPicture.asset(
                      ImageCons.save,
                      height: 23,
                      width: 12,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(12),
                ),
                ColoredDropDown(
                  isVisible: true,
                  dropDownItems: _dropdownItems,
                  title: 'Branch',
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
                  title: 'Category',
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
                  title: 'POS Category',
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
                  title: 'Product Name',
                  value: _selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(20),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isSubmitted = true;
                    });
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 61,
                        height: 18,
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: blackColor)),
                        padding: EdgeInsets.only(bottom: 2),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Submit',
                              style: inventoryCreateButtonLabelStyle,
                              textAlign: TextAlign.center),
                        )),
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(30),
                ),
                isSubmitted== true? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product ID',
                          style: bookedTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Text(
                          'Product Name',
                          style: bookedTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Text(
                          'Image',
                          style: bookedTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Text(
                          'Varient',
                          style: bookedTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Text(
                          'UOM',
                          style: bookedTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Text(
                          'Sales Price',
                          style: bookedTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ':',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Text(
                          ':',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Text(
                          ':',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Text(
                          ':',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Text(
                          ':',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Text(
                          ':',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(0, 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PRO53452',
                            style: bookedTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(25),
                          ),
                          Text(
                            'Orange',
                            style: bookedTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(20),
                          ),
                          Image.network(
                            'https://img.freepik.com/free-photo/orange-juicy-ripe-circle-citrus_1172-203.jpg',
                            height: 25,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(20),
                          ),
                          Text(
                            'Orange',
                            style: bookedTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(25),
                          ),
                          Text(
                            'lorem',
                            style: bookedTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(25),
                          ),
                          Text(
                            '500.00',
                            style: bookedTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(25),
                          ),
                        ],
                      ),
                    )
                  ],
                ):SizedBox(),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                isSubmitted== true? Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isGenerated = true;
                      });
                    },
                    child: Container(
                      width: 136,
                      height: 30,
                      decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: blackColor)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.crop_free,
                            size: 15,
                            color: whiteColor,
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(5),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Generate QR / Barcode',
                                style: inventoryCreateButtonLabelStyle,
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                ):SizedBox(),
                SizedBox(
                  height: AppScreenUtil().screenHeight(30),
                ),
                isGenerated == true
                    ? Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: confirmColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Other payments radio button
                          Container(
                            color: Colors.transparent,
                            child: Transform.translate(
                              offset: Offset(-4.5, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<int>(
                                    fillColor:
                                    MaterialStateProperty.resolveWith(
                                            (states) => whiteColor),
                                    activeColor: whiteColor,
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    value: 0,
                                    groupValue: selectedOption,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedOption = value;
                                      });
                                      print(
                                          'Selected Option : $selectedOption');
                                    },
                                  ),
                                  Text(
                                    'QR Code',
                                    style: inventoryCreateButtonLabelStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// Customer payment radio button
                          Container(
                            color: Colors.transparent,
                            child: Transform.translate(
                              offset: Offset(-4.5, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<int>(
                                    fillColor:
                                    MaterialStateProperty.resolveWith(
                                            (states) => whiteColor),
                                    focusColor: whiteColor,
                                    activeColor: whiteColor,
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    value: 1,
                                    groupValue: selectedOption,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedOption = value;
                                      });
                                      print(
                                          'Selected Option : $selectedOption');
                                    },
                                  ),
                                  Text(
                                    'Barcode',
                                    style: inventoryCreateButtonLabelStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      selectedOption == 0
                          ? Column(
                        children: [
                          SizedBox(
                            height: AppScreenUtil().screenHeight(20),
                          ),
                          SizedBox( height: 83,
                            child: SfBarcodeGenerator(barColor: whiteColor,
                              value: _selectedItem,
                              symbology: QRCode(),
                              showValue: false,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Print Quantity',
                                        style: placeholderTextStyle,
                                      ),
                                      SizedBox(
                                        height: AppScreenUtil()
                                            .screenHeight(8),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                7),
                                            color: whiteColor
                                                .withOpacity(0.2),
                                            border: Border.all(
                                                color: whiteColor
                                                    .withOpacity(0.2),
                                                width: 0)),
                                        child: SizedBox(
                                            height: 30,
                                            width: 82,
                                            child: Padding(padding: EdgeInsets.only(bottom: 14),child: TextField(
                                              controller:
                                              printQualityController,
                                              style:
                                              placeholderTextStyle,
                                              cursorColor: whiteColor,
                                              decoration:
                                              InputDecoration(
                                                contentPadding:
                                                EdgeInsets.all(8),
                                                isDense: true,
                                                fillColor: blackColor,
                                                focusColor: whiteColor
                                                    .withOpacity(0.2),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                ),
                                                errorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                ),
                                              ),
                                            ),)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                    AppScreenUtil().screenWidth(8),
                                  ),
                                  Container(
                                    padding:
                                    EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color:
                                        whiteColor.withOpacity(0.2),
                                        borderRadius:
                                        BorderRadius.circular(7)),
                                    child: SvgPicture.asset(
                                      ImageCons.imgPrinter,
                                      height: 19,
                                      color: whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Company Name',
                                        style: placeholderTextStyle,
                                      ),
                                      SizedBox(
                                        height: AppScreenUtil()
                                            .screenHeight(8),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                7),
                                            color: whiteColor
                                                .withOpacity(0.2),
                                            border: Border.all(
                                                color: whiteColor
                                                    .withOpacity(0.2),
                                                width: 0)),
                                        child: SizedBox(
                                            height: 30,
                                            width: 82,
                                            child: Padding(padding: EdgeInsets.only(bottom: 14),child: TextField(
                                              controller:
                                              companyNameController,
                                              style:
                                              placeholderTextStyle,
                                              cursorColor: whiteColor,
                                              decoration:
                                              InputDecoration(
                                                contentPadding:
                                                EdgeInsets.all(8),
                                                isDense: true,
                                                fillColor: blackColor,
                                                focusColor: whiteColor
                                                    .withOpacity(0.2),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                ),
                                                errorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                ),
                                              ),
                                            ),)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                    AppScreenUtil().screenWidth(5),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            11, 8.2, 11, 8.2),
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: whiteColor
                                              .withOpacity(0.2),
                                          borderRadius:
                                          BorderRadius.circular(7),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isChecked = !isChecked;
                                            });
                                          },
                                          child: Container(
                                            height: 13,
                                            width: 13.5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  1),
                                              border: Border.all(
                                                width: 1.2,
                                                color: whiteColor,
                                              ),
                                            ),
                                            child: isChecked
                                                ? Center(
                                              child: Icon(
                                                Icons.check,
                                                size: 11.5,
                                                color: whiteColor,
                                              ),
                                            )
                                                : SizedBox(),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                          : Column(
                        children: [
                          SizedBox(
                            height: AppScreenUtil().screenHeight(20),
                          ),
                          SizedBox(
                            height: 83,
                            width: 110,
                            child: SfBarcodeGenerator(barColor: whiteColor,
                              value: _selectedItem,
                              symbology: Code128(),
                              showValue: false,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Print Quantity',
                                          style: placeholderTextStyle,
                                        ),
                                        SizedBox(
                                          height: AppScreenUtil()
                                              .screenHeight(8),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  7),
                                              color: whiteColor
                                                  .withOpacity(0.2),
                                              border: Border.all(
                                                  color: whiteColor
                                                      .withOpacity(0.2),
                                                  width: 0)),
                                          child: SizedBox(
                                              height: 30,
                                              width: 82,
                                              child: Padding(padding: EdgeInsets.only(bottom: 14),child: TextField(
                                                controller:
                                                printQualityController,
                                                style:
                                                placeholderTextStyle,
                                                cursorColor: whiteColor,
                                                decoration:
                                                InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.all(8),
                                                  isDense: true,
                                                  fillColor: blackColor,
                                                  focusColor: whiteColor
                                                      .withOpacity(0.2),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent),
                                                  ),
                                                  errorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent),
                                                  ),
                                                  focusedErrorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent),
                                                  ),
                                                ),
                                              ),)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil()
                                          .screenWidth(8),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          8, 8, 8, 8),
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: whiteColor
                                              .withOpacity(0.2),
                                          borderRadius:
                                          BorderRadius.circular(7)),
                                      child: SvgPicture.asset(
                                        ImageCons.imgPrinter,
                                        height: 19,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(23),
                              ),
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Company Name',
                                            style: placeholderTextStyle,
                                          ),
                                          SizedBox(
                                            height: AppScreenUtil()
                                                .screenHeight(8),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(7),
                                                color: whiteColor
                                                    .withOpacity(0.2),
                                                border: Border.all(
                                                    color: whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    width: 0)),
                                            child: SizedBox(
                                                height: 30,
                                                width: 82,
                                                child: Padding(padding: EdgeInsets.only(bottom: 14),child: TextField(
                                                  controller:
                                                  companyNameController,
                                                  style:
                                                  placeholderTextStyle,
                                                  cursorColor:
                                                  whiteColor,
                                                  decoration:
                                                  InputDecoration(
                                                    contentPadding:
                                                    EdgeInsets.all(
                                                        8),
                                                    isDense: true,
                                                    fillColor:
                                                    blackColor,
                                                    focusColor:
                                                    whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),)),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil()
                                            .screenWidth(5),
                                      ),
                                      Align(
                                        alignment:
                                        Alignment.bottomCenter,
                                        child: Container(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                10.5,
                                                8.2,
                                                10.5,
                                                8.2),
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: whiteColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  7),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isChecked =
                                                  !isChecked;
                                                });
                                              },
                                              child: Container(
                                                height: 13,
                                                width: 13.5,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(1),
                                                  border: Border.all(
                                                    width: 1.2,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                                child: isChecked
                                                    ? Center(
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 11,
                                                    color:
                                                    whiteColor,
                                                  ),
                                                )
                                                    : SizedBox(),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Native Name',
                                            style: placeholderTextStyle,
                                          ),
                                          SizedBox(
                                            height: AppScreenUtil()
                                                .screenHeight(8),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(7),
                                                color: whiteColor
                                                    .withOpacity(0.2),
                                                border: Border.all(
                                                    color: whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    width: 0)),
                                            child: SizedBox(
                                                height: 30,
                                                width: 82,
                                                child: Padding(padding: EdgeInsets.only(bottom: 14),child: TextField(
                                                  controller:
                                                  companyNameController,
                                                  style:
                                                  placeholderTextStyle,
                                                  cursorColor:
                                                  whiteColor,
                                                  decoration:
                                                  InputDecoration(
                                                    contentPadding:
                                                    EdgeInsets.all(
                                                        8),
                                                    isDense: true,
                                                    fillColor:
                                                    blackColor,
                                                    focusColor:
                                                    whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),)),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil()
                                            .screenWidth(9),
                                      ),
                                      Align(
                                        alignment:
                                        Alignment.bottomCenter,
                                        child: Container(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                10.5,
                                                8.2,
                                                10.5,
                                                8.2),
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: whiteColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  7),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isChecked =
                                                  !isChecked;
                                                });
                                              },
                                              child: Container(
                                                height: 13,
                                                width: 13.5,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(1),
                                                  border: Border.all(
                                                    width: 1.2,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                                child: isChecked
                                                    ? Center(
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 11,
                                                    color:
                                                    whiteColor,
                                                  ),
                                                )
                                                    : SizedBox(),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Product Name',
                                            style: placeholderTextStyle,
                                          ),
                                          SizedBox(
                                            height: AppScreenUtil()
                                                .screenHeight(8),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(7),
                                                color: whiteColor
                                                    .withOpacity(0.2),
                                                border: Border.all(
                                                    color: whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    width: 0)),
                                            child: SizedBox(
                                                height: 30,
                                                width: 82,
                                                child: Padding(padding: EdgeInsets.only(bottom: 14),child: TextField(
                                                  controller:
                                                  companyNameController,
                                                  style:
                                                  placeholderTextStyle,
                                                  cursorColor:
                                                  whiteColor,
                                                  decoration:
                                                  InputDecoration(
                                                    contentPadding:
                                                    EdgeInsets.all(
                                                        8),
                                                    isDense: true,
                                                    fillColor:
                                                    blackColor,
                                                    focusColor:
                                                    whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),)),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil()
                                            .screenWidth(9),
                                      ),
                                      Align(
                                        alignment:
                                        Alignment.bottomCenter,
                                        child: Container(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                10.5,
                                                8.2,
                                                10.5,
                                                8.2),
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: whiteColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  7),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isChecked =
                                                  !isChecked;
                                                });
                                              },
                                              child: Container(
                                                height: 13,
                                                width: 13.5,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(1),
                                                  border: Border.all(
                                                    width: 1.2,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                                child: isChecked
                                                    ? Center(
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 11,
                                                    color:
                                                    whiteColor,
                                                  ),
                                                )
                                                    : SizedBox(),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sales Price',
                                            style: placeholderTextStyle,
                                          ),
                                          SizedBox(
                                            height: AppScreenUtil()
                                                .screenHeight(8),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(7),
                                                color: whiteColor
                                                    .withOpacity(0.2),
                                                border: Border.all(
                                                    color: whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    width: 0)),
                                            child: SizedBox(
                                                height: 30,
                                                width: 82,
                                                child: Padding(padding: EdgeInsets.only(bottom: 14),child: TextField(
                                                  controller:
                                                  companyNameController,
                                                  style:
                                                  placeholderTextStyle,
                                                  cursorColor:
                                                  whiteColor,
                                                  decoration:
                                                  InputDecoration(
                                                    contentPadding:
                                                    EdgeInsets.all(
                                                        8),
                                                    isDense: true,
                                                    fillColor:
                                                    blackColor,
                                                    focusColor:
                                                    whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),)),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil()
                                            .screenWidth(9),
                                      ),
                                      Align(
                                        alignment:
                                        Alignment.bottomCenter,
                                        child: Container(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                10.5,
                                                8.2,
                                                10.5,
                                                8.2),
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: whiteColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  7),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isChecked =
                                                  !isChecked;
                                                });
                                              },
                                              child: Container(
                                                height: 13,
                                                width: 13.5,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(1),
                                                  border: Border.all(
                                                    width: 1.2,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                                child: isChecked
                                                    ? Center(
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 11,
                                                    color:
                                                    whiteColor,
                                                  ),
                                                )
                                                    : SizedBox(),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Expiry Date',
                                            style: placeholderTextStyle,
                                          ),
                                          SizedBox(
                                            height: AppScreenUtil()
                                                .screenHeight(8),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(7),
                                                color: whiteColor
                                                    .withOpacity(0.2),
                                                border: Border.all(
                                                    color: whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    width: 0)),
                                            child: SizedBox(
                                                height: 30,
                                                width: 82,
                                                child: Padding(padding: EdgeInsets.only(bottom: 14),child: TextField(
                                                  controller:
                                                  companyNameController,
                                                  style:
                                                  placeholderTextStyle,
                                                  cursorColor:
                                                  whiteColor,
                                                  decoration:
                                                  InputDecoration(
                                                    contentPadding:
                                                    EdgeInsets.all(
                                                        8),
                                                    isDense: true,
                                                    fillColor:
                                                    blackColor,
                                                    focusColor:
                                                    whiteColor
                                                        .withOpacity(
                                                        0.2),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),)),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil()
                                            .screenWidth(9),
                                      ),
                                      Align(
                                        alignment:
                                        Alignment.bottomCenter,
                                        child: Container(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                10.5,
                                                8.2,
                                                10.5,
                                                8.2),
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: whiteColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  7),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isChecked =
                                                  !isChecked;
                                                });
                                              },
                                              child: Container(
                                                height: 13,
                                                width: 13.5,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(1),
                                                  border: Border.all(
                                                    width: 1.2,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                                child: isChecked
                                                    ? Center(
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 11,
                                                    color:
                                                    whiteColor,
                                                  ),
                                                )
                                                    : SizedBox(),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
                    : SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
