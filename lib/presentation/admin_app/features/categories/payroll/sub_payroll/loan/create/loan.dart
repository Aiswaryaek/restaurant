// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';

class Loan extends StatefulWidget {
  const Loan({super.key});

  @override
  State<Loan> createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final interestController = TextEditingController();
  final installmentStartDateController = TextEditingController();
  final loanAmountController = TextEditingController();
  final installmentController = TextEditingController();

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
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(offset: Offset(0,-23),child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Column(
                  children: [
                    CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Employee',
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
                    Container(
                        padding: EdgeInsets.fromLTRB(13, 7.5, 13, 10),
                        color: loanContainerColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Branch',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            ),
                            Text(
                              ': LEEYET',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            )
                          ],
                        )),
                    SizedBox(height: AppScreenUtil().screenHeight(3),),
                    Container(
                        padding: EdgeInsets.fromLTRB(13, 7.5, 13, 10),
                        color: loanContainerColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Designation',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            ),
                            Text(
                              ': Accountant',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            )
                          ],
                        )),
                    SizedBox(height: AppScreenUtil().screenHeight(3),),
                    Container(
                        padding: EdgeInsets.fromLTRB(13, 7.5, 13, 10),
                        color: loanContainerColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Department',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            ),
                            Text(
                              ': Finance',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            )
                          ],
                        )),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Payment Type',
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
                    CustomTextFieldWithTitle(
                        controller: loanAmountController, title: 'Loan Amount'),
                  ],
                ),),
                SizedBox(width: AppScreenUtil().screenWidth(25)),
                Expanded(child: Transform.translate(offset: Offset(0,29),child: Column(
                  children: [
                    CustomTextFieldWithTitle(
                        controller: interestController, title: 'Interest %'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(13, 7.5, 13, 10),
                        color: loanContainerColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Interest Amount',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            ),
                            Text(
                              ': 0.00',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            )
                          ],
                        )),
                    SizedBox(height: AppScreenUtil().screenHeight(3),),
                    Container(
                        padding: EdgeInsets.fromLTRB(13, 7.5, 13, 10),
                        color: loanContainerColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            ),
                            Text(
                              ': 0.00',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            )
                          ],
                        )),
                    SizedBox(height: AppScreenUtil().screenHeight(14),),
                    CustomTextFieldWithDate(
                      controller: installmentStartDateController,
                      title: 'Installment Start Date',
                      onTap: () async {
                        dateSelection(controller: installmentStartDateController);
                      },
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    CustomTextFieldWithTitle(
                        controller: installmentController, title: 'Installment Amount'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(13, 7.5, 13, 10),
                        color: loanContainerColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Installment End Date:',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            ),
                            Text(
                              'DD/MM/YYYY',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            )
                          ],
                        )),
                    SizedBox(height: AppScreenUtil().screenHeight(3),),
                    Container(
                        padding: EdgeInsets.fromLTRB(13, 7.5, 13, 10),
                        color: loanContainerColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'No. of Installments',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            ),
                            Text(
                              ': 00',
                              overflow: TextOverflow.ellipsis,
                              style: passwordUpdatedSubTitleLabelStyle,
                            )
                          ],
                        )),
                  ],
                ),)),
              ],
            ),),
          ],
        ),
      )
    );
  }
}
