// ignore_for_file: use_build_context_synchronously, avoid_print, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../widgets/coloredDateField.dart';
import '../../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../../widgets/colored_textfield.dart';
import '../../../../../../../widgets/shift_checkbox.dart';
import '../../../../../../../widgets/time_picker_textfield.dart';

class AutoShift extends StatefulWidget {
  const AutoShift({super.key});

  @override
  State<AutoShift> createState() => _AutoShiftState();
}

class _AutoShiftState extends State<AutoShift> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final dateinput = TextEditingController();
  final durationController = TextEditingController();
  TextEditingController startInput = TextEditingController();
  TextEditingController endInput = TextEditingController();

  @override
  void initState() {
    startInput.text = "";
    endInput.text = "";
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

  timeSelection({required TextEditingController controller}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context));
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      print(parsedTime);
      String formattedTime = DateFormat('HH:mm').format(parsedTime);
      print(formattedTime);
      setState(() {
        controller.text = pickedTime.format(context);
      });
    } else {
      print("Time is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Auto Shift',
          style: tableDetailHeadTextStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
        ColoredDropDown(
          dropDownItems: _dropdownItems,
          title: 'Outlet',
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
          'Current Date & Time',
          style: tableDetailHeadTextStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        ColoredDateField(
          controller: dateinput,
          title: 'Start Date',
          onTap: () async {
            dateSelection(controller: dateinput);
          },
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        ColoredTextField(
            color: textFieldColor,
            controller: durationController,
            title: 'Duration'),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        TimePickerTextField(
          controller: startInput,
          title: 'Start Time',
          onTap: () async {
            timeSelection(controller: startInput);
          },
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        TimePickerTextField(
          controller: endInput,
          title: 'End Time',
          onTap: () async {
            timeSelection(controller: endInput);
          },
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(16),
        ),
        Text(
          'Select Working Days',
          style: tableDetailHeadTextStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(12),
        ),
        ShiftCheckBox( checkBoxLabel: 'Sunday',),
        SizedBox(height: AppScreenUtil().screenHeight(10),),
        ShiftCheckBox( checkBoxLabel: 'Monday',),
        SizedBox(height: AppScreenUtil().screenHeight(10),),
        ShiftCheckBox( checkBoxLabel: 'Tuesday',),
        SizedBox(height: AppScreenUtil().screenHeight(10),),
        ShiftCheckBox( checkBoxLabel: 'Wednesday',),
        SizedBox(height: AppScreenUtil().screenHeight(10),),
        ShiftCheckBox( checkBoxLabel: 'Thursday',),
        SizedBox(height: AppScreenUtil().screenHeight(10),),
        ShiftCheckBox( checkBoxLabel: 'Friday',),
        SizedBox(height: AppScreenUtil().screenHeight(10),),
        ShiftCheckBox( checkBoxLabel: 'Saturday',),
      ],
    );
  }
}
