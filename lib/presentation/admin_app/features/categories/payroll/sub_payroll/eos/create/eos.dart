// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class EOSPage extends StatefulWidget {
  const EOSPage({super.key});

  @override
  State<EOSPage> createState() => _EOSPageState();
}

class _EOSPageState extends State<EOSPage> {
  String? _selectedEmployee;
  final List<String> employee = ['01', '02', '03'];
  String? _selectedEosType;
  final List<String> eosType = ['Termination', 'Lorem', 'Dummy'];
  String? _selectedCalculationBase;
  final List<String> calculationBase = [
    'Allowance include',
    'Basic Salary Only'
  ];
  String? _selectedDeductLoan;
  final List<String> deductLoan = ['False', 'True'];
  final dateInputController = TextEditingController();
  final joiningDateInputController = TextEditingController();
  final endDateInputController = TextEditingController();
  final designationController = TextEditingController();
  final departmentController = TextEditingController();
  final numberOfDaysController = TextEditingController();
  final serviceYearsController = TextEditingController();
  final unSettledLoanController = TextEditingController();
  final eosSettlementController = TextEditingController();
  final eosTotalController = TextEditingController();
  final netEosSettlementController = TextEditingController();
  List<String> variantsList = [
    'Lorem',
    'Ipsum',
    'Dummy',
    'Text',
  ];
  List<String> selectedCheckBoxValue = [];

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
    dateInputController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'EOS/2023/10/0001',
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
                    dropDownItems: employee,
                    title: 'Employee',
                    value: _selectedEmployee,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedEmployee = newValue;
                      });
                    },
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CustomTextFieldWithDate(
                    controller: dateInputController,
                    title: 'Date',
                    onTap: () async {
                      dateSelection(controller: dateInputController);
                    },
                  )),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(17),
          ),
          Text(
            'Employee Details',
            style: inputOutputSubTitleLabelStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: designationController,
                    title: 'Designation'),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: departmentController, title: 'Department'),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithDate(
                    controller: joiningDateInputController,
                    title: 'Joining Date',
                    onTap: () async {
                      dateSelection(controller: joiningDateInputController);
                    },
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CustomTextFieldWithDate(
                    controller: endDateInputController,
                    title: 'End Date',
                    onTap: () async {
                      dateSelection(controller: endDateInputController);
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
          Text(
            'End of Service Details',
            style: inputOutputSubTitleLabelStyle,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: eosType,
                    title: 'EOS Type',
                    value: _selectedEosType,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedEosType = newValue;
                      });
                    },
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: calculationBase,
                    title: 'Calculation Base',
                    value: _selectedCalculationBase,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCalculationBase = newValue;
                      });
                    },
                  )),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          _selectedCalculationBase == 'Allowance include'
              ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Included Allowances',
                            style: bookedTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(8),
                          ),
                          Container(
                              padding: EdgeInsets.only(bottom: 1),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: whiteColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: searchTextColor,
                                      offset: Offset(0, 0),
                                      blurRadius: 1,
                                    ),
                                  ]),
                              child: SizedBox(
                                height: 38,
                                child: DropDownMultiSelect(
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: blackColor,size: 20,
                                  ),
                                  decoration: InputDecoration(
                                    hoverColor: blackColor,
                                    fillColor: whiteColor,
                                    focusColor:blackColor,
                                    enabledBorder:
                                    const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(8)),
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0)),
                                    focusedBorder:
                                    const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(8)),
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0)),
                                  ),
                                  options: variantsList,
                                  selectedValues: selectedCheckBoxValue, selected_values_style:subTitleTextStyle,
                                  onChanged: (List<String> value) {
                                    //   value = selectedCheckBoxValue;
                                    print("${selectedCheckBoxValue}");
                                  },
                                  whenEmpty: '',
                                ),
                              )),
                        ],
                      )),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: numberOfDaysController,
                        title: 'No. of Days'),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CommonDropDownWithTitle(
                        dropDownItems: deductLoan,
                        title: 'Deduct Loan',
                        value: _selectedDeductLoan,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedDeductLoan = newValue;
                          });
                        },
                      )),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: serviceYearsController,
                        title: 'Service Years'),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: unSettledLoanController,
                        title: 'Unsettled Loan'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: eosSettlementController,
                        title: 'EOS Settlement/Year'),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: eosTotalController,
                        title: 'EOS Total'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: netEosSettlementController,
                        title: 'Net EOS Settlement'),
                  ),
                ],
              ),
            ],
          )
              : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: numberOfDaysController,
                        title: 'No. of Days'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CommonDropDownWithTitle(
                        dropDownItems: deductLoan,
                        title: 'Deduct Loan',
                        value: _selectedDeductLoan,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedDeductLoan = newValue;
                          });
                        },
                      )),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: serviceYearsController,
                        title: 'Service Years'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: unSettledLoanController,
                        title: 'Unsettled Loan'),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: eosSettlementController,
                        title: 'EOS Settlement/Year'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: eosTotalController,
                        title: 'EOS Total'),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: netEosSettlementController,
                        title: 'Net EOS Settlement'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(child: Container()),
                ],
              ),
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
          Container(
            padding: EdgeInsets.fromLTRB(20, 13, 20, 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: branchTransferCreateColor.withOpacity(0.75)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Basic Salary',
                  style: subCompanySettingsTextStyle,
                ),
                Text(
                  '25000.00',
                  style: tableTitleLabelStyleForEmployeeDashBoard,
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(2),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 13, 20, 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: branchTransferCreateColor.withOpacity(0.75)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Allowances',
                  style: subCompanySettingsTextStyle,
                ),
                Text(
                  '10000.00',
                  style: tableTitleLabelStyleForEmployeeDashBoard,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
