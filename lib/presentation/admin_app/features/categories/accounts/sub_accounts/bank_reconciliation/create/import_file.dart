// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../models/categories_model.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/editableTable.dart';
import 'bank_charge_difference_setup.dart';

class BankConciliationImportFile extends StatefulWidget {
  const BankConciliationImportFile({super.key});

  @override
  State<BankConciliationImportFile> createState() =>
      _BankConciliationImportFileState();
}

class _BankConciliationImportFileState
    extends State<BankConciliationImportFile> {
  final fileUploadController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final items = <CategoriesModel>[];

  List<String> date = [
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
  ];
  List<String> amount = [
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
  ];
  List<String> bankAmount = [
    '505',
    '505',
    '505',
    '505',
    '505',
    '505',
  ];
  List<String> bankCharge = [
    '45',
    '45',
    '45',
    '45',
    '45',
    '45',
  ];
  List<String> approvalNo = [
    '1234',
    '1234',
    '1234',
    '1234',
    '1234',
    '1234',
  ];
  List<String> bankDate = [
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
  ];

  bool isPosted = false;

  @override
  void initState() {
    items.add(CategoriesModel('Date', ''));
    items.add(CategoriesModel('Amount', ''));
    items.add(CategoriesModel('Bank Amount', ''));
    items.add(CategoriesModel('Bank Charge', ''));
    items.add(CategoriesModel('Approval No', ''));
    items.add(CategoriesModel('Bank Date', ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isPosted==false?SizedBox(
        height: MediaQuery.of(context).size.height / 1.8,
        child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Import File',
                          style: tableHeadingLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'File Upload',
                                        style: bookedTextStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        color: textFieldColor,
                                      ),
                                      child: SizedBox(
                                          height: 33.9,
                                          child: TextFormField(
                                            controller: fileUploadController,
                                            style: searchInputTextStyle,
                                            cursorColor: whiteColor,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(8),
                                              isDense: true,
                                              fillColor: blackColor,
                                              focusColor: textFieldColor,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8)),
                                                borderSide: BorderSide(
                                                    color: textFieldColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8)),
                                                borderSide: BorderSide(
                                                    color: textFieldColor),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8)),
                                                borderSide: BorderSide(
                                                    color: textFieldColor),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8)),
                                                borderSide: BorderSide(
                                                    color: textFieldColor),
                                              ),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                                Transform.translate(
                                  offset: Offset(-1, 11.1),
                                  child: Container(
                                    width: 45,
                                    padding: EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(7),
                                          topRight: Radius.circular(7),
                                        ),
                                        color: blackColor),
                                    child: SvgPicture.asset(
                                      ImageCons.imgImportFileIcon,
                                      height: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              child: Transform.translate(
                                offset: Offset(0, 11),
                                child: Container(
                                    width: 92,
                                    height: 31,
                                    decoration: BoxDecoration(
                                        color: blackColor,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(color: blackColor)),
                                    padding: EdgeInsets.only(bottom: 2),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Submit',
                                          style: completeButtonTextStyle,
                                          textAlign: TextAlign.center),
                                    )),
                              ),
                              onTap: () {},
                            )
                          ],
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Divider(
                    color: blackColor,
                    thickness: 0.8,
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(3),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Import From',
                        style: bookedTextStyle,
                      ),
                      SizedBox(
                        width: AppScreenUtil().screenWidth(18),
                      ),
                      Text(
                        'Lorum file imported',
                        style: loremFileImportedTextStyle,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 16,right: 16
                  ),
                  color: Colors.transparent,
                  height: 60,
                  child:ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index].text!,
                          style: bookedTextStyleBold,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Container(
                          width: 90,
                          height: 33.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: textFieldColor),
                          child: DropdownButton<String>(
                            style: searchInputTextStyle,
                            padding: const EdgeInsets.only(left: 10, right: 10),
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
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: blackColor,
                            ),
                            iconSize: 20,
                            isExpanded: true,
                            underline:
                            const SizedBox(), // Removes the default underline
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 20);
                    },
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(20),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: EditableTable(
                      tableDataWidgets: List.generate(date.length, (index) {
                        return InkWell(
                          child: Container(
                            height: AppScreenUtil().screenHeight(30),
                            width: AppScreenUtil().screenWidth(560),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                    inventorySelectionColor.withOpacity(0.7)),
                                color: Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(18)),

                              ///scrolling row
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            date[index],
                                            style: cartItemTitleStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      )),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            amount[index],
                                            style: cartItemTitleStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      )),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(bankAmount[index],
                                            style: cartItemTitleStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(bankCharge[index],
                                            style: cartItemTitleStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(approvalNo[index],
                                            style: cartItemTitleStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(bankDate[index],
                                            style: cartItemTitleStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            // bottomBar(context);
                          },
                        );
                      }),
                      tableRowWidth: 560,
                      titleWidgets: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(90),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Date',
                                style:
                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Amount',
                                  style:
                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                  maxLines: 1,
                                ),
                              ],
                            )),
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bank Amount',
                                  style:
                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                  maxLines: 1,
                                ),
                              ],
                            )),
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bank Charge',
                                  style:
                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                  maxLines: 1,
                                ),
                              ],
                            )),
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Approval No',
                                  style:
                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                  maxLines: 1,
                                ),
                              ],
                            )),
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bank Date',
                                  style:
                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                  maxLines: 1,
                                ),
                              ],
                            )),
                      ]),
                ),
                SizedBox(height: AppScreenUtil().screenHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   GestureDetector(
                     onTap: (){
                       setState(() {
                         isPosted= true;
                       });
                     },
                     child:  Container(
                         width: 92,
                         height: 28,
                         decoration: BoxDecoration(
                             color: blackColor,
                             borderRadius: BorderRadius.circular(7),
                             border: Border.all(color: blackColor)),
                         padding: EdgeInsets.only(bottom: 2),
                         child: Align(
                           alignment: Alignment.center,
                           child: Text('Post',
                               style: completeButtonTextStyle,
                               textAlign: TextAlign.center),
                         )),
                   ),
                    SizedBox(
                      width: AppScreenUtil().screenWidth(10),
                    ),
                    Container(
                        width: 92,
                        height: 28,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: blackColor)),
                        padding: EdgeInsets.only(bottom: 2),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Cancel',
                              style: taxCreateEnterAPassWordLabelStyle,
                              textAlign: TextAlign.center),
                        )),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(40),
                ),
              ],
            ))):BankConciliationChargeDifference();
  }
}
