// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../../../../../../../styles/colors.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/sub_payroll.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
class PayHeadList extends StatefulWidget {
  const PayHeadList({super.key});

  @override
  State<PayHeadList> createState() => _PayHeadListState();
}

class _PayHeadListState extends State<PayHeadList> {
  final nameController = TextEditingController();
  final percentageOfCTCController = TextEditingController();
  final fixedAmountController = TextEditingController();
  final List<String> _dropdownItems = [
    'Basic',
    'Allowance',
    'Deduction',
    'Commission',
    'Bonus'
  ];
  String? _selectedItem;
  final List<String> categoryItems = [
    'Basic',
    'Allowance',
    'Deduction',
    'Commission',
    'Bonus'
  ];
  String? selectedCategory = 'Basic';
  final List<String> calculationTypeItems = [
    '% of CTC',
    'Fixed Amount',
    'Deduction'
  ];
  String? selectedCalculationType;
  final List<String> expenseAccountItems = ['Salaries A/C', 'Lorem'];
  String? selectedExpenseAccount;
  final List<String> allowanceIncludeInBasicItems = ['True', 'False'];
  String? selectedAllowanceIncludeInBasic;
  final List<String> allowanceCalculationTypeItems = [ '% of Basic',
    'Fixed Amount',
  ];
  String? selectedAllowanceCalculationType;
  final List<String> loanDeductionItems = ['True', 'False'];
  String? selectedLoanDeduction;
  bool status = false;
  List<Color> tableDataAlternateColor = [
    leftLoanEligibilityFiveColor.withOpacity(0.8),
    leftPayslipFirstColor.withOpacity(0.8),
    leftLoanEligibilityThirdColor.withOpacity(0.8),
    leftLoanEligibilityFourColor.withOpacity(0.8),
  ];
  List<Color> tableDataColor = [
    loanFiveContainerCardColor,
    loanFirstContainerCardColor,
    loanThirdContainerCardColor,
    loanFourContainerCardColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30, bottom: 30, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    childAspectRatio: 3 / 1.50),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                      padding: EdgeInsets.only(left: 5.5),
                      decoration: BoxDecoration(
                        color: tableDataAlternateColor[
                        index % tableDataAlternateColor.length],
                      ),
                      child: GestureDetector(
                        onTap: (){
                          subPayrollBottomSheet(context);
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 14, 15, 15),
                          decoration: BoxDecoration(
                            color: tableDataColor[index % tableDataColor.length],
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Category',
                                      style: gridHeadTextStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(4),
                                    ),
                                    Text(
                                      'BASIC',
                                      style: cartItemTitleStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(16),
                                    ),
                                    Text(
                                      'CALCULATION TYPE',
                                      style: gridHeadTextStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(4),
                                    ),
                                    Text(
                                      '% OF CTC',
                                      style: cartItemTitleStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(16),
                                    ),
                                    Text(
                                      'EXPENSE ACCOUNT',
                                      style: gridHeadTextStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(4),
                                    ),
                                    Text(
                                      'Salaries a/c',
                                      style: cartItemTitleStyle,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: gridHeadTextStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(4),
                                    ),
                                    Text(
                                      'BASIC FOR SALESMAN',
                                      style: cartItemTitleStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(16),
                                    ),
                                    Text(
                                      'PERCENTAGE OF CTC',
                                      style: gridHeadTextStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(4),
                                    ),
                                    Text(
                                      '50 %',
                                      style: cartItemTitleStyle,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(16),
                                    ),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB( 4, 0, 3, 0.5),
                                      height:AppScreenUtil().screenHeight(11),
                                      width:AppScreenUtil().screenWidth(40),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: payHeadActiveColor.withOpacity(0.1)),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Active',style: payHeadActiveTextStyle,),
                                          SizedBox(width: AppScreenUtil().screenWidth(5),),
                                          Text('TRUE',style: payHeadTrueSubTextStyle,)
                                        ],
                                      ),)

                                  ],
                                ),
                              ]),
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }
  void subPayrollBottomSheet(BuildContext context) {
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
                        Navigator.pop(context);
                        createPayHeadDialogue(context);
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
  void createPayHeadDialogue(BuildContext context,) {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              ImageCons.save,
                              height: 23,
                              width: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Active',
                                  style: bookedTextStyle,
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(5),
                                ),
                                FlutterSwitch(
                                  width: 35,
                                  height: 16,
                                  toggleSize: 10.0,
                                  value: status,
                                  borderRadius: 60.0,
                                  padding: 2.0,
                                  toggleColor: status == false
                                      ? confirmColor
                                      : greenColor,
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
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Text(
                          'Category',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: 38.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: textFieldColor),
                          child: DropdownButton<String>(
                            style: searchInputTextStyle,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            value: selectedCategory,
                            items: categoryItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: searchInputTextStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategory = newValue;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: blackColor,
                            ),
                            iconSize: 22,
                            isExpanded: true,
                            underline:
                            const SizedBox(), // Removes the default underline
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(13),
                        ),
                        Text(
                          'Name',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 3),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: textFieldColor,
                              border:
                              Border.all(color: textFieldColor, width: 3)),
                          child: SizedBox(
                              height: 30.5,
                              child: Center(
                                child: TextFormField(
                                  controller: nameController,
                                  style: searchInputTextStyle,
                                  cursorColor: whiteColor,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    hintStyle: loremTextStyle,
                                    fillColor: blackColor,
                                    focusColor: textFieldColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: textFieldColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: textFieldColor),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: textFieldColor),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: textFieldColor),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(13),
                        ),
                        selectedCategory == 'Basic' ?
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Calculation Type',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            ),
                            Container(
                              height: 38.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: textFieldColor),
                              child: DropdownButton<String>(
                                style: searchInputTextStyle,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                value: selectedCalculationType,
                                items: calculationTypeItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: searchInputTextStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCalculationType = newValue;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: blackColor,
                                ),
                                iconSize: 22,
                                isExpanded: true,
                                underline:
                                const SizedBox(), // Removes the default underline
                              ),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(13),
                            ),
                            Text(
                              selectedCalculationType == 'Fixed Amount'
                                  ? 'Fixed Amount'
                                  : 'Percentage of CTC',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 3),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: textFieldColor,
                                  border:
                                  Border.all(color: textFieldColor, width: 3)),
                              child: SizedBox(
                                  height: 30.5,
                                  child: Center(
                                    child: TextFormField(
                                      controller:
                                      selectedCalculationType == 'Fixed Amount'
                                          ? fixedAmountController
                                          : percentageOfCTCController,
                                      style: searchInputTextStyle,
                                      cursorColor: whiteColor,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isDense: true,
                                        hintStyle: loremTextStyle,
                                        fillColor: blackColor,
                                        focusColor: textFieldColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(13),
                            ),
                            Text(
                              'Expense Account',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            ),
                            Container(
                              height: 38.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: textFieldColor),
                              child: DropdownButton<String>(
                                style: searchInputTextStyle,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                value: selectedExpenseAccount,
                                items: expenseAccountItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: searchInputTextStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedExpenseAccount = newValue;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: blackColor,
                                ),
                                iconSize: 22,
                                isExpanded: true,
                                underline:
                                const SizedBox(), // Removes the default underline
                              ),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(15),
                            ),
                          ],
                        )
                            : selectedCategory == 'Allowance' ? Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Include In Basic',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            ),
                            Container(
                              height: 38.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: textFieldColor),
                              child: DropdownButton<String>(
                                style: searchInputTextStyle,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                value: selectedAllowanceIncludeInBasic,
                                items: allowanceIncludeInBasicItems.map((
                                    String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: searchInputTextStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedAllowanceIncludeInBasic = newValue;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: blackColor,
                                ),
                                iconSize: 22,
                                isExpanded: true,
                                underline:
                                const SizedBox(), // Removes the default underline
                              ),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(13),
                            ),
                            selectedAllowanceIncludeInBasic == 'True' ? Text(
                              'Calculation Type',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ) : SizedBox(),
                            selectedAllowanceIncludeInBasic == 'True'
                                ? SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            )
                                : SizedBox(),
                            selectedAllowanceIncludeInBasic == 'True'
                                ? Container(
                              height: 38.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: textFieldColor),
                              child: DropdownButton<String>(
                                style: searchInputTextStyle,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                value: selectedAllowanceCalculationType,
                                items: allowanceCalculationTypeItems.map((
                                    String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: searchInputTextStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedAllowanceCalculationType = newValue;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: blackColor,
                                ),
                                iconSize: 22,
                                isExpanded: true,
                                underline:
                                const SizedBox(), // Removes the default underline
                              ),
                            )
                                : SizedBox(),
                            selectedAllowanceIncludeInBasic == 'True'
                                ? SizedBox(
                              height: AppScreenUtil().screenHeight(13),
                            )
                                : SizedBox(),
                            selectedAllowanceIncludeInBasic == 'True' ? Text(
                              selectedAllowanceCalculationType == 'Fixed Amount'
                                  ? 'Amount'
                                  : 'Percentage of Basic',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ) : Text(
                              'Fixed Amount',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 3),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: textFieldColor,
                                  border:
                                  Border.all(color: textFieldColor, width: 3)),
                              child: SizedBox(
                                  height: 30.5,
                                  child: Center(
                                    child: TextFormField(
                                      controller:
                                      selectedCalculationType ==
                                          'Fixed Amount' ||
                                          selectedAllowanceIncludeInBasic ==
                                              'True'
                                          ? fixedAmountController
                                          : percentageOfCTCController,
                                      style: searchInputTextStyle,
                                      cursorColor: whiteColor,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isDense: true,
                                        hintStyle: loremTextStyle,
                                        fillColor: blackColor,
                                        focusColor: textFieldColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(13),
                            ),
                            Text(
                              'Expense Account',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            ),
                            Container(
                              height: 38.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: textFieldColor),
                              child: DropdownButton<String>(
                                style: searchInputTextStyle,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                value: selectedExpenseAccount,
                                items: expenseAccountItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: searchInputTextStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedExpenseAccount = newValue;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: blackColor,
                                ),
                                iconSize: 22,
                                isExpanded: true,
                                underline:
                                const SizedBox(), // Removes the default underline
                              ),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(15),
                            ),
                          ],
                        ) : selectedCategory == 'Deduction' ?
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Is Loan Deduction',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            ),
                            Container(
                              height: 38.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: textFieldColor),
                              child: DropdownButton<String>(
                                style: searchInputTextStyle,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                value: selectedLoanDeduction,
                                items: loanDeductionItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: searchInputTextStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedLoanDeduction = newValue;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: blackColor,
                                ),
                                iconSize: 22,
                                isExpanded: true,
                                underline:
                                const SizedBox(), // Removes the default underline
                              ),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(13),
                            ),
                            selectedLoanDeduction == 'False' ? Text(
                              'Amount',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ) : SizedBox(),
                            selectedLoanDeduction == 'False' ? SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ) : SizedBox(),
                            selectedLoanDeduction == 'False' ? Container(
                              padding: EdgeInsets.only(bottom: 3),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: textFieldColor,
                                  border:
                                  Border.all(color: textFieldColor, width: 3)),
                              child: SizedBox(
                                  height: 30.5,
                                  child: Center(
                                    child: TextFormField(
                                      controller:
                                      fixedAmountController,
                                      style: searchInputTextStyle,
                                      cursorColor: whiteColor,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isDense: true,
                                        hintStyle: loremTextStyle,
                                        fillColor: blackColor,
                                        focusColor: textFieldColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                      ),
                                    ),
                                  )),
                            ) : SizedBox(),
                            selectedLoanDeduction == 'False' ? SizedBox(
                              height: AppScreenUtil().screenHeight(13),
                            ) : SizedBox(),

                            Text(
                              selectedLoanDeduction == 'False'
                                  ? 'Loan Account'
                                  : 'Expense Account',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            ),
                            Container(
                              height: 38.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: textFieldColor),
                              child: DropdownButton<String>(
                                style: searchInputTextStyle,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                value: selectedExpenseAccount,
                                items: expenseAccountItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: searchInputTextStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedExpenseAccount = newValue;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: blackColor,
                                ),
                                iconSize: 22,
                                isExpanded: true,
                                underline:
                                const SizedBox(), // Removes the default underline
                              ),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(15),
                            ),
                          ],
                        ): selectedCategory == 'Commission' ?
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amount',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 3),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: textFieldColor,
                                  border:
                                  Border.all(color: textFieldColor, width: 3)),
                              child: SizedBox(
                                  height: 30.5,
                                  child: Center(
                                    child: TextFormField(
                                      controller:
                                      fixedAmountController,
                                      style: searchInputTextStyle,
                                      cursorColor: whiteColor,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isDense: true,
                                        hintStyle: loremTextStyle,
                                        fillColor: blackColor,
                                        focusColor: textFieldColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(15),
                            ),
                          ],
                        ):Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amount',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 3),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: textFieldColor,
                                  border:
                                  Border.all(color: textFieldColor, width: 3)),
                              child: SizedBox(
                                  height: 30.5,
                                  child: Center(
                                    child: TextFormField(
                                      controller:
                                      fixedAmountController,
                                      style: searchInputTextStyle,
                                      cursorColor: whiteColor,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isDense: true,
                                        hintStyle: loremTextStyle,
                                        fillColor: blackColor,
                                        focusColor: textFieldColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: textFieldColor),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(15),
                            ),
                            Text(
                              'Expense Account',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            ),
                            Container(
                              height: 38.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: textFieldColor),
                              child: DropdownButton<String>(
                                style: searchInputTextStyle,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                value: selectedExpenseAccount,
                                items: expenseAccountItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: searchInputTextStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedExpenseAccount = newValue;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: blackColor,
                                ),
                                iconSize: 22,
                                isExpanded: true,
                                underline:
                                const SizedBox(), // Removes the default underline
                              ),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(color: blackColor)),
                                padding: EdgeInsets.only(bottom: 2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Back',
                                      style: categoryMenuTextStyle,
                                      textAlign: TextAlign.center),
                                )),
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
}
