// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/sub_inventory.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/staff.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/add_document/create/add_document.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/add_document/list/add_document_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/add_employee/controller/add_employe_controller.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/department/department.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/designation/designation.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/employee_dash_board/employee_dash_board.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/list/manage_employee_list.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';
import '../../../../../user_app/widgets/custom_button.dart';
import '../../../../widgets/reason_textfield.dart';
import 'add_employee/view/personal_info.dart';
import 'dashboard/staff_dashboard.dart';

class SubStaff extends StatefulWidget {
  String tappedItem;

  SubStaff(
    this.tappedItem, {
    super.key,
  });

  @override
  State<SubStaff> createState() => _SubStaffState();
}

class _SubStaffState extends State<SubStaff> {
  final departmentNameController = TextEditingController();
  final designationController = TextEditingController();
  final detailsController = TextEditingController();
  final ManageEmployeeController manageEmployeCtrl =
      Get.put(ManageEmployeeController());
  final addEmployeeCtrl =
      Get.find<AddEmployeeController>();

  @override
  Widget build(BuildContext context) {
    print(widget.tappedItem);
    return widget.tappedItem == 'Staff'
        ? Staff()
        : Column(
            children: [
              SizedBox(height: AppScreenUtil().screenHeight(25),),
              Expanded(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppScreenUtil().screenWidth(16),
                        right: AppScreenUtil().screenWidth(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.tappedItem == 'Dashboard' ?SizedBox(height: AppScreenUtil().screenHeight(14),):SizedBox(),
                          ///
                          ///Filter button
                          widget.tappedItem == 'Department' ||
                              widget.tappedItem == 'Designation' ||
                              widget.tappedItem == 'Manage Employee' ||
                              widget.tappedItem == 'Add Document'
                              ? Transform.translate(
                            offset: Offset(0, 5),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              height: AppScreenUtil().screenHeight(14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: reductionBottomSheetButtonColor
                                      .withOpacity(0.1)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageCons.imgTableFilterIcon,
                                    height: 6.71,
                                    width: 10.06,
                                  ),
                                  SizedBox(
                                    width: AppScreenUtil().screenWidth(5.7),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 3),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Filter',
                                      style: mainRedTextStyle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                              : widget.tappedItem == 'Dashboard'
                              ? SizedBox()
                              : SvgPicture.asset(
                            ImageCons.save,
                            height: 23,
                            width: 12,
                          ),
                          widget.tappedItem == 'Dashboard' ||
                              widget.tappedItem == 'Department' ||
                              widget.tappedItem == 'Designation' ||
                              widget.tappedItem == 'Manage Employee' ||
                              widget.tappedItem == 'Add Employee' ||
                              widget.tappedItem == 'Add Document'
                              ? Transform.translate(
                            offset: Offset(0, -17.5),
                            child: Center(
                              child: Text(
                                'Staff',
                                style: btnTextStyle,
                              ),
                            ),
                          )
                              : Transform.translate(
                            offset: Offset(0, -25),
                            child: Center(
                              child: Text(
                                'Staff',
                                style: btnTextStyle,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widget.tappedItem = 'Staff';
                                        });
                                      },
                                      child: Text(
                                        'Staff',
                                        style: taxCreateEnterAPassWordLabelStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(2),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: blackColor,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(4),
                                    ),

                                    ///
                                    ///Middle Tap text
                                    widget.tappedItem == 'Add Employee'
                                        ? Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              widget.tappedItem = 'Staff';
                                            });
                                          },
                                          child: Text(
                                            widget.tappedItem,
                                            style: taxCreateEnterAPassWordLabelStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppScreenUtil()
                                              .screenWidth(2),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: blackColor,
                                          size: 10,
                                        ),
                                        SizedBox(
                                          width: AppScreenUtil()
                                              .screenWidth(4),
                                        ),
                                      ],
                                    )
                                        : SizedBox(),

                                    ///Last Tap text
                                    Expanded(
                                      child: Container(
                                        width: AppScreenUtil().screenHeight(120),
                                        color: Colors.transparent,
                                        child: Obx(() => Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                addEmployeeCtrl
                                                    .addEmployeeDrawerTappedItem
                                                    .value ==
                                                    'Company Info'
                                                    ? 'Company Info'
                                                    : addEmployeeCtrl
                                                    .addEmployeeDrawerTappedItem
                                                    .value ==
                                                    'Bank Details'
                                                    ? 'Bank Details'
                                                    : addEmployeeCtrl
                                                    .addEmployeeDrawerTappedItem
                                                    .value ==
                                                    'Personal Info'
                                                    ? 'Personal Info'
                                                    :widget
                                                    .tappedItem=='Add Document Create'?'Add Document': widget
                                                    .tappedItem,
                                                maxLines: 1,
                                                style: gridTextStyle,
                                                overflow:
                                                TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(15),
                                    )

                                    ///Create button
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: (widget.tappedItem == 'Dashboard' ||
                                    widget.tappedItem ==
                                        'Department Create' ||
                                    widget.tappedItem ==
                                        'Designation Create' ||
                                    widget.tappedItem == 'Manage Employee' ||
                                    widget.tappedItem ==
                                        'Employee Dashboard' ||
                                    widget.tappedItem == 'Add Employee' ||
                                    widget.tappedItem ==
                                        'Add Document Create' ||
                                    widget.tappedItem == 'Add Employee')
                                    ? false
                                    : true,
                                child: CustomButton(
                                    buttonHeight:
                                    AppScreenUtil().screenHeight(18),
                                    buttonWidth: widget.tappedItem ==
                                        'Department' ||
                                        widget.tappedItem == 'Designation' ||
                                        widget.tappedItem == 'Add Document'
                                        ? AppScreenUtil().screenWidth(85)
                                        : AppScreenUtil().screenWidth(61),
                                    buttonColor: confirmColor,
                                    borderRadius: 4,
                                    buttonText: widget.tappedItem == 'Department'
                                        ? 'Add Department'
                                        : widget.tappedItem == 'Designation'
                                        ? 'Add Designation'
                                        : widget.tappedItem == 'Add Document'
                                        ? 'Add Document'
                                        : 'Create',
                                    onTap: () {
                                      setState(() {
                                        manageEmployeCtrl
                                            .isEmployeeDashboardDrawer
                                            .value = false;

                                        if (widget.tappedItem == 'Dashboard') {
                                          widget.tappedItem = 'Dashboard Create';
                                        } else if (widget.tappedItem ==
                                            'Department') {
                                          addDepartmentDialogue(context);
                                          widget.tappedItem = 'Department';
                                        } else if (widget.tappedItem ==
                                            'Designation') {
                                          addDesignationDialogue(context);
                                          widget.tappedItem = 'Designation';
                                        } else if (widget.tappedItem ==
                                            'Manage Employee') {
                                          widget.tappedItem = 'Manage Employee';
                                        } else if (widget.tappedItem ==
                                            'Add Employee') {
                                          widget.tappedItem =
                                          'Add Employee Create';
                                        } else if (widget.tappedItem ==
                                            'Add Document') {
                                          widget.tappedItem =
                                          'Add Document Create';
                                        }
                                      });
                                    },
                                    buttonLabelStyle:
                                    inventoryCreateButtonLabelStyle),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(15),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SingleChildScrollView(child:  (widget.tappedItem == 'Employee Dashboard')
                        ? EmployeeDashBoard()
                        : widget.tappedItem == 'Manage Employee'
                        ? ManageEmployeeList(widget.tappedItem, () {
                      inventoryProductBottomSheet(context,
                          viewOnTap: () {
                            setState(() {
                              widget.tappedItem = 'Employee Dashboard';
                              Navigator.of(context).pop();
                            });
                          });
                    })
                        : widget.tappedItem == 'Designation'
                        ? Designation()
                        : widget.tappedItem == 'Department'
                        ? Department()
                        : widget.tappedItem == 'Add Document'
                        ? AddDocumentList()
                        : widget.tappedItem == 'Add Employee'
                        ? StaffPersonalInfo()
                        : widget.tappedItem ==
                        'Add Document Create'
                        ? AddDocument()
                        : widget.tappedItem == 'Dashboard'
                        ? StaffDashboard()
                        : Text('Last Item')))
                  ]),)
            ],
          );
  }

  void addDepartmentDialogue(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(7.0), // Set border radius here
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(18, 20, 18, 15),
                // height: AppScreenUtil().screenHeight(101),
                width: AppScreenUtil().screenWidth(226),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Department',
                      style: dialoguePasswordTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(10),
                    ),
                    Text(
                      'Department Name',
                      style: cartItemTitleStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: textFieldColor,
                          border: Border.all(color: textFieldColor, width: 3)),
                      child: SizedBox(
                          height: 28,
                          child: TextField(
                            controller: departmentNameController,
                            obscureText: true,
                            style: searchInputTextStyle,
                            // readOnly:widget.readOnly ,
                            cursorColor: whiteColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(7),
                              isDense: true,
                              hintStyle: loremTextStyle,
                              fillColor: blackColor,
                              focusColor: textFieldColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(color: blackColor)),
                                padding: EdgeInsets.only(bottom: 2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Cancel',
                                      style: categoryMenuTextStyle,
                                      textAlign: TextAlign.center),
                                )),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(8),
                            ),
                            Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(color: blackColor)),
                                padding: EdgeInsets.only(bottom: 2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Submit',
                                      style: confirmTextStyle,
                                      textAlign: TextAlign.center),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  void addDesignationDialogue(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(7.0), // Set border radius here
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(18, 20, 18, 15),
                // height: AppScreenUtil().screenHeight(101),
                width: AppScreenUtil().screenWidth(226),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Designation',
                      style: dialoguePasswordTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(13),
                    ),
                    Text(
                      'Department Name',
                      style: cartItemTitleStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: textFieldColor,
                          border: Border.all(color: textFieldColor, width: 3)),
                      child: SizedBox(
                          height: 28,
                          child: TextField(
                            controller: departmentNameController,
                            style: searchInputTextStyle,
                            // readOnly:widget.readOnly ,
                            cursorColor: whiteColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(7),
                              isDense: true,
                              hintStyle: loremTextStyle,
                              fillColor: blackColor,
                              focusColor: textFieldColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Text(
                      'Designation',
                      style: cartItemTitleStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: textFieldColor,
                          border: Border.all(color: textFieldColor, width: 3)),
                      child: SizedBox(
                          height: 28,
                          child: TextField(
                            controller: designationController,
                            style: searchInputTextStyle,
                            // readOnly:widget.readOnly ,
                            cursorColor: whiteColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(7),
                              isDense: true,
                              hintStyle: loremTextStyle,
                              fillColor: blackColor,
                              focusColor: textFieldColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    ReasonTextField(
                        color: textFieldColor,
                        controller: detailsController,
                        title: 'Details'),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(color: blackColor)),
                                padding: EdgeInsets.only(bottom: 2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Cancel',
                                      style: categoryMenuTextStyle,
                                      textAlign: TextAlign.center),
                                )),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(8),
                            ),
                            Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(color: blackColor)),
                                padding: EdgeInsets.only(bottom: 2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Submit',
                                      style: confirmTextStyle,
                                      textAlign: TextAlign.center),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  ///
}
