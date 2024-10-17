// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/add_employee/controller/add_employe_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_drop_down.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../../user_app/widgets/custom_button.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import 'bank_details.dart';
import 'company_info.dart';

class StaffPersonalInfo extends StatefulWidget {
  const StaffPersonalInfo({super.key});

  @override
  State<StaffPersonalInfo> createState() => _StaffPersonalInfoState();
}

class _StaffPersonalInfoState extends State<StaffPersonalInfo> {
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

  final addEmployeeCtrl = Get.find<AddEmployeeController>();
  bool isValidStaffName = true;
  bool isValidGender = true;
  bool isValidFatherName = true;
  bool isValidMaritalStatus = true;
  bool isValidContactNumber = true;
  bool isValidBloodGroup = true;
  bool isValidEmergencyContactNumber = true;
  bool isValidAddress = true;
  bool isValidEmail = true;
  bool isValidDateOfBirth = true;
  bool isValidCountry = true;
  bool isValidState = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    addEmployeeCtrl.isStaffAddEmployeeDrawer.value = true;
                  },
                  child: SvgPicture.asset(ImageCons.imgDrawer,
                      height: 15, width: 24.1),
                )),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Obx(() => addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                    'Company Info'
                ? StaffCompanyInfo()
                : addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                        'Bank Details'
                    ? StaffBankDetails()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFieldWithTitle(
                                    controller:
                                        addEmployeeCtrl.staffNameController,
                                    title: 'Staff Name'),
                              ),
                              SizedBox(width: AppScreenUtil().screenWidth(25)),
                              Expanded(
                                child: Obx(
                                  () => CustomDropDownButton(
                                    hint: Text(
                                      'Select Gender',
                                      style: dropdownHintTextStyle,
                                    ),
                                    title: 'Gender',
                                    value: addEmployeeCtrl
                                        .profileInfoSelectedGenderValue.value,
                                    dropdownItems: addEmployeeCtrl
                                        .profileInfoGenderDropDownList,
                                    onChanged: (v) {
                                      addEmployeeCtrl
                                          .profileInfoSelectedGenderValue
                                          .value = v.toString();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          Row(
                            children: [
                              ///Father name field
                              Expanded(
                                child: CustomTextFieldWithTitle(
                                    controller:
                                        addEmployeeCtrl.fatherNameController,
                                    title: 'Father Name'),
                              ),
                              SizedBox(width: AppScreenUtil().screenWidth(25)),

                              ///Marital status field
                              Expanded(
                                child: Obx(
                                  () => CustomDropDownButton(
                                    hint: Text(
                                      'Select marital status',
                                      style: dropdownHintTextStyle,
                                    ),
                                    title: 'Marital Status',
                                    value: addEmployeeCtrl
                                        .profileInfoSelectedMaritalStatusValue
                                        .value,
                                    dropdownItems: _dropdownItems,
                                    onChanged: (v) {
                                      addEmployeeCtrl
                                          .profileInfoSelectedMaritalStatusValue
                                          .value = v.toString();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          Row(
                            children: [
                              ///Contact number field
                              Expanded(
                                child: CustomTextFieldWithTitle(
                                    controller:
                                        addEmployeeCtrl.contactNumberController,
                                    title: 'Contact Number'),
                              ),

                              SizedBox(width: AppScreenUtil().screenWidth(25)),

                              ///Blood group field
                              Expanded(
                                child: Obx(
                                  () => CustomDropDownButton(
                                    hint: Text(
                                      'Select Blood Group',
                                      style: dropdownHintTextStyle,
                                    ),
                                    title: 'Blood Group',
                                    value: addEmployeeCtrl
                                        .profileInfoSelectedBloodGroupValue
                                        .value,
                                    dropdownItems: _dropdownItems,
                                    onChanged: (v) {
                                      addEmployeeCtrl
                                          .profileInfoSelectedBloodGroupValue
                                          .value = v.toString();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          Row(
                            children: [
                              ///Emergency contact number layout
                              Expanded(
                                child: CustomTextFieldWithTitle(
                                    controller: addEmployeeCtrl
                                        .emergencyContactNumberController,
                                    title: 'Emergency Contact Number'),
                              ),
                              SizedBox(width: AppScreenUtil().screenWidth(25)),

                              ///Address layout
                              Expanded(
                                child: CustomTextFieldWithTitle(
                                    controller:
                                        addEmployeeCtrl.addressController,
                                    title: 'Address'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),

                          Row(
                            children: [
                              ///Email field
                              Expanded(
                                child: CustomTextFieldWithTitle(
                                    controller: addEmployeeCtrl.emailController,
                                    title: 'Email'),
                              ),
                              SizedBox(width: AppScreenUtil().screenWidth(25)),

                              ///Dob field
                              Expanded(
                                  child: CustomTextFieldWithDate(
                                controller: addEmployeeCtrl.dobController,
                                title: 'DOB',
                                onTap: () async {
                                  dateSelection(
                                      controller:
                                          addEmployeeCtrl.dobController);
                                },
                              )),
                            ],
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),
                          Row(
                            children: [
                              ///Country field
                              Expanded(
                                child: Obx(
                                  () => CustomDropDownButton(
                                    hint: Text(
                                      'Select Country',
                                      style: dropdownHintTextStyle,
                                    ),
                                    title: 'Country',
                                    value: addEmployeeCtrl
                                        .profileInfoSelectedCountryValue.value,
                                    dropdownItems: _dropdownItems,
                                    onChanged: (v) {
                                      addEmployeeCtrl
                                          .profileInfoSelectedCountryValue
                                          .value = v.toString();
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: AppScreenUtil().screenWidth(25)),

                              ///State  field

                              Expanded(
                                child: Obx(
                                  () => CustomDropDownButton(
                                    hint: Text(
                                      'Select State',
                                      style: dropdownHintTextStyle,
                                    ),
                                    title: 'State',
                                    value: addEmployeeCtrl
                                        .profileInfoSelectedStateValue.value,
                                    dropdownItems: _dropdownItems,
                                    onChanged: (v) {
                                      addEmployeeCtrl
                                          .profileInfoSelectedStateValue
                                          .value = v.toString();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),

                          ///Image upload layout
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Image Upload',
                                style: bookedTextStyle,
                              ),
                              Transform.translate(
                                offset: Offset(-5, 0),
                                child: SvgPicture.asset(
                                  ImageCons.uploadImage,
                                  height: 70,
                                  width: 100,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: AppScreenUtil().screenHeight(14),
                          ),

                          ///Account login label text
                          Text(
                            'Account Login',
                            style: tableHeadingLabelStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ///User name label layout
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'User Name :',
                                  style: bookedTextStyle,
                                ),
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: textFieldColor,
                                        border: Border.all(
                                            color: textFieldColor, width: 3)),
                                    child: SizedBox(
                                        height: 30,
                                        child: TextFormField(
                                          controller: addEmployeeCtrl
                                              .usernameController,
                                          style: searchInputTextStyle,
                                          cursorColor: whiteColor,
                                          decoration: InputDecoration( 
                                            contentPadding: EdgeInsets.all(7),
                                            isDense: true,
                                            hintStyle: loremTextStyle,
                                            fillColor: blackColor,
                                            focusColor: textFieldColor,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldColor),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldColor),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldColor),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldColor),
                                            ),
                                          ),
                                        )),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(11),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ///Password label layout
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Password :',
                                  style: bookedTextStyle,
                                ),
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: textFieldColor,
                                        border: Border.all(
                                            color: textFieldColor, width: 3)),
                                    child: SizedBox(
                                        height: 30,
                                        child: TextFormField(
                                          obscureText: true,
                                          controller: addEmployeeCtrl
                                              .passwordController,
                                          style: searchInputTextStyle,
                                          cursorColor: whiteColor,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(7),
                                            isDense: true,
                                            hintStyle: loremTextStyle,
                                            fillColor: blackColor,
                                            focusColor: textFieldColor,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldColor),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldColor),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldColor),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldColor),
                                            ),
                                          ),
                                        )),
                                  )),
                            ],
                          ),

                          SizedBox(
                            height: AppScreenUtil().screenHeight(11),
                          ),

                          ///Edit password layout
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomButton(
                                buttonHeight: AppScreenUtil().screenHeight(20),
                                buttonWidth: AppScreenUtil().screenWidth(70),
                                buttonColor: blackColor,
                                borderRadius: 13,
                                buttonText: 'Edit Password',
                                buttonLabelStyle: userAddButtonTextStyle),
                          )
                        ],
                      ))
          ],
        ));
  }

  ///Validate fields
  validateFields() {
    isValidStaffName =
        AppUtils.validationOfName(addEmployeeCtrl.staffNameController.text);
    isValidFatherName =
        AppUtils.validationOfName(addEmployeeCtrl.fatherNameController.text);
    isValidContactNumber = AppUtils.validationOfPhone(
        addEmployeeCtrl.contactNumberController.text);
    isValidEmergencyContactNumber = AppUtils.validationOfPhone(
        addEmployeeCtrl.emergencyContactNumberController.text);
    isValidAddress =
        AppUtils.validateAddress(addEmployeeCtrl.addressController.text);
    isValidEmail =
        AppUtils.validationOfEmail(addEmployeeCtrl.emailController.text);
    isValidDateOfBirth =
        AppUtils.validationOfDate(addEmployeeCtrl.dobController.text);
  }
}
