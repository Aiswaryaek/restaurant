// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/controller/pos_controller.dart';

import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/label_textfield.dart';

class PosCustomer extends StatefulWidget {
  const PosCustomer({super.key});

  @override
  State<PosCustomer> createState() => _PosCustomerState();
}

class _PosCustomerState extends State<PosCustomer> {
  bool isValidCustomerName = true;
  bool isValidCustomerNo = true;

  ///API
  final posCtrl = Get.find<POSController>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final buildingNameController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final buildingNoController = TextEditingController();
  final roomNoController = TextEditingController();
  bool tappedMoreDetails = false;

  ///clear Controller
  void clearController() {
    nameController.clear();
    mobileController.clear();
    buildingNameController.clear();
    cityController.clear();
    streetController.clear();
    buildingNoController.clear();
    roomNoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 40, right: 20, top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LabelTextField(
              errorMessage: 'Enter a valid Name',
              textInputFormatter: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_.]')),
              ],
              isValidData: isValidCustomerName,
              labelText: 'Name',
              controller: nameController,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(20),
            ),
            LabelTextField(
              errorMessage: 'Enter a valid Number',
              isValidData: isValidCustomerNo,
              labelText: 'Mobile',
              controller: mobileController,
              isNumberField: true,
            ),
            tappedMoreDetails == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppScreenUtil().screenHeight(5),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            tappedMoreDetails = true;
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Add More Details',
                            style:
                                pangramMedium(color: confirmColor, size: 9.0),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      LabelTextField(
                        labelText: 'City',
                        controller: mobileController,
                        isNumberField: true,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      LabelTextField(
                        labelText: 'Street',
                        controller: mobileController,
                        isNumberField: true,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      LabelTextField(
                        labelText: 'Building Name',
                        controller: mobileController,
                        isNumberField: true,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      LabelTextField(
                        labelText: 'Building No',
                        controller: mobileController,
                        isNumberField: true,
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      LabelTextField(
                        labelText: 'Room No',
                        controller: mobileController,
                        isNumberField: true,
                      ),
                    ],
                  ),
            SizedBox(
              height: AppScreenUtil().screenHeight(10),
            ),
            Obx(() => (posCtrl.isAddCustomerLoading.value == true)
                ? const Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ))
                : Align(
                    alignment: Alignment.topRight,
                    child: CustomButton(
                        onTap: () {
                          setState(() {
                            tappedMoreDetails = false;
                          });
                          validateFields();
                          if (isValidCustomerName && mobileController != null) {
                            posCtrl
                                .addCustomer(
                                    name: nameController.text,
                                    mobileNo: mobileController.text,
                                    city: cityController.text,
                                    streetName: streetController.text,
                                    buildingNo: buildingNoController.text,
                                    buildingName: buildingNameController.text,
                                    roomNo: roomNoController.text,
                                    status: 'true',
                                    isCustomer: 'true',
                                    isVendor: 'false')
                                .then((value) {
                              print('Add Customer : $value');
                              if (value == true) {
                                posCtrl.getCustomerDropdownList();
                                clearController();
                                AppUtils.oneTimeSnackBar(
                                    'New customer Added',
                                    bgColor: confirmColor);
                                print(
                                    'Added Customer ${posCtrl.addedCustomer}');
                              }
                            });
                          }
                        },
                        buttonHeight: AppScreenUtil().screenHeight(21),
                        buttonWidth: AppScreenUtil().screenWidth(77),
                        buttonColor: confirmColor,
                        borderRadius: 12,
                        buttonText: 'Submit',
                        buttonLabelStyle:
                            backupAndRestoreSubmitButtonLabelStyle))),
          ],
        ),
      ),
    );
  }

  ///Textform field validation
  validateFields() {
    isValidCustomerName = AppUtils.validationOfName(nameController.text);
    // isValidCustomerNo =
    //     AppUtils.validationOfPhone(mobileController.text);
    setState(() {});
  }
}
