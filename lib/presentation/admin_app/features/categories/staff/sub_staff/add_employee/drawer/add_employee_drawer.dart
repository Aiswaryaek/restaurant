import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/add_employee/controller/add_employe_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_items.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../../../../styles/textstyles.dart';

class StaffAddEmployeeDrawer extends StatelessWidget {
  StaffAddEmployeeDrawer({super.key});
  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(10),
  );
  final  addEmployeeCtrl =
  Get.find<AddEmployeeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => AnimatedContainer(
        duration: const Duration(milliseconds: 750),
        height: AppScreenUtil().screenHeight(425),
        width: (addEmployeeCtrl.isStaffAddEmployeeDrawer.value == true)
            ? AppScreenUtil().screenWidth(88)
            : 0,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: employeeDashBoardTableBoxShadowColor)
            ]),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(16),
                right: AppScreenUtil().screenWidth(16),
                top: AppScreenUtil().screenHeight(7),
                bottom: AppScreenUtil().screenHeight(18)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///Drawer items
                    GestureDetector(
                      onTap: () {
                        addEmployeeCtrl.addEmployeeDrawerTappedItem.value =
                        'Personal Info';
                        if (addEmployeeCtrl.isStaffAddEmployeeDrawer.value) {
                          addEmployeeCtrl.isStaffAddEmployeeDrawer.value =
                              false;
                        }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                          containerColor:    addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                              'Personal Info'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgPersonalInfo,
                          iconWidth: 18.9,
                          label: 'Personal Info'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        addEmployeeCtrl.addEmployeeDrawerTappedItem.value =
                        'Company Info';
                        if (addEmployeeCtrl.isStaffAddEmployeeDrawer.value) {
                          addEmployeeCtrl.isStaffAddEmployeeDrawer.value =
                              false;
                        }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                          containerColor:
                          addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                              'Company Info'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgCompanyInfo,
                          iconWidth: 19.04,
                          label: 'Company Info'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        addEmployeeCtrl.addEmployeeDrawerTappedItem.value =
                        'Bank Details';
                        if (addEmployeeCtrl.isStaffAddEmployeeDrawer.value) {
                          addEmployeeCtrl.isStaffAddEmployeeDrawer.value =
                              false;
                        }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                          containerColor:
                          addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                              'Bank Details'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgBankDetails,
                          iconWidth: 18.89,
                          label: 'Bank Details'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        addEmployeeCtrl.addEmployeeDrawerTappedItem.value =
                        'Loan Details';
                        // if (addEmployeeCtrl.isStaffAddEmployeeDrawer.value) {
                        //   addEmployeeCtrl.isStaffAddEmployeeDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: disabledDashBoardDrawerLabelStyle,
                          containerColor:
                          (  addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                              'Loan Details' ||addEmployeeCtrl.addEmployeeDrawerTappedItem.value == 'Apply for Loan')? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgLoanDetails,
                          iconWidth: 16.59, color: confirmColor.withOpacity(0.2),
                          label: 'Loan Details'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        addEmployeeCtrl.addEmployeeDrawerTappedItem.value =
                        'Leave Details';
                        // if (addEmployeeCtrl.isStaffAddEmployeeDrawer.value) {
                        //   addEmployeeCtrl.isStaffAddEmployeeDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: disabledDashBoardDrawerLabelStyle,
                          containerColor:
                          ( addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                              'Leave Details' ||addEmployeeCtrl.addEmployeeDrawerTappedItem.value == 'Apply for Leave') ? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9, color: confirmColor.withOpacity(0.2),
                          iconPath: ImageCons.imgLeaveDetails,
                          iconWidth: 18.83,
                          label: 'Leave Details'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        addEmployeeCtrl.addEmployeeDrawerTappedItem.value =
                        'Payslips';
                        // if (addEmployeeCtrl.isStaffAddEmployeeDrawer.value) {
                        //   addEmployeeCtrl.isStaffAddEmployeeDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: disabledDashBoardDrawerLabelStyle,
                          containerColor:
                          addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                              'Payslips'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgPaySlips, color: confirmColor.withOpacity(0.2),
                          iconWidth: 18.9,
                          label: 'Payslips'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        addEmployeeCtrl.addEmployeeDrawerTappedItem.value =
                        'Document Details';
                        // if (addEmployeeCtrl.isStaffAddEmployeeDrawer.value) {
                        //   addEmployeeCtrl.isStaffAddEmployeeDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: disabledDashBoardDrawerLabelStyle,
                          containerColor:
                          addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                              'Document Details'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgDocumentDetails, color: confirmColor.withOpacity(0.2),
                          iconWidth: 14.4,
                          label: 'Document\nDetails'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        addEmployeeCtrl.addEmployeeDrawerTappedItem.value =
                        'Document Details';
                        // if (addEmployeeCtrl.isStaffAddEmployeeDrawer.value) {
                        //   addEmployeeCtrl.isStaffAddEmployeeDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: disabledDashBoardDrawerLabelStyle,
                          containerColor:
                          addEmployeeCtrl.addEmployeeDrawerTappedItem.value ==
                              'Document Details'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgDashBoard,
                          color: confirmColor.withOpacity(0.2),
                          iconWidth: 18.9,
                          label: 'Document Details'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
