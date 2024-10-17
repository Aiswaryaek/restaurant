import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_items.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../styles/textstyles.dart';
import '../features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';

class EmployeeDashBoardDrawer extends StatelessWidget {
  EmployeeDashBoardDrawer({super.key});
  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(10),
  );
  final ManageEmployeeController manageEmployeCtrl =
      Get.put(ManageEmployeeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 750),
        height: AppScreenUtil().screenHeight(425),
        width: (manageEmployeCtrl.isEmployeeDashboardDrawer.value == true)
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
                        manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                            'Dashboard';
                        // if (manageEmployeCtrl.isEmployeeDashboardDrawer.value) {
                        //   manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                          containerColor:
                              manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                            'Dashboard'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgDashBoard,
                          iconWidth: 18.9,
                          label: 'Dashboard'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                            'Personal Info';
                        // if (manageEmployeCtrl.isEmployeeDashboardDrawer.value) {
                        //   manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                          containerColor:    manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                            'Personal Info'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgPersonalInfo,
                          iconWidth: 18.9,
                          label: 'Personal Info'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                            'Company Info';
                        // if (manageEmployeCtrl.isEmployeeDashboardDrawer.value) {
                        //   manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                         containerColor:
                              manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                            'Company Info'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgCompanyInfo,
                          iconWidth: 19.04,
                          label: 'Company Info'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                            'Bank Details';
                        // if (manageEmployeCtrl.isEmployeeDashboardDrawer.value) {
                        //   manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                      containerColor:
                              manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                            'Bank Details'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgBankDetails,
                          iconWidth: 18.89,
                          label: 'Bank Details'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                            'Loan Details';
                        // if (manageEmployeCtrl.isEmployeeDashboardDrawer.value) {
                        //   manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                         containerColor:
                            (  manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                            'Loan Details' ||manageEmployeCtrl.manageEmployeeDrawerTappedItem.value == 'Apply for Loan')? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgLoanDetails,
                          iconWidth: 16.59,
                          label: 'Loan Details'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                            'Leave Details';
                        // if (manageEmployeCtrl.isEmployeeDashboardDrawer.value) {
                        //   manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                       containerColor:
                             ( manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                            'Leave Details' ||manageEmployeCtrl.manageEmployeeDrawerTappedItem.value == 'Apply for Leave') ? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgLeaveDetails,
                          iconWidth: 18.83,
                          label: 'Leave Details'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                            'Payslips';
                        // if (manageEmployeCtrl.isEmployeeDashboardDrawer.value) {
                        //   manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                       containerColor:
                              manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                            'Payslips'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgPaySlips,
                          iconWidth: 18.9,
                          label: 'Payslips'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                            'Document Details';
                        // if (manageEmployeCtrl.isEmployeeDashboardDrawer.value) {
                        //   manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                        //       false;
                        // }
                      },
                      child: EmployeeDashBoardItems(textStyle: employeeDashBoardDrawerLabelStyle,
                          containerColor:
                              manageEmployeCtrl.manageEmployeeDrawerTappedItem.value ==
                            'Document Details'? employeeDashBoardLeaveDataContainerColor:Colors.transparent,
                          iconHeight: 18.9,
                          iconPath: ImageCons.imgDocumentDetails,
                          iconWidth: 14.4,
                          label: 'Document\nDetails'),
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
