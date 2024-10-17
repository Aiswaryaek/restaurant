 // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/sub_sales.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/add_employee/controller/add_employe_controller.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/employee_dash_board.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/sub_staff.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';

class Staff extends StatefulWidget {
  const Staff({
    super.key,
  });

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  final configuration = <ProductCategoriesModel>[];
  dynamic currentTab;
  String? item;
  int? tappedConfiguration;
  final  addEmployeeCtrl =
  Get.find<AddEmployeeController>();

  @override
  void initState() {
    configuration.add(ProductCategoriesModel('Dashboard', ImageCons.imgStaffDashboard));
    configuration.add(ProductCategoriesModel('Department', ImageCons.imgStaffDepartment));
    configuration.add(ProductCategoriesModel('Designation', ImageCons.imgStaffDesignation));
    configuration.add(ProductCategoriesModel('Manage Employee', ImageCons.imgManageEmployee));
    configuration.add(ProductCategoriesModel('Add Employee',ImageCons.imgAddEmployee));
    configuration.add(ProductCategoriesModel('Add Document', ImageCons.imgAddDocument));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentTab == 'Dashboard' ||
            currentTab == 'Department' ||
            currentTab == 'Designation' ||
            currentTab == 'Manage Employee' ||
            currentTab == 'Add Document' ||
            currentTab == 'Add Employee'
        ? SubStaff(
            currentTab,
          )
        : Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 0),
            // height: 600,
            width: double.infinity,
            // padding: EdgeInsets.fromLTRB(5, 3, 15, 13),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    tabPageLeftGradientColor,
                    tabPageRightGradientColor,
                  ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Column(children: [
              SizedBox(height: AppScreenUtil().screenHeight(25),),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: Offset(0, -2),
                      child: Center(
                        child: Text(
                          'Staff',
                          style: dashBoardLabelTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(18),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 8,
                      children: List<Widget>.generate(configuration.length,
                          (int index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                tappedConfiguration = index;
                                currentTab = configuration[index].text;
                                currentTab == 'Add Employee'?addEmployeeCtrl
                                    .addEmployeeDrawerTappedItem
                                    .value = 'Personal Info':addEmployeeCtrl
                                    .addEmployeeDrawerTappedItem
                                    .value = '';
                              });
                              print('current Tab :$currentTab');
                            },
                            child: Container(
                              width: AppScreenUtil().screenWidth(80),
                              color: Colors.transparent,
                              padding: EdgeInsets.only(right: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: configuration[index].icon ==ImageCons.imgStaffDashboard? EdgeInsets.all(12.5):EdgeInsets.all(11.5),
                                    height: AppScreenUtil().screenHeight(38),
                                    width: AppScreenUtil().screenWidth(47),
                                    decoration: BoxDecoration(
                                      color: tabSelectionAColor
                                          .withOpacity(0.20),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                    SvgPicture.asset(configuration[index].icon),
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(6),
                                  ),
                                  Center(
                                    child: Text(
                                      configuration[index].text,textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style:
                                      clearDataAlertYesButtonLabelStyle,
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }).toList(),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(25),
                    ),
                  ],
                ),
              ))
            ]));
  }
}
