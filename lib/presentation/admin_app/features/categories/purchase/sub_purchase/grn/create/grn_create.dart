// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/gn_create_table_layout.dart';

import '../../../../../../../../models/product_categories_model.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
      
class GrnCreate extends StatefulWidget {
  const GrnCreate({super.key});

  @override
  State<GrnCreate> createState() => _GrnCreateState();
}

class _GrnCreateState extends State<GrnCreate> {
  String? _selectedItem;
  late List<TextEditingController> textControllers;
  late List<FocusNode> focusNodes;

  String? selected;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final dateinput = TextEditingController();
  final referenceController = TextEditingController();
  dynamic tappedProducts = false;
  dynamic tappedUom = false;
  dynamic tappedHandQty = false;
  dynamic tappedTransferQty = false;
  int? tappedType = 0;
  dynamic currentTab = 'Extra Charge';
  final option = <ProductCategoriesModel>[];
  List<String> codeList = ['ABC12345', 'ABC12345', 'ABC12345', 'ABC12345'];
  List<String> productList = ['Lorem', 'Lorem', 'Lorem', 'Lorem'];
  List<String> uomList = ['Medium', 'Medium', 'Medium', 'Medium'];
  List<String> orderQtyList = ['150', '150', '150', '150'];
  List<String> receivedQtyList = ['100', '350', '130', '150'];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  int _selectedRadio = 0;
  final transferQty = TextEditingController();
  String? tableSelected;
  final List<String> tableDropDown = ['Asset', ' Assets'];

  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
    print('Tapped radio: $_selectedRadio');
  }

  void onTextChanged(int index, String newText) {
    print('Text at index $index updated: $newText');
  }

  ScrollController grnTableScrollController = ScrollController();
  double grnTableIndicatorPosition = 0.0;
  @override
  void initState() {
    dateinput.text = "";
    option.add(ProductCategoriesModel('Extra Charge',''));
    option.add(ProductCategoriesModel('Valuation',''));
    grnTableScrollController.addListener(() {
      setState(() {
        grnTableIndicatorPosition = (grnTableScrollController.offset /
                grnTableScrollController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    textControllers = List.generate(
      receivedQtyList.length,
      (index) => TextEditingController(text: receivedQtyList[index]),
    );
    focusNodes = List.generate(receivedQtyList.length, (index) => FocusNode());
    super.initState();
  }

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
  void dispose() {
    grnTableScrollController.dispose();
    for (var controller in textControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  TextEditingController receivedQtyTextEditingController =
      TextEditingController(text: '60');
  TextEditingController orderQtyTextEditingController =
      TextEditingController(text: '100');

  FocusNode receivedQtyFocusNode = FocusNode();

  FocusNode orderQtyFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: AppScreenUtil().screenHeight(5),
      ),
      Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: const Offset(0, -6),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'BILL/2023/10/0001',
                    style: billTextStyle,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CommonDropDownWithTitle(
                        dropDownItems: _dropdownItems,
                        title: 'Purchase Order',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CommonDropDownWithTitle(
                        dropDownItems: _dropdownItems,
                        title: 'Location',
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
                        title: 'Vendor',
                        value: _selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                      ))
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(18),
              ),

              ///Date and reference field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextFieldWithDate(
                        controller: dateinput,
                        title: 'Date',
                        onTap: () async {
                          dateSelection(controller: dateinput);
                        },
                      )),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: referenceController,
                          title: 'Reference'))
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(18),
              ),
              const Divider(
                color: inventorySelectionColor,
                thickness: 1.5,
              ),

              ///Received products section
              SizedBox(
                height: AppScreenUtil().screenHeight(17),
              ),

              Text(
                'Received Products',
                style: receivedProductLabelStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(12),
              ),
            ],
          )),

      /// Table layout
      Padding(
        padding: EdgeInsets.only(
            bottom: AppScreenUtil().screenHeight(15),
            left: AppScreenUtil().screenWidth(16)),
        child: GrnCreateTableLayout(
          scrollIndicatorVisibility: true,
          tableHeight: MediaQuery.of(context).size.height / 2.6,
          scrollController: grnTableScrollController,
          slidingIndicatorPosition: grnTableIndicatorPosition,
          tableDataWidgets: List.generate(codeList.length, (index) {
            bool isLastItem = index == codeList.length - 1;
            return Padding(
              padding: EdgeInsets.only(
                  bottom: AppScreenUtil().screenWidth(5)),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: AppScreenUtil().screenHeight(36),
                  width: AppScreenUtil().screenWidth(570),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(6),
                      color: Colors.transparent,
                      border: isLastItem
                          ? null
                          : const Border(
                          bottom: BorderSide(
                              width: 0.5,
                              color:
                              grnReceivedQtyFieldBorderColor))),
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
                          width: AppScreenUtil().screenWidth(80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                codeList[index],
                                style: dashBoardTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(productList[index],
                                  style: dashBoardTextStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(uomList[index],
                                  style: dashBoardTextStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(orderQtyList[index],
                                  style: dashBoardTextStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),

                        ///Received quantity
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                AppScreenUtil().screenHeight(18),
                                width: AppScreenUtil().screenWidth(60),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        width: 0.5,
                                        color:
                                        grnReceivedQtyFieldBorderColor)),
                                child: Center(
                                  child: EditableText(
                                    controller: textControllers[index],
                                    focusNode: focusNodes[index],
                                    style: dashBoardTextStyle,
                                    textAlign: TextAlign.center,
                                    cursorColor: blackColor,
                                    backgroundCursorColor: blackColor,
                                    maxLines: 1,
                                    onChanged: (newValue) {
                                      receivedQtyList[index] = newValue;
                                      onTextChanged(index, newValue);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          tableRowWidth: 570,
          titleWidgets: [
            Container(
              color: Colors.transparent,
              width: AppScreenUtil().screenWidth(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Code',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              width: AppScreenUtil().screenWidth(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Product',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              width: AppScreenUtil().screenWidth(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'UOM',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              width: AppScreenUtil().screenWidth(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Order Qty',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              width: AppScreenUtil().screenWidth(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Received Qty',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
          tableBottomLayoutWidgets: [
            ///These containers used only for spacing arrangement
            Container(
              color: Colors.transparent,
              width: AppScreenUtil().screenWidth(80),
            ),

            Container(
              color: Colors.transparent,
              width: AppScreenUtil().screenWidth(80),
            ),

            Container(
              color: Colors.transparent,
              width: AppScreenUtil().screenWidth(80),
            ),

//Order Qty layout
            Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: AppScreenUtil().screenHeight(18),
                      width: AppScreenUtil().screenWidth(60),
                      color: constantWhite,
                      child: Center(
                        child: EditableText(
                          controller: orderQtyTextEditingController,
                          focusNode: orderQtyFocusNode,
                          style: dashBoardTextStyle,
                          textAlign: TextAlign.center,
                          cursorColor: blackColor,
                          backgroundCursorColor: blackColor,
                          maxLines: 1,
                          onChanged: (newValue) {},
                        ),
                      ),
                    ),

                    ///Contact heading
                  ],
                )),
            Container(
              color: Colors.transparent,
              width: AppScreenUtil().screenWidth(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: AppScreenUtil().screenHeight(18),
                    width: AppScreenUtil().screenWidth(60),
                    color: constantWhite,
                    child: Center(
                      child: EditableText(
                        controller: receivedQtyTextEditingController,
                        focusNode: receivedQtyFocusNode,
                        style: dashBoardTextStyle,
                        textAlign: TextAlign.center,
                        cursorColor: blackColor,
                        backgroundCursorColor: blackColor,
                        maxLines: 1,
                        onChanged: (newValue) {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
