import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../user_app/widgets/custom_button.dart';

class CompanyInfoTab extends StatefulWidget {
  const CompanyInfoTab({super.key});

  @override
  State<CompanyInfoTab> createState() => _CompanyInfoTabState();
}

class _CompanyInfoTabState extends State<CompanyInfoTab> {
  bool isSelected = false;
  void toggleSwitch(bool value){
    setState(() {
      isSelected = !isSelected;
    });
  }
  String? _selectedItem;
  bool status = false;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(12),
  );
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

  final ManageEmployeeController manageEmployeCtrl =
      Get.put(ManageEmployeeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(34), left: AppScreenUtil().screenWidth(18),
                right: AppScreenUtil().screenWidth(18),),
      child: Column(
        children: [
          ///Update button
          Align(
              alignment: Alignment.topRight,
              child: CustomButton(
                  buttonHeight: AppScreenUtil().screenHeight(18),
                  buttonWidth: AppScreenUtil().screenWidth(61),
                  buttonColor: redColor,
                  borderRadius: 4,
                  buttonText: 'Update',
                  buttonLabelStyle:
                      employeeDashBoardPersonalInfoTabUpdateButtonLabelStyle)),
          SizedBox(
            height: AppScreenUtil().screenHeight(17),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Employee ID')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
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
          constHeight,
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
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithDate(
                controller: dateinput,
                title: 'Date Of Joining',
                onTap: () async {
                  dateSelection(controller: dateinput);
                },
              )),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithDate(
                controller: dateinput,
                title: 'Date Of Leaving',
                onTap: () async {
                  dateSelection(controller: dateinput);
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Work Hours')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Outlet Location',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(child: Container()),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Salary',
              style: companyInfoBoldTitleLabelStyle,
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'Type')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Monthly salary')),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Contract Period',
              style: companyInfoBoldTitleLabelStyle,
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
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
              SizedBox(width: AppScreenUtil().screenWidth(24)),
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
            height: AppScreenUtil().screenHeight(30),
          ),

          ///Active and inactive layout
          Row(
            children: [
              Text(
                'Status :',
                style: companyInfoBoldTitleLabelStyle,
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(15),
              ),
 FlutterSwitch(
                    width: 35,
                    height: 16,
                    toggleSize: 10.0,
                    value: status,
                    borderRadius: 60.0,
                    padding: 2.0,
                    toggleColor: status == false ? confirmColor : greenColor,
                    switchBorder: Border.all(
                      color: status == false ? confirmColor : greenColor,
                      width: 1,
                    ),
                    toggleBorder: Border.all(
                      color: status == false ? confirmColor : greenColor,
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
              SizedBox(
                width: AppScreenUtil().screenWidth(10),
              ),
              Text(
                'Active / Inactive',
                style: companyInfoActiveOrInactiveLabelStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
