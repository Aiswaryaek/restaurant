// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/payslip/create/other_inputs/other_inputs.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/payslip/create/salary_calculation/salary_calculation.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/payslip/create/work_days/work_days.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class Payslip extends StatefulWidget {
  const Payslip({super.key});

  @override
  State<Payslip> createState() => _PayslipState();
}

class _PayslipState extends State<Payslip> {
  List<Color> alternateColor = [constantWhite, inventorySelectionColor];
  String? _selectedItem;
  String? selected;
  String? tableSelected;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> tableDropDown = ['Asset', ' Assets'];
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final dateinput = TextEditingController();
  final contractController = TextEditingController();
  final sponsorController = TextEditingController();
  final templateController = TextEditingController();
  String tab1 = 'Work Days';
  String tab2 = 'Other Inputs';
  String tab3 = 'Salary Calculation';
  dynamic item = 'Work Days';
  bool tappedTab1 = true;
  bool tappedTab2 = false;
  bool tappedTab3 = false;

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
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'PAYSLIP/2023/10/0001',
              style: billTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Employee',
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
                  ))
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithDate(
                    controller: dateinput,
                    title: 'From',
                    onTap: () async {
                      dateSelection(controller: dateinput);
                    },
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CustomTextFieldWithDate(
                    controller: dateinput,
                    title: 'To',
                    onTap: () async {
                      dateSelection(controller: dateinput);
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
                    title: 'Designation',
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
                    title: 'Department',
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
          Row(
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                    width: AppScreenUtil().screenWidth(153),
                    controller: contractController,
                    title: 'Contract'),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    width: AppScreenUtil().screenWidth(153),
                    controller: sponsorController,
                    title: 'Sponsor'),
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
                    width: AppScreenUtil().screenWidth(153),
                    controller: templateController,
                    title: 'Template'),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CustomTextFieldWithDate(
                    controller: dateinput,
                    title: 'Account Date',
                    onTap: () async {
                      dateSelection(controller: dateinput);
                    },
                  )),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Divider(
            color: inventorySelectionColor,
            thickness: 1.5,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: InkWell(
                      child: Container(
                          height: 24,
                          decoration: BoxDecoration(
                              color:
                              tappedTab1 == true ? blackColor : whiteColor,
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
                              color:
                              tappedTab2 == true ? blackColor : whiteColor,
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
                              color:
                              tappedTab3 == true ? blackColor : whiteColor,
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
          ),
          Padding(
            padding: EdgeInsets.only(left: 7, right: 7),
            child: Transform.translate(
                offset: Offset(0, -9),
                child: Padding(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: Divider(
                    color: blackColor,
                    thickness: 1.5,
                  ),
                )),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(10),
          ),
          item == 'Work Days'
              ? WorkDays()
              : item == 'Other Inputs'
              ? OtherInputs()
              : item == 'Salary Calculation'
              ? SalaryCalculation()
              : SizedBox()
        ],
      )
    );
  }
}
