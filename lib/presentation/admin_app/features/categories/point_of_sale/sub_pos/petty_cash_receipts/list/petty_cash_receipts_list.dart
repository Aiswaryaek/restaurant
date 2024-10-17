// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/coloredDateField.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/colored_textfield.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class PettyCashReceiptsList extends StatefulWidget {
  const PettyCashReceiptsList({super.key});

  @override
  State<PettyCashReceiptsList> createState() => _PettyCashReceiptsListState();
}

class _PettyCashReceiptsListState extends State<PettyCashReceiptsList> {
  ScrollController pettyCashReceiptsTableController = ScrollController();
  double pettyCashReceiptsIndicatorPosition = 0.0;
  List<String> docNo = [
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001',
    'SH001'
  ];

  List<String> expenseType = [
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence',
    'Maintanence'
  ];
  List<String> date = [
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024',
    '13/09/2024'
  ];
  List<String> amount = [
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000'
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final passwordController = TextEditingController();
  final docNoController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();

  dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {
      if (kDebugMode) {
        print("Date is not selected");
      }
    }
  }

  @override
  void initState() {
    pettyCashReceiptsTableController.addListener(() {
      setState(() {
        pettyCashReceiptsIndicatorPosition = (pettyCashReceiptsTableController.offset /
            pettyCashReceiptsTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pettyCashReceiptsTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 10,bottom: 40),child: Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: DefaultProductTable( visible: true,
                scrollController: pettyCashReceiptsTableController,
                slidingIndicatorPosition: pettyCashReceiptsIndicatorPosition,
                tableDataWidgets: List.generate(date.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(456),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: tableDataAlternateColor[
                          index % tableDataAlternateColor.length],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(5)),

                          ///scrolling row
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child:  Text(docNo[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(date[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Center(
                                      child:  Text(
                                        expenseType[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(amount[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      bottomBar(context);
                    },
                  );
                }),
                tableRowWidth: 456,
                titleWidgets: [
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Doc No',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Date',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(120),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Expense Type',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Amount',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        )
      ],
    ),);
  }
  void editPettyCashReceipts(BuildContext context,) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0), // Set border radius here
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
            // height: AppScreenUtil().screenHeight(101),
            width: AppScreenUtil().screenWidth(226),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Petty Cash Receipt Edit',
                  style: branchSettingsTextFieldTitleLabelStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                Text(
                  'Password',
                  style: clearDataAlertNoButtonLabelStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(8),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: textFieldColor,
                      border: Border.all(color: textFieldColor, width: 3)),
                  child: SizedBox(
                      height: 29,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: searchInputTextStyle,
                        // readOnly:widget.readOnly ,
                        cursorColor: whiteColor,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(7),
                          isDense: true,
                          hintStyle: loremTextStyle,
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
                  height: AppScreenUtil().screenHeight(15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child:  Container(
                         width: 83,
                         height: 24,
                         decoration: BoxDecoration(
                             color: whiteColor,
                             borderRadius: BorderRadius.circular(11),
                             border: Border.all(color: blackColor)),
                         padding: EdgeInsets.only(bottom: 2),
                         child: Align(
                           alignment: Alignment.center,
                           child: Text('Cancel',
                               style: categoryMenuTextStyle,
                               textAlign: TextAlign.center),
                         )),
                   ),
                    SizedBox(
                      width: AppScreenUtil().screenWidth(8),
                    ),
                    GestureDetector(
                      child: Container(
                          width: 83,
                          height: 24,
                          decoration: BoxDecoration(
                              color: blackColor,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(color: blackColor)),
                          padding: EdgeInsets.only(bottom: 2),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Submit',
                                style: confirmTextStyle,
                                textAlign: TextAlign.center),
                          )),
                      onTap: () {
                        Navigator.pop(context);
                        addPettyCashReceipts(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void addPettyCashReceipts(BuildContext context,) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(18, 18, 18, 25),
                    width: AppScreenUtil().screenWidth(226),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Edit Petty Cash Receipt',
                          style: rolesAndPermissionModuleAccessTabLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        ColoredTextField(textFieldHeight: 30,
                            color: textFieldColor,
                            controller: docNoController,
                            title: 'Doc No'),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredDropDown(textFieldHeight: 37,
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
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredDropDown(
                          textFieldHeight: 37,
                          isVisible: true,
                          dropDownItems: _dropdownItems,
                          title: 'Expense Type',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredTextField(textFieldHeight: 30,
                            color: textFieldColor,
                            controller: amountController,
                            title: 'Amount'),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredDateField(textFieldHeight: 37,
                          controller: dateController,
                          title: 'Date',
                          onTap: () async {
                            dateSelection(controller: dateController);
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 83,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.all(color: blackColor)),
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Cancel',
                                        style: categoryMenuTextStyle,
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(8),
                            ),
                            GestureDetector(
                              child: Container(
                                  width: 83,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color: blackColor,
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.all(color: blackColor)),
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Submit',
                                        style: confirmTextStyle,
                                        textAlign: TextAlign.center),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
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
                   GestureDetector(
                     onTap: (){
                       editPettyCashReceipts(context);
                     },
                     child:  InventoryBottomSheetItemLayout(
                         iconHeight: 15.29,
                         iconPath: ImageCons.edit,
                         iconWidth: 15.29),
                   ),
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
