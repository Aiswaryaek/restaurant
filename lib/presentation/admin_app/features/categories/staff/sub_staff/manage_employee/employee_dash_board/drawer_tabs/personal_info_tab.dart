import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../../user_app/widgets/custom_button.dart';

class PersonalInfoTab extends StatefulWidget {
  const PersonalInfoTab({super.key});

  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  String? _selectedItem;

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
                      title: 'Staff Name')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Gender',
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
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Father Name')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Marital Status',
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
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Contact Number')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Blood Group',
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
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Emergency Contact Number')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'Address')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'Email')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithDate(
                controller: dateinput,
                title: 'DOB',
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
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Country',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'State',
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
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              child: Column(
                children: [
                  Text(
                    'Image upload',
                    style: imageUploadLabelStyle,
                  ),
                  SvgPicture.asset(
                    ImageCons.uploadImage,
                    height: 53 * 1.32,
                    width: 55 * 1.32,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(27),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Account Login',
                style: personalInfoAccountLoginLabelStyle,
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(17),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 92,
                    child: Container(
                      color: Colors.transparent,
                      height: AppScreenUtil().screenHeight(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'User Name',
                            style: bookedTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 267,
                    child: ColoredTextField(
                        textFieldHeight: AppScreenUtil().screenHeight(30),
                        titleVisibility: false,
                        color: textFieldColor,
                        controller: TextEditingController(),
                        title: ''),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(10),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 92,
                    child: Container(
                      color: Colors.transparent,
                      height: AppScreenUtil().screenHeight(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Password',
                            style: bookedTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 267,
                    child: ColoredTextField(
                        textFieldHeight: AppScreenUtil().screenHeight(30),
                        titleVisibility: false,
                        color: textFieldColor,
                        controller: TextEditingController(),
                        title: ''),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(10),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        changePasswordAlertDialogue();
                      },
                      child: CustomButton(
                        buttonHeight: AppScreenUtil().screenHeight(20),
                        buttonWidth: AppScreenUtil().screenWidth(70),
                        buttonColor: blackColor,
                        borderRadius: 10,
                        buttonText: 'Edit Password',
                        buttonLabelStyle: editPasswordButtonLabelStyle,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 5,
                              color: clearDataAlertYesButtonBoxShadowColor)
                        ],
                      )))
            ],
          )
        ],
      ),
    );
  }

  changePasswordAlertDialogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(30)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
              ),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: constantWhite,
                      borderRadius: BorderRadius.circular(23),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 35,
                            color: changePasswordBoxShadowColor)
                      ]),
                  child: Obx(()=>(manageEmployeCtrl.isPasswordUpdation.value == false)
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: AppScreenUtil().screenHeight(20),
                              left: AppScreenUtil().screenWidth(30),
                              right: AppScreenUtil().screenWidth(30),
                              bottom: AppScreenUtil().screenHeight(35)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Change password',
                                style: changePassWordAlertTitleLabelStyle,
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(20),
                              ),
                              ColoredTextField(
                                color: textFieldColor,
                                controller: TextEditingController(),
                                title: 'Username',
                                textStyle:
                                    changePasswordAlertTextFieldTitleLabelStyle,
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(10),
                              ),
                              ColoredTextField(
                                color: textFieldColor,
                                controller: TextEditingController(),
                                title: 'New Password',
                                textStyle:
                                    changePasswordAlertTextFieldTitleLabelStyle,
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(6),
                              ),
                              ColoredTextField(
                                color: textFieldColor,
                                controller: TextEditingController(),
                                title: 'Confirm Password',
                                textStyle:
                                    changePasswordAlertTextFieldTitleLabelStyle,
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(14),
                              ),
                              ///Change password button
                              GestureDetector(
                                onTap: (){
                                  manageEmployeCtrl.isPasswordUpdation.value = true;
                                },
                                child: CustomButton(
                                    buttonHeight:
                                        AppScreenUtil().screenHeight(28),
                                    buttonWidth: double.infinity,
                                    buttonColor: blackColor,
                                    borderRadius: 7,
                                    buttonText: 'Change Password',
                                    buttonLabelStyle:
                                        changePasswordAlertTextFieldButtonLabelStyle),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding:  EdgeInsets.only(
                              top: AppScreenUtil().screenHeight(28),
                              
                              bottom: AppScreenUtil().screenHeight(42)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Lottie.asset('assets/gif_delete_success.json',height: 49,width:48 ),
                              // SvgPicture.asset(ImageCons.imgPasswordUpdated,height:49 ,width: 48,),
                              SizedBox(height: AppScreenUtil().screenHeight(12),),
                           Text('Password Updated',style: passwordUpdatedTitleLabelStyle,)   ,
                              SizedBox(height: AppScreenUtil().screenHeight(18),),
                              Column(children: [
                                Text('Password has been changed successfully',style: passwordUpdatedSubTitleLabelStyle,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text('Use new password to ',style: passwordUpdatedSubTitleLabelStyle,),
                                  Text('login',style: passwordUpdatedLoginButtonLabelStyle,)
                                ],)
                              ],)
                            ],
                          ),
                        ))));
        });
  }
}
