// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';

class BatchPayslip extends StatefulWidget {
  const BatchPayslip({super.key});

  @override
  State<BatchPayslip> createState() => _BatchPayslipState();
}

class _BatchPayslipState extends State<BatchPayslip> {
  final batchNameController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;

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
      padding: EdgeInsets.fromLTRB(16, 0, 16, 40),
      // height: MediaQuery.of(context).size.height / 1.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFieldWithTitle(
                controller: batchNameController, title: 'Batch Name'),
            SizedBox(
              height: AppScreenUtil().screenHeight(14),
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextFieldWithDate(
                      controller: fromDateController,
                      title: 'From',
                      onTap: () async {
                        dateSelection(controller: fromDateController);
                      },
                    )),
                SizedBox(width: AppScreenUtil().screenWidth(25)),
                Expanded(
                    child: CustomTextFieldWithDate(
                      controller: toDateController,
                      title: 'To',
                      onTap: () async {
                        dateSelection(controller: toDateController);
                      },
                    )),
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(14),
            ),
            Row(
              children: [
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
                    )),
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(14),
            ),
            Row(
              children: [
                Expanded(
                    child: CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Establishment',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    )),
                SizedBox(width: AppScreenUtil().screenWidth(25)),
                Expanded(
                    child:Container()),
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(18),
            ),
            const Divider(
              color: inventorySelectionColor,
              thickness: 1.5,
            ),
          ],
        ),
      )
    );
  }
}
