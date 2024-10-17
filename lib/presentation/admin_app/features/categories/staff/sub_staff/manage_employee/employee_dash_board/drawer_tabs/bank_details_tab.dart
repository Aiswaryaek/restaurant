import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../user_app/widgets/custom_button.dart';

class BankDetailsTab extends StatefulWidget {
  const BankDetailsTab({super.key});

  @override
  State<BankDetailsTab> createState() => _BankDetailsTabState();
}

class _BankDetailsTabState extends State<BankDetailsTab> {
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
              ///Bank details table layout
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Account Holder')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
             Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Account Number')),
            ],
          ),
          constHeight,
       Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Bank name',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
             Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'IFSC / IBAN')),
            ],
          ),
          constHeight,
                   Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Branch Location')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
             Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'PAN / Income Tax Code')),
            ],
          ),
          
        ],
      ),
    );
  }
}
