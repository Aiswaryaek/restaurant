import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/sub_inventory.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_non_scrollable_table.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../../../user_app/widgets/common_image_view.dart';
import '../../../../../../../../../user_app/widgets/custom_button.dart';

class ApplyLoanScreen extends StatefulWidget {
  const ApplyLoanScreen({super.key});

  @override
  State<ApplyLoanScreen> createState() => _ApplyLoanScreenState();
}

class _ApplyLoanScreenState extends State<ApplyLoanScreen> {
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
  ScrollController applyLoanTableController = ScrollController();
  double applyLoanTableIndicatorPosition = 0.0;
  ///These lists are used only for testing purpose
  List<String> typeList = ['PAN Card','Aadhar Card'];
  List<String> documentNumberList = ['GNCDH5254N','GNCDH5254N'];
  List<String> imageList = [
    'https://etaxadvisor.com/wp-content/uploads/2016/07/pan-card1.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/3/3f/A_sample_of_Aadhaar_card.jpg'
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppScreenUtil().screenHeight(30),
        left: AppScreenUtil().screenWidth(18),
        right: AppScreenUtil().screenWidth(18),
      ),
      child: Column(
        children: [
          ///Employee details label
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Employee Details',
                style: companyInfoBoldTitleLabelStyle,
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Employee Name')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Employee ID')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'Contact')),
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
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Department Manager')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Branch Name')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(

                  ///This container is used only for spacing arrangement
                  child: Container()),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Loan Details',
                style: companyInfoBoldTitleLabelStyle,
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Payment Method')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'Loan Type')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Loan Amount')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Start Date')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Interest Date')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'Tenure')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Interest Amount')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'End Date')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Extra Interest Amount')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Interest Type')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Remaining Amount')),
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
                'Bank Details',
                style: companyInfoBoldTitleLabelStyle,
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'Bank Name')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Account Holder Amount')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Account No.')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'IFSC Code')),
            ],
          ),
          constHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(), title: 'Branch')),
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
                'Add Document',
                style: companyInfoBoldTitleLabelStyle,
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Select Document Type')),
              SizedBox(width: AppScreenUtil().screenWidth(24)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Document No.')),
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
            height: AppScreenUtil().screenHeight(20),
          ),

          ///Submit button
          CustomButton(
            buttonHeight: AppScreenUtil().screenHeight(20),
            buttonWidth: AppScreenUtil().screenWidth(70),
            buttonColor: blackColor,
            borderRadius: 10,
            buttonText: 'Submit',
            buttonLabelStyle: applyLoanSubmitButtonStyle,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  color: clearDataAlertYesButtonBoxShadowColor)
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),

          ///Table layout
          CustomNonScrollableTable(
              visible: false,
              scrollController: applyLoanTableController,
              slidingIndicatorPosition: applyLoanTableIndicatorPosition,
              tableDataWidgets: List.generate(typeList.length, (index) {
                return InkWell(
                  onTap: () {
                    inventoryProductBottomSheet(context);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width:double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: tableDataAlternateColor[
                            index % tableDataAlternateColor.length],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(18)),

                        ///scrolling row
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(70),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      typeList[index],
                                      style: dashBoardTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(85),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(documentNumberList[index],
                                      style: dashBoardTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(70),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonImageView(
                                      url: imageList[index],
                                      height: 23,
                                      width: 30,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              tableRowWidth: double.infinity,
              titleWidgets: [
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Type',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Document No.',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Image',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
              ]),
        ],
      ),
    );
  }
}
