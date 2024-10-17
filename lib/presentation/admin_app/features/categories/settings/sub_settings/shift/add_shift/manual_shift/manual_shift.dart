import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../widgets/coloredDateField.dart';
import '../../../../../../../widgets/colored_dropdown.dart';

class ManualShift extends StatefulWidget {
  const ManualShift({super.key});

  @override
  State<ManualShift> createState() => _ManualShiftState();
}

class _ManualShiftState extends State<ManualShift> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final dateinput = TextEditingController();
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
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Manual Shift',
          style: tableDetailHeadTextStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
        ColoredDropDown(isVisible: true,
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
        ColoredDropDown(isVisible: true,
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
        Text(
          'Current Date',
          style: tableDetailHeadTextStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        ColoredDateField(
          controller: dateinput,
          title: 'Date',
          onTap: () async {
            dateSelection(controller: dateinput);
          },
        ),
      ],
    );
  }
}
