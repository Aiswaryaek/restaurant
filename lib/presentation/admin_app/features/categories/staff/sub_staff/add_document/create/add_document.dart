// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/coloredDateField.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/colored_textfield.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';

class AddDocument extends StatefulWidget {
  const AddDocument({super.key});

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final employeeIdController = TextEditingController();
  final documentNumberController = TextEditingController();
  final expiryDateController = TextEditingController();

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
    expiryDateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              ColoredTextField(
                  color: textFieldColor,
                  controller: employeeIdController,
                  title: 'Employee ID'),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              ColoredDropDown(isVisible: true,
                dropDownItems: _dropdownItems,
                title: 'Document Type',
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
              ColoredTextField(
                  color: textFieldColor,
                  controller: documentNumberController,
                  title: 'Document Number'),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              ColoredDateField(
                controller: expiryDateController,
                title: 'Expiry Date',
                onTap: () async {
                  dateSelection(controller: expiryDateController);
                },
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Text(
                'Image Upload',
                style: bookedTextStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(3),
              ),
              SvgPicture.asset(
                ImageCons.uploadImage,
                height: 70,
                width: 100,
              ),
            ]));
  }
}
