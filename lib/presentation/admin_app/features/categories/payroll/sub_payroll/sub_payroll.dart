// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/presentation/admin_app/features/categories/Payroll/Payroll.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/attendance/list/attendance_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/batch_payslip/create/batch_payslip_branch_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/batch_payslip/list/batch_payslip_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/contract/create/contract.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/eos/create/eos.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/eos/list/eos_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/leave/leave.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/loan/list/loan_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/loan_eligibilty/create/loan_eligibility.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/loan_eligibilty/list/loan_eligibility_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/overtime/list/overtime_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/pay_head/list/pay_head_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/pay_other/list/pay_other_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/pay_template/create/pay_template.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/pay_template/list/pay_template_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/payslip/create/payslip.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/payslip/list/grid_view.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/payslip/list/list_view.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/salary_disbursement/create/salary_disbursement.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/salary_disbursement/list/salary_disbursement.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/settings/payroll_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/sponsor/create/sponsor.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/sponsor/list/sponsor_list.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';
import '../../../../../user_app/widgets/custom_button.dart';
import '../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import 'batch_payslip/create/batch_payslip.dart';
import 'contract/list/contract_list.dart';
import 'loan/create/loan.dart';
import 'loan/create/loan_details.dart';
import 'overtime/create/overtime.dart';

class SubPayroll extends StatefulWidget {
  String tappedItem;
  String tappedHeadItem;

  SubPayroll(this.tappedItem, this.tappedHeadItem, {super.key});

  @override
  State<SubPayroll> createState() => _SubPayrollState();
}

class _SubPayrollState extends State<SubPayroll> {
  final dateController = TextEditingController();
  final chequeController = TextEditingController();
  final chequeNoController = TextEditingController();
  final transactionNoController = TextEditingController();
  final nameController = TextEditingController();
  final percentageOfCTCController = TextEditingController();
  final fixedAmountController = TextEditingController();
  final amountController = TextEditingController();
  final List<String> _dropdownItems = [
    'Basic',
    'Allowance',
    'Deduction',
    'Commission',
    'Bonus'
  ];
  String? _selectedItem = 'Basic';
  final List<String> categoryItems = [
    'Basic',
    'Allowance',
    'Deduction',
    'Commission',
    'Bonus'
  ];
  String? selectedCategory = 'Basic';
  final List<String> calculationTypeItems = [
    '% of CTC',
    'Fixed Amount',
    'Deduction'
  ];
  String? selectedCalculationType;
  final List<String> expenseAccountItems = ['Salaries A/C', 'Lorem'];
  String? selectedExpenseAccount;
  final List<String> allowanceIncludeInBasicItems = ['True', 'False'];
  String? selectedAllowanceIncludeInBasic;
  final List<String> allowanceCalculationTypeItems = [
    '% of Basic',
    'Fixed Amount',
  ];
  String? selectedAllowanceCalculationType;
  final List<String> loanDeductionItems = ['True', 'False'];
  String? selectedLoanDeduction;
  bool status = true;

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

  @override
  Widget build(BuildContext context) {
    print(widget.tappedItem);
    print('head Item : ${widget.tappedHeadItem}');
    return widget.tappedItem == 'Payroll'
        ? Payroll()
        : Column(
            children: [
              SizedBox(
                height: AppScreenUtil().screenHeight(25),
              ),
              Expanded(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppScreenUtil().screenWidth(16),
                        right: AppScreenUtil().screenWidth(16),
                        bottom: AppScreenUtil().screenHeight(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        ///Filter button
                        widget.tappedItem == 'Payslip' ||
                                widget.tappedItem == 'GridView' ||
                                widget.tappedItem == 'ListView' ||
                                widget.tappedItem == 'Batch PaySlip' ||
                                widget.tappedItem == 'Salary Disbursement' ||
                                widget.tappedItem == 'Contract' ||
                                widget.tappedItem == 'Sponsor' ||
                                widget.tappedItem == 'Loan' ||
                                widget.tappedItem == 'Loan Eligibility' ||
                                widget.tappedItem == 'Attendance' ||
                                widget.tappedItem == 'Leave Create' ||
                                widget.tappedItem == 'OverTime' ||
                                widget.tappedItem == 'EOS' ||
                                widget.tappedItem == 'Pay Head' ||
                                widget.tappedItem == 'Pay Head Create' ||
                                widget.tappedItem == 'Pay Other' ||
                                widget.tappedItem == 'Pay Other Create' ||
                                widget.tappedItem == 'Pay Template' ||
                                widget.tappedItem == 'Settings Create' ||
                                widget.tappedItem == 'Report'
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
                                          style: gridTextStyle,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : widget.tappedItem == 'Batch PaySlip Create' ||
                                    widget.tappedItem == 'Branch' ||
                                    widget.tappedItem == 'Contract Create' ||
                                    widget.tappedItem == 'Loan Create'
                                ? Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageCons.save,
                                        height: 23,
                                        width: 12,
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(8),
                                      ),
                                      widget.tappedItem == 'Loan Create'
                                          ? GestureDetector(
                                              onTap: () {
                                                addPostDialogue(context);
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 2),
                                                  width: AppScreenUtil()
                                                      .screenWidth(47),
                                                  height: AppScreenUtil()
                                                      .screenHeight(18),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: confirmColor),
                                                  child: Center(
                                                    child: Text(
                                                      'Post',
                                                      style:
                                                          inventoryCreateButtonLabelStyle,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.tappedItem = 'Branch';
                                                  widget.tappedHeadItem =
                                                      'Batch PaySlip';
                                                });
                                              },
                                              child: widget.tappedItem ==
                                                      'Branch'
                                                  ? Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 2),
                                                      width: AppScreenUtil()
                                                          .screenWidth(47),
                                                      height: AppScreenUtil()
                                                          .screenHeight(18),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  5),
                                                          color: confirmColor),
                                                      child: Center(
                                                        child: Text(
                                                          'Post',
                                                          style:
                                                              inventoryCreateButtonLabelStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ))
                                                  : widget.tappedItem ==
                                                          'Contract Create'
                                                      ? Container(
                                                          padding: EdgeInsets.only(
                                                              bottom: 2),
                                                          width: AppScreenUtil()
                                                              .screenWidth(47),
                                                          height: AppScreenUtil()
                                                              .screenHeight(18),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5),
                                                              color: contractButtonColor),
                                                          child: Center(
                                                            child: Text(
                                                              'Cancel',
                                                              style:
                                                                  inventoryCreateButtonLabelStyle,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ))
                                                      : Container(
                                                          padding: EdgeInsets.only(bottom: 2),
                                                          height: AppScreenUtil().screenHeight(18),
                                                          width: AppScreenUtil().screenWidth(93),
                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: confirmColor),
                                                          child: Center(
                                                            child: Text(
                                                              'Generate Payslip',
                                                              style:
                                                                  inventoryCreateButtonLabelStyle,
                                                            ),
                                                          )))
                                    ],
                                  )
                                : SvgPicture.asset(
                                    ImageCons.save,
                                    height: 23,
                                    width: 12,
                                  ),
                        widget.tappedItem == 'Payslip' ||
                                widget.tappedItem == 'GridView' ||
                                widget.tappedItem == 'ListView' ||
                                widget.tappedItem == 'Batch PaySlip' ||
                                widget.tappedItem == 'Salary Disbursement' ||
                                widget.tappedItem == 'Contract' ||
                                widget.tappedItem == 'Sponsor' ||
                                widget.tappedItem == 'Loan' ||
                                widget.tappedItem == 'Loan Eligibility' ||
                                widget.tappedItem == 'Attendance' ||
                                widget.tappedItem == 'Leave' ||
                                widget.tappedItem == 'OverTime' ||
                                widget.tappedItem == 'EOS' ||
                                widget.tappedItem == 'Pay Head' ||
                                widget.tappedItem == 'Pay Head Create' ||
                                widget.tappedItem == 'Pay Other' ||
                                widget.tappedItem == 'Pay Other Create' ||
                                widget.tappedItem == 'Pay Template' ||
                                widget.tappedItem == 'Settings' ||
                                widget.tappedItem == 'Report'
                            ? Transform.translate(
                                offset: Offset(0, -17.5),
                                child: Center(
                                  child: Text(
                                    'Payroll',
                                    style: btnTextStyle,
                                  ),
                                ),
                              )
                            : Transform.translate(
                                offset: Offset(0, -25),
                                child: Center(
                                  child: Text(
                                    'Payroll',
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
                                        widget.tappedItem = 'Payroll';
                                      });
                                    },
                                    child: Text(
                                      'Payroll',
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

                                  ///Middle Tap text
                                  widget.tappedHeadItem == 'Payroll'
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.tappedItem = 'Payroll';
                                                });
                                              },
                                              child: Text(
                                                widget.tappedHeadItem,
                                                style:
                                                    taxCreateEnterAPassWordLabelStyle,
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
                                        ),

                                  ///Last Tap text
                                  Expanded(
                                    child: Container(
                                        width:
                                            AppScreenUtil().screenHeight(120),
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                widget.tappedItem ==
                                                            'ListView' ||
                                                        widget.tappedItem ==
                                                            'GridView'
                                                    ? 'Payslip'
                                                    : widget.tappedItem ==
                                                            'Loan'
                                                        ? 'Loan List'
                                                        : widget.tappedItem ==
                                                                'Pay Head Create'
                                                            ? 'Pay Head'
                                                            : widget.tappedItem ==
                                                                    'Pay Other Create'
                                                                ? 'Pay Other'
                                                                : widget.tappedItem ==
                                                                        'Pay Template Create'
                                                                    ? 'Pay Template'
                                                                    : widget.tappedItem ==
                                                                            'Payslip Create'
                                                                        ? 'Payslip'
                                                                        : widget.tappedItem ==
                                                                                'Batch PaySlip Create'
                                                                            ? 'Batch PaySlip'
                                                                            : widget.tappedItem == 'Salary Disbursement Create'
                                                                                ? 'Salary Disbursement'
                                                                                : widget.tappedItem == 'Contract Create'
                                                                                    ? 'Contract'
                                                                                    : widget.tappedItem == 'Sponsor Create'
                                                                                        ? 'Sponsor'
                                                                                        : widget.tappedItem == 'Loan Create'
                                                                                            ? 'Loan'
                                                                                            : widget.tappedItem == 'Loan Eligibility Create'
                                                                                                ? 'Loan Eligibility'
                                                                                                : widget.tappedItem == 'OverTime Create'
                                                                                                    ? 'OverTime'
                                                                                                    : widget.tappedItem == 'EOS Create'
                                                                                                        ? 'EOS'
                                                                                                        : widget.tappedItem == 'Pay Template Create'
                                                                                                            ? 'Pay Template'
                                                                                                            : widget.tappedItem == 'Report Create'
                                                                                                                ? 'Report'
                                                                                                                : widget.tappedItem,
                                                maxLines: 1,
                                                style: gridTextStyle,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    width: AppScreenUtil().screenWidth(15),
                                  )

                                  ///Create button
                                ],
                              ),
                            ),
                            widget.tappedItem == 'Payslip' ||
                                    widget.tappedItem == 'GridView' ||
                                    widget.tappedItem == 'ListView'
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.tappedItem = 'ListView';
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: widget.tappedItem ==
                                                      'ListView' ||
                                                  widget.tappedItem == 'Payslip'
                                              ? inventorySelectionColor
                                              : whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: SvgPicture.asset(
                                          ImageCons.imgPayslipList),
                                    ))
                                : SizedBox(),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                            widget.tappedItem == 'Payslip' ||
                                    widget.tappedItem == 'GridView' ||
                                    widget.tappedItem == 'ListView'
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.tappedItem = 'GridView';
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: widget.tappedItem ==
                                                      'ListView' ||
                                                  widget.tappedItem == 'Payslip'
                                              ? whiteColor
                                              : inventorySelectionColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: SvgPicture.asset(
                                          ImageCons.imgPayslipGrid),
                                    ))
                                : SizedBox(),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                            Visibility(
                              visible: (widget.tappedItem == 'Payslip Create' ||
                                      widget.tappedItem ==
                                          'Batch PaySlip Create' ||
                                      widget.tappedItem == 'Branch' ||
                                      widget.tappedItem ==
                                          'Salary Disbursement Create' ||
                                      widget.tappedItem == 'Contract Create' ||
                                      widget.tappedItem == 'Sponsor Create' ||
                                      widget.tappedItem == 'Loan Create' ||
                                      widget.tappedItem == 'Loan ' ||
                                      widget.tappedItem ==
                                          'Loan Eligibility Create' ||
                                      widget.tappedItem == 'Attendance' ||
                                      widget.tappedItem == 'Leave' ||
                                      widget.tappedItem == 'OverTime Create' ||
                                      widget.tappedItem == 'EOS Create' ||
                                      widget.tappedItem ==
                                          'Pay Template Create' ||
                                      widget.tappedItem == 'Settings' ||
                                      widget.tappedItem == 'Report Create')
                                  ? false
                                  : true,
                              child: CustomButton(
                                  buttonHeight:
                                      AppScreenUtil().screenHeight(18),
                                  buttonWidth: widget.tappedItem == 'Sponsor'
                                      ? AppScreenUtil().screenWidth(77)
                                      : widget.tappedItem == 'Loan Eligibility'
                                          ? AppScreenUtil().screenWidth(96)
                                          : widget.tappedItem == 'OverTime' ||
                                                  widget.tappedItem ==
                                                      'Pay Head' ||
                                                  widget.tappedItem ==
                                                      'Pay Head Create' ||
                                                  widget.tappedItem ==
                                                      'Pay Other' ||
                                                  widget.tappedItem ==
                                                      'Pay Other Create' ||
                                                  widget.tappedItem == 'EOS' ||
                                                  widget.tappedItem ==
                                                      'Pay Template'
                                              ? AppScreenUtil().screenWidth(84)
                                              : AppScreenUtil().screenWidth(61),
                                  buttonColor: confirmColor,
                                  borderRadius: 4,
                                  buttonText: widget.tappedItem == 'Sponsor'
                                      ? 'Create Sponsor'
                                      : widget.tappedItem == 'Loan Eligibility'
                                          ? 'Add Loan Eligibility'
                                          : widget.tappedItem == 'OverTime'
                                              ? 'Create Overtime'
                                              : widget.tappedItem == 'Pay Head'
                                                  ? 'Create Pay Head'
                                                  : widget.tappedItem ==
                                                          'Pay Template'
                                                      ? 'Create Template'
                                                      : widget.tappedItem ==
                                                              'Pay Other'
                                                          ? 'Create Pay Other'
                                                          : widget.tappedItem ==
                                                                  'Pay Head Create'
                                                              ? 'Create Pay Head'
                                                              : widget.tappedItem ==
                                                                      'Pay Other Create'
                                                                  ? 'Create Pay Other'
                                                                  : widget.tappedItem ==
                                                                          'EOS'
                                                                      ? 'Create Overtime'
                                                                      : 'Create',
                                  onTap: () {
                                    widget.tappedItem == 'Pay Head' ||
                                            widget.tappedItem ==
                                                'Pay Head Create'
                                        ? createPayHeadDialogue(context)
                                        : widget.tappedItem == 'Pay Other' ||
                                                widget.tappedItem ==
                                                    'Pay Other Create'
                                            ? createPayOtherDialogue(context)
                                            : dispose;
                                    setState(() {
                                      if (widget.tappedItem == 'Payslip' ||
                                          widget.tappedItem == 'GridView' ||
                                          widget.tappedItem == 'ListView') {
                                        widget.tappedItem = 'Payslip Create';
                                      } else if (widget.tappedItem ==
                                          'Batch PaySlip') {
                                        widget.tappedItem =
                                            'Batch PaySlip Create';
                                      } else if (widget.tappedItem ==
                                          'Contract') {
                                        widget.tappedItem = 'Contract Create';
                                      } else if (widget.tappedItem ==
                                          'Salary Disbursement') {
                                        widget.tappedItem =
                                            'Salary Disbursement Create';
                                      } else if (widget.tappedItem ==
                                          'Sponsor') {
                                        widget.tappedItem = 'Sponsor Create';
                                      } else if (widget.tappedItem == 'Loan') {
                                        widget.tappedItem = 'Loan Create';
                                      } else if (widget.tappedItem ==
                                          'Loan Eligibility') {
                                        widget.tappedItem =
                                            'Loan Eligibility Create';
                                      } else if (widget.tappedItem ==
                                          'Attendance') {
                                        widget.tappedItem = 'Attendance Create';
                                      } else if (widget.tappedItem == 'Leave') {
                                        widget.tappedItem = 'Leave Create';
                                      } else if (widget.tappedItem ==
                                          'OverTime') {
                                        widget.tappedItem = 'OverTime Create';
                                      } else if (widget.tappedItem == 'EOS') {
                                        widget.tappedItem = 'EOS Create';
                                      } else if (widget.tappedItem ==
                                          'Pay Head') {
                                        widget.tappedItem = 'Pay Head Create';
                                      } else if (widget.tappedItem ==
                                          'Pay Other') {
                                        widget.tappedItem = 'Pay Other Create';
                                      } else if (widget.tappedItem ==
                                          'Pay Template') {
                                        widget.tappedItem =
                                            'Pay Template Create';
                                      } else if (widget.tappedItem ==
                                          'Settings') {
                                        widget.tappedItem = 'Settings Create';
                                      } else if (widget.tappedItem ==
                                          'Report') {
                                        widget.tappedItem = 'Report Create';
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
                  Expanded(
                      child: SingleChildScrollView(
                          child: widget.tappedItem == 'Payslip' ||
                                  widget.tappedItem == 'ListView'
                              ? PayslipListView()
                              : widget.tappedItem == 'GridView'
                                  ? PayslipGridView()
                                  : widget.tappedItem == 'Payslip Create'
                                      ? Payslip()
                                      : widget.tappedItem == 'Batch PaySlip'
                                          ? BatchPayslipList()
                                          : widget.tappedItem ==
                                                  'Batch PaySlip Create'
                                              ? BatchPayslip()
                                              : widget.tappedItem == 'Branch'
                                                  ? BatchPaySlipBranchList()
                                                  : widget.tappedItem ==
                                                          'Contract'
                                                      ? ContractList()
                                                      : widget.tappedItem ==
                                                              'Contract Create'
                                                          ? Contract()
                                                          : widget.tappedItem ==
                                                                  'Sponsor'
                                                              ? SponsorList()
                                                              : widget.tappedItem ==
                                                                      'Sponsor Create'
                                                                  ? Sponsor()
                                                                  : widget.tappedItem ==
                                                                          'Loan'
                                                                      ? LoanList()
                                                                      : widget.tappedItem ==
                                                                              'Loan Create'
                                                                          ? Loan()
                                                                          : widget.tappedItem == 'Loan '
                                                                              ? LoanDetails()
                                                                              : widget.tappedItem == 'Loan Eligibility'
                                                                                  ? LoanEligibilityList()
                                                                                  : widget.tappedItem == 'Loan Eligibility Create'
                                                                                      ? LoanEligibility()
                                                                                      : widget.tappedItem == 'Attendance'
                                                                                          ? AttendanceList()
                                                                                          : widget.tappedItem == 'Leave'
                                                                                              ? Leave()
                                                                                              : widget.tappedItem == 'OverTime'
                                                                                                  ? OvertimeList()
                                                                                                  : widget.tappedItem == 'OverTime Create'
                                                                                                      ? Overtime()
                                                                                                      : widget.tappedItem == 'EOS'
                                                                                                          ? EOSList()
                                                                                                          : widget.tappedItem == 'EOS Create'
                                                                                                              ? EOSPage()
                                                                                                              : widget.tappedItem == 'Salary Disbursement'
                                                                                                                  ? SalaryDisbursementList()
                                                                                                                  : widget.tappedItem == 'Salary Disbursement Create'
                                                                                                                      ? SalaryDisbursement()
                                                                                                                      : widget.tappedItem == 'Settings'
                                                                                                                          ? PayrollSettings()
                                                                                                                          : widget.tappedItem == 'Pay Head'
                                                                                                                              ? PayHeadList()
                                                                                                                              : widget.tappedItem == 'Pay Head Create'
                                                                                                                                  ? PayHeadList()
                                                                                                                                  : widget.tappedItem == 'Pay Other'
                                                                                                                                      ? PayOtherList()
                                                                                                                                      : widget.tappedItem == 'Pay Other Create'
                                                                                                                                          ? PayOtherList()
                                                                                                                                          : widget.tappedItem == 'Pay Template'
                                                                                                                                              ? PayTemplateList()
                                                                                                                                              : widget.tappedItem == 'Pay Template Create'
                                                                                                                                                  ? PayTemplate()
                                                                                                                                                  : widget.tappedItem == 'Pay Template Create'
                                                                                                                                                      ? PayTemplate()
                                                                                                                                                      : Text('Last Item')))
                ]),
              )
            ],
          );
////
  }

  void createPayOtherDialogue(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(18, 18, 18, 25),
                    width: AppScreenUtil().screenWidth(226),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              ImageCons.save,
                              height: 23,
                              width: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  status == false ? 'InActive' : 'Active',
                                  style: bookedTextStyle,
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(5),
                                ),
                                FlutterSwitch(
                                  width: 35,
                                  height: 16,
                                  toggleSize: 10.0,
                                  value: status,
                                  borderRadius: 60.0,
                                  padding: 2.0,
                                  toggleColor: status == false
                                      ? confirmColor
                                      : greenColor,
                                  switchBorder: Border.all(
                                    color: status == false
                                        ? confirmColor
                                        : greenColor,
                                    width: 1,
                                  ),
                                  toggleBorder: Border.all(
                                    color: status == false
                                        ? confirmColor
                                        : greenColor,
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
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Text(
                          'Category',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: 38.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: textFieldColor),
                          child: DropdownButton<String>(
                            style: searchInputTextStyle,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            value: selectedCategory,
                            items: categoryItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: searchInputTextStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategory = newValue;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: blackColor,
                            ),
                            iconSize: 22,
                            isExpanded: true,
                            underline:
                                const SizedBox(), // Removes the default underline
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(13),
                        ),
                        Text(
                          'Name',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 3),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: textFieldColor,
                              border:
                                  Border.all(color: textFieldColor, width: 3)),
                          child: SizedBox(
                              height: 30.5,
                              child: Center(
                                child: TextFormField(
                                  controller: nameController,
                                  style: searchInputTextStyle,
                                  cursorColor: whiteColor,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    hintStyle: loremTextStyle,
                                    fillColor: blackColor,
                                    focusColor: textFieldColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(13),
                        ),
                        Text(
                          'Amount',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 3),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: textFieldColor,
                              border:
                                  Border.all(color: textFieldColor, width: 3)),
                          child: SizedBox(
                              height: 30.5,
                              child: Center(
                                child: TextFormField(
                                  controller: amountController,
                                  style: searchInputTextStyle,
                                  cursorColor: whiteColor,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    hintStyle: loremTextStyle,
                                    fillColor: blackColor,
                                    focusColor: textFieldColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(13),
                        ),
                        Text(
                          'Default Account',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: 38.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: textFieldColor),
                          child: DropdownButton<String>(
                            style: searchInputTextStyle,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            value: selectedExpenseAccount,
                            items: expenseAccountItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: searchInputTextStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedExpenseAccount = newValue;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: blackColor,
                            ),
                            iconSize: 22,
                            isExpanded: true,
                            underline:
                                const SizedBox(), // Removes the default underline
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(15),
                        ),
                        Row(
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
                                  child: Text('Back',
                                      style: categoryMenuTextStyle,
                                      textAlign: TextAlign.center),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void addPostDialogue(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(18, 35, 18, 25),
                    width: AppScreenUtil().screenWidth(226),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(12, 9, 12, 9),
                          decoration: BoxDecoration(
                              border: Border.all(color: blackColor, width: 1),
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.transparent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Employee',
                                style: taxCreateEnterAPassWordLabelStyle,
                              ),
                              Text(
                                ': EMP054-Vaisak',
                                style: taxCreateEnterAPassWordLabelStyle,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(10),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(12, 9, 12, 9),
                          decoration: BoxDecoration(
                              border: Border.all(color: blackColor, width: 1),
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.transparent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Loan Amount',
                                style: taxCreateEnterAPassWordLabelStyle,
                              ),
                              Text(
                                ': 5000.00',
                                style: taxCreateEnterAPassWordLabelStyle,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Divider(
                          color: blackColor.withOpacity(0.2),
                          thickness: 0.5,
                        ),
                        Text(
                          'Date',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Container(
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: textFieldColor),
                          child: TextField(
                              style: searchInputTextStyle,
                              controller: dateController,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 2, left: 10),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 11, bottom: 11),
                                    child: SvgPicture.asset(
                                      ImageCons.calender,
                                      height: 11,
                                      width: 11,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide:
                                        BorderSide(color: textFieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide:
                                        BorderSide(color: textFieldColor),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide:
                                        BorderSide(color: textFieldColor),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide:
                                        BorderSide(color: textFieldColor),
                                  ),
                                  labelText: ""),
                              readOnly: true,
                              onTap: () {
                                dateSelection(controller: dateController);
                              }),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(10),
                        ),
                        Text(
                          'Cheque Date',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Container(
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: textFieldColor),
                          child: TextField(
                              style: searchInputTextStyle,
                              controller: chequeController,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 2, left: 10),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 11, bottom: 11),
                                    child: SvgPicture.asset(
                                      ImageCons.calender,
                                      height: 11,
                                      width: 11,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide:
                                        BorderSide(color: textFieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide:
                                        BorderSide(color: textFieldColor),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide:
                                        BorderSide(color: textFieldColor),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide:
                                        BorderSide(color: textFieldColor),
                                  ),
                                  labelText: ""),
                              readOnly: true,
                              onTap: () {
                                dateSelection(controller: chequeController);
                              }),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(10),
                        ),
                        Text(
                          'Payment Method',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: 38.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: textFieldColor),
                          child: DropdownButton<String>(
                            style: searchInputTextStyle,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            value: _selectedItem,
                            items: _dropdownItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: searchInputTextStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: blackColor,
                            ),
                            iconSize: 22,
                            isExpanded: true,
                            underline:
                                const SizedBox(), // Removes the default underline
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(10),
                        ),
                        Text(
                          'Cheque No',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 3),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: textFieldColor,
                              border:
                                  Border.all(color: textFieldColor, width: 3)),
                          child: SizedBox(
                              height: 30.5,
                              child: Center(
                                child: TextFormField(
                                  controller: chequeNoController,
                                  style: searchInputTextStyle,
                                  cursorColor: whiteColor,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    hintStyle: loremTextStyle,
                                    fillColor: blackColor,
                                    focusColor: textFieldColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(10),
                        ),
                        Text(
                          'Type',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: 38.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: textFieldColor),
                          child: DropdownButton<String>(
                            style: searchInputTextStyle,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            value: _selectedItem,
                            items: _dropdownItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: searchInputTextStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: blackColor,
                            ),
                            iconSize: 22,
                            isExpanded: true,
                            underline:
                                const SizedBox(), // Removes the default underline
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(10),
                        ),
                        Text(
                          'Transaction No',
                          style: _selectedItem == 'Allowance'
                              ? disabledTransactionStyle
                              : taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                            height: 37.5,
                            padding: EdgeInsets.all(1),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _selectedItem == 'Allowance'
                                  ? textFieldColor.withOpacity(0.4)
                                  : textFieldColor,
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: transactionNoController,
                                style: searchInputTextStyle,
                                cursorColor: whiteColor,
                                readOnly:
                                    _selectedItem == 'Allowance' ? true : false,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  isDense: true,
                                  hintStyle: loremTextStyle,
                                  fillColor: _selectedItem == 'Allowance'
                                      ? textFieldColor.withOpacity(0.2)
                                      : blackColor,
                                  focusColor: _selectedItem == 'Allowance'
                                      ? textFieldColor.withOpacity(0.2)
                                      : textFieldColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _selectedItem == 'Allowance'
                                            ? textFieldColor.withOpacity(0.2)
                                            : textFieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _selectedItem == 'Allowance'
                                            ? textFieldColor.withOpacity(0.2)
                                            : textFieldColor),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _selectedItem == 'Allowance'
                                            ? textFieldColor.withOpacity(0.2)
                                            : textFieldColor),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _selectedItem == 'Allowance'
                                            ? textFieldColor.withOpacity(0.2)
                                            : textFieldColor),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Container(
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
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(8),
                            ),
                            GestureDetector(
                              child: Container(
                                  width: 70,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: blackColor,
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.all(color: blackColor)),
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Post',
                                        style:
                                            employeeDashBoardDateAndTimeLabelStyle,
                                        textAlign: TextAlign.center),
                                  )),
                              onTap: () {
                                setState(() {
                                  widget.tappedItem = 'Loan ';
                                });
                                Navigator.pop(context);
                                loanDialogue(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void createPayHeadDialogue(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(18, 18, 18, 25),
                    width: AppScreenUtil().screenWidth(226),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              ImageCons.save,
                              height: 23,
                              width: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Active',
                                  style: bookedTextStyle,
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(5),
                                ),
                                FlutterSwitch(
                                  width: 35,
                                  height: 16,
                                  toggleSize: 10.0,
                                  value: status,
                                  borderRadius: 60.0,
                                  padding: 2.0,
                                  toggleColor: status == false
                                      ? confirmColor
                                      : greenColor,
                                  switchBorder: Border.all(
                                    color: status == false
                                        ? confirmColor
                                        : greenColor,
                                    width: 1,
                                  ),
                                  toggleBorder: Border.all(
                                    color: status == false
                                        ? confirmColor
                                        : greenColor,
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
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Text(
                          'Category',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        Container(
                          height: 38.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: textFieldColor),
                          child: DropdownButton<String>(
                            style: searchInputTextStyle,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            value: selectedCategory,
                            items: categoryItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: searchInputTextStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategory = newValue;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: blackColor,
                            ),
                            iconSize: 22,
                            isExpanded: true,
                            underline:
                                const SizedBox(), // Removes the default underline
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(13),
                        ),
                        Text(
                          'Name',
                          style: taxCreateEnterAPassWordLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 3),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: textFieldColor,
                              border:
                                  Border.all(color: textFieldColor, width: 3)),
                          child: SizedBox(
                              height: 30.5,
                              child: Center(
                                child: TextFormField(
                                  controller: nameController,
                                  style: searchInputTextStyle,
                                  cursorColor: whiteColor,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    hintStyle: loremTextStyle,
                                    fillColor: blackColor,
                                    focusColor: textFieldColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: textFieldColor),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(13),
                        ),
                        selectedCategory == 'Basic'
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Calculation Type',
                                    style: taxCreateEnterAPassWordLabelStyle,
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(5),
                                  ),
                                  Container(
                                    height: 38.5,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: textFieldColor),
                                    child: DropdownButton<String>(
                                      style: searchInputTextStyle,
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      value: selectedCalculationType,
                                      items: calculationTypeItems
                                          .map((String item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: searchInputTextStyle,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedCalculationType = newValue;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: blackColor,
                                      ),
                                      iconSize: 22,
                                      isExpanded: true,
                                      underline:
                                          const SizedBox(), // Removes the default underline
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(13),
                                  ),
                                  Text(
                                    selectedCalculationType == 'Fixed Amount'
                                        ? 'Fixed Amount'
                                        : 'Percentage of CTC',
                                    style: taxCreateEnterAPassWordLabelStyle,
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(6),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 3),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: textFieldColor,
                                        border: Border.all(
                                            color: textFieldColor, width: 3)),
                                    child: SizedBox(
                                        height: 30.5,
                                        child: Center(
                                          child: TextFormField(
                                            controller:
                                                selectedCalculationType ==
                                                        'Fixed Amount'
                                                    ? fixedAmountController
                                                    : percentageOfCTCController,
                                            style: searchInputTextStyle,
                                            cursorColor: whiteColor,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(10),
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
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(13),
                                  ),
                                  Text(
                                    'Expense Account',
                                    style: taxCreateEnterAPassWordLabelStyle,
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(5),
                                  ),
                                  Container(
                                    height: 38.5,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: textFieldColor),
                                    child: DropdownButton<String>(
                                      style: searchInputTextStyle,
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      value: selectedExpenseAccount,
                                      items: expenseAccountItems
                                          .map((String item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: searchInputTextStyle,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedExpenseAccount = newValue;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: blackColor,
                                      ),
                                      iconSize: 22,
                                      isExpanded: true,
                                      underline:
                                          const SizedBox(), // Removes the default underline
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(15),
                                  ),
                                ],
                              )
                            : selectedCategory == 'Allowance'
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Include In Basic',
                                        style:
                                            taxCreateEnterAPassWordLabelStyle,
                                      ),
                                      SizedBox(
                                        height: AppScreenUtil().screenHeight(5),
                                      ),
                                      Container(
                                        height: 38.5,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: textFieldColor),
                                        child: DropdownButton<String>(
                                          style: searchInputTextStyle,
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          value:
                                              selectedAllowanceIncludeInBasic,
                                          items: allowanceIncludeInBasicItems
                                              .map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: searchInputTextStyle,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedAllowanceIncludeInBasic =
                                                  newValue;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: blackColor,
                                          ),
                                          iconSize: 22,
                                          isExpanded: true,
                                          underline:
                                              const SizedBox(), // Removes the default underline
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppScreenUtil().screenHeight(13),
                                      ),
                                      selectedAllowanceIncludeInBasic == 'True'
                                          ? Text(
                                              'Calculation Type',
                                              style:
                                                  taxCreateEnterAPassWordLabelStyle,
                                            )
                                          : SizedBox(),
                                      selectedAllowanceIncludeInBasic == 'True'
                                          ? SizedBox(
                                              height: AppScreenUtil()
                                                  .screenHeight(5),
                                            )
                                          : SizedBox(),
                                      selectedAllowanceIncludeInBasic == 'True'
                                          ? Container(
                                              height: 38.5,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: textFieldColor),
                                              child: DropdownButton<String>(
                                                style: searchInputTextStyle,
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                value:
                                                    selectedAllowanceCalculationType,
                                                items:
                                                    allowanceCalculationTypeItems
                                                        .map((String item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style:
                                                          searchInputTextStyle,
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedAllowanceCalculationType =
                                                        newValue;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: blackColor,
                                                ),
                                                iconSize: 22,
                                                isExpanded: true,
                                                underline:
                                                    const SizedBox(), // Removes the default underline
                                              ),
                                            )
                                          : SizedBox(),
                                      selectedAllowanceIncludeInBasic == 'True'
                                          ? SizedBox(
                                              height: AppScreenUtil()
                                                  .screenHeight(13),
                                            )
                                          : SizedBox(),
                                      selectedAllowanceIncludeInBasic == 'True'
                                          ? Text(
                                              selectedAllowanceCalculationType ==
                                                      'Fixed Amount'
                                                  ? 'Amount'
                                                  : 'Percentage of Basic',
                                              style:
                                                  taxCreateEnterAPassWordLabelStyle,
                                            )
                                          : Text(
                                              'Fixed Amount',
                                              style:
                                                  taxCreateEnterAPassWordLabelStyle,
                                            ),
                                      SizedBox(
                                        height: AppScreenUtil().screenHeight(6),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 3),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: textFieldColor,
                                            border: Border.all(
                                                color: textFieldColor,
                                                width: 3)),
                                        child: SizedBox(
                                            height: 30.5,
                                            child: Center(
                                              child: TextFormField(
                                                controller: selectedCalculationType ==
                                                            'Fixed Amount' ||
                                                        selectedAllowanceIncludeInBasic ==
                                                            'True'
                                                    ? fixedAmountController
                                                    : percentageOfCTCController,
                                                style: searchInputTextStyle,
                                                cursorColor: whiteColor,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  isDense: true,
                                                  hintStyle: loremTextStyle,
                                                  fillColor: blackColor,
                                                  focusColor: textFieldColor,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: textFieldColor),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: textFieldColor),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: textFieldColor),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: textFieldColor),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height:
                                            AppScreenUtil().screenHeight(13),
                                      ),
                                      Text(
                                        'Expense Account',
                                        style:
                                            taxCreateEnterAPassWordLabelStyle,
                                      ),
                                      SizedBox(
                                        height: AppScreenUtil().screenHeight(5),
                                      ),
                                      Container(
                                        height: 38.5,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: textFieldColor),
                                        child: DropdownButton<String>(
                                          style: searchInputTextStyle,
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          value: selectedExpenseAccount,
                                          items: expenseAccountItems
                                              .map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: searchInputTextStyle,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedExpenseAccount = newValue;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: blackColor,
                                          ),
                                          iconSize: 22,
                                          isExpanded: true,
                                          underline:
                                              const SizedBox(), // Removes the default underline
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppScreenUtil().screenHeight(15),
                                      ),
                                    ],
                                  )
                                : selectedCategory == 'Deduction'
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Is Loan Deduction',
                                            style:
                                                taxCreateEnterAPassWordLabelStyle,
                                          ),
                                          SizedBox(
                                            height:
                                                AppScreenUtil().screenHeight(5),
                                          ),
                                          Container(
                                            height: 38.5,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                color: textFieldColor),
                                            child: DropdownButton<String>(
                                              style: searchInputTextStyle,
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              value: selectedLoanDeduction,
                                              items: loanDeductionItems
                                                  .map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: searchInputTextStyle,
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedLoanDeduction =
                                                      newValue;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: blackColor,
                                              ),
                                              iconSize: 22,
                                              isExpanded: true,
                                              underline:
                                                  const SizedBox(), // Removes the default underline
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppScreenUtil()
                                                .screenHeight(13),
                                          ),
                                          selectedLoanDeduction == 'False'
                                              ? Text(
                                                  'Amount',
                                                  style:
                                                      taxCreateEnterAPassWordLabelStyle,
                                                )
                                              : SizedBox(),
                                          selectedLoanDeduction == 'False'
                                              ? SizedBox(
                                                  height: AppScreenUtil()
                                                      .screenHeight(6),
                                                )
                                              : SizedBox(),
                                          selectedLoanDeduction == 'False'
                                              ? Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 3),
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: textFieldColor,
                                                      border: Border.all(
                                                          color: textFieldColor,
                                                          width: 3)),
                                                  child: SizedBox(
                                                      height: 30.5,
                                                      child: Center(
                                                        child: TextFormField(
                                                          controller:
                                                              fixedAmountController,
                                                          style:
                                                              searchInputTextStyle,
                                                          cursorColor:
                                                              whiteColor,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            isDense: true,
                                                            hintStyle:
                                                                loremTextStyle,
                                                            fillColor:
                                                                blackColor,
                                                            focusColor:
                                                                textFieldColor,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          textFieldColor),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          textFieldColor),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          textFieldColor),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          textFieldColor),
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                )
                                              : SizedBox(),
                                          selectedLoanDeduction == 'False'
                                              ? SizedBox(
                                                  height: AppScreenUtil()
                                                      .screenHeight(13),
                                                )
                                              : SizedBox(),
                                          Text(
                                            selectedLoanDeduction == 'False'
                                                ? 'Loan Account'
                                                : 'Expense Account',
                                            style:
                                                taxCreateEnterAPassWordLabelStyle,
                                          ),
                                          SizedBox(
                                            height:
                                                AppScreenUtil().screenHeight(5),
                                          ),
                                          Container(
                                            height: 38.5,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                color: textFieldColor),
                                            child: DropdownButton<String>(
                                              style: searchInputTextStyle,
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              value: selectedExpenseAccount,
                                              items: expenseAccountItems
                                                  .map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: searchInputTextStyle,
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedExpenseAccount =
                                                      newValue;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: blackColor,
                                              ),
                                              iconSize: 22,
                                              isExpanded: true,
                                              underline:
                                                  const SizedBox(), // Removes the default underline
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppScreenUtil()
                                                .screenHeight(15),
                                          ),
                                        ],
                                      )
                                    : selectedCategory == 'Commission'
                                        ? Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Amount',
                                                style:
                                                    taxCreateEnterAPassWordLabelStyle,
                                              ),
                                              SizedBox(
                                                height: AppScreenUtil()
                                                    .screenHeight(6),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 3),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: textFieldColor,
                                                    border: Border.all(
                                                        color: textFieldColor,
                                                        width: 3)),
                                                child: SizedBox(
                                                    height: 30.5,
                                                    child: Center(
                                                      child: TextFormField(
                                                        controller:
                                                            fixedAmountController,
                                                        style:
                                                            searchInputTextStyle,
                                                        cursorColor: whiteColor,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          isDense: true,
                                                          hintStyle:
                                                              loremTextStyle,
                                                          fillColor: blackColor,
                                                          focusColor:
                                                              textFieldColor,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: AppScreenUtil()
                                                    .screenHeight(15),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Amount',
                                                style:
                                                    taxCreateEnterAPassWordLabelStyle,
                                              ),
                                              SizedBox(
                                                height: AppScreenUtil()
                                                    .screenHeight(6),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 3),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: textFieldColor,
                                                    border: Border.all(
                                                        color: textFieldColor,
                                                        width: 3)),
                                                child: SizedBox(
                                                    height: 30.5,
                                                    child: Center(
                                                      child: TextFormField(
                                                        controller:
                                                            fixedAmountController,
                                                        style:
                                                            searchInputTextStyle,
                                                        cursorColor: whiteColor,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          isDense: true,
                                                          hintStyle:
                                                              loremTextStyle,
                                                          fillColor: blackColor,
                                                          focusColor:
                                                              textFieldColor,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: AppScreenUtil()
                                                    .screenHeight(15),
                                              ),
                                              Text(
                                                'Expense Account',
                                                style:
                                                    taxCreateEnterAPassWordLabelStyle,
                                              ),
                                              SizedBox(
                                                height: AppScreenUtil()
                                                    .screenHeight(5),
                                              ),
                                              Container(
                                                height: 38.5,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    color: textFieldColor),
                                                child: DropdownButton<String>(
                                                  style: searchInputTextStyle,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  value: selectedExpenseAccount,
                                                  items: expenseAccountItems
                                                      .map((String item) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style:
                                                            searchInputTextStyle,
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      selectedExpenseAccount =
                                                          newValue;
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: blackColor,
                                                  ),
                                                  iconSize: 22,
                                                  isExpanded: true,
                                                  underline:
                                                      const SizedBox(), // Removes the default underline
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppScreenUtil()
                                                    .screenHeight(15),
                                              ),
                                            ],
                                          ),
                        Row(
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
                                  child: Text('Back',
                                      style: categoryMenuTextStyle,
                                      textAlign: TextAlign.center),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void loanDialogue(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        print(widget.tappedItem);
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Close the dialog
        });
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0), // Set border radius here
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: constantWhite,
            ),
            // height: AppScreenUtil().screenHeight(191),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Congratulations',
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(10),
                ),
                Text(
                  'You are eligible for a loan',
                  style: taxCreateEnterAPassWordLabelStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(5),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Lottie.asset('assets/loan.json', height: 70),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void checkListDialogue(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: constantWhite,
                ),
                // height: AppScreenUtil().screenHeight(191),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sorry !',
                      style: titleTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(10),
                    ),
                    Text(
                      'You are not eligible for a loan',
                      style: taxCreateEnterAPassWordLabelStyle,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Lottie.asset('assets/checklist.json', height: 70),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

void subPayrollBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
    ),
    context: context,
    builder: (context) {
      return Container(
        height: AppScreenUtil().screenHeight(100),
        decoration: BoxDecoration(
          color: confirmColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            SizedBox(
              width: AppScreenUtil().screenWidth(50),
              child: Center(
                child: Divider(
                  color: whiteColor,
                  thickness: 3,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InventoryBottomSheetItemLayout(
                      iconHeight: 13.09,
                      iconPath: ImageCons.imgDisabledView,
                      iconWidth: 20.53),
                  GestureDetector(
                    onTap: () {},
                    child: InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.edit,
                        iconWidth: 15.29),
                  ),
                  InventoryBottomSheetItemLayout(
                      iconHeight: 15.84,
                      iconPath: ImageCons.imgDelete,
                      iconWidth: 13.91),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

//Column(
//       children: [
//         Expanded(
//             child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: AppScreenUtil().screenHeight(25),
//               ),
//
//               ///Dashboard label
//               Text(
//                 'Dashboard',
//                 style: btnTextStyle,
//               ),
//               SizedBox(
//                 height: AppScreenUtil().screenHeight(12),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: AppScreenUtil().screenWidth(15)),
//                 child: Row(
//                   children: [
//                     ///Total item
//                     Expanded(
//                         flex: 108,
//                         child: AdminDashBoardMainContainer(
//                             iconPath: ImageCons.adminDashBoardTotalItem,
//                             title: 'Total Item',
//                             containerColor:
//                                 adminDashBoardTotalItemContainerColor)),
//
//                     SizedBox(
//                       width: AppScreenUtil().screenWidth(7),
//                     ),
//
//                     ///Total Reservation
//                     Expanded(
//                         flex: 108,
//                         child: AdminDashBoardMainContainer(
//                             iconPath: ImageCons.adminDashBoardTotalReservation,
//                             title: 'Total Reservation',
//                             containerColor:
//                                 adminDashBoardTotalReservationContainerColor)),
//
//                     SizedBox(
//                       width: AppScreenUtil().screenWidth(7),
//                     ),
//
//                     ///Total Revenue
//                     Expanded(
//                         flex: 108,
//                         child: AdminDashBoardMainContainer(
//                             iconPath: ImageCons.adminDashBoardTotalRevanue,
//                             title: 'Total Revenue',
//                             containerColor:
//                                 adminDashBoardTotalRevenueContainerColor)),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: AppScreenUtil().screenHeight(17),
//               ),
//
//               ///Total Revenue graph container
//               Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: AppScreenUtil().screenWidth(15)),
//                   child: Container(
//                     height: AppScreenUtil().screenHeight(184),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                             color: adminDashBoardTotalRevenueGraphContainerColor
//                                 .withOpacity(0.8),
//                             width: 0.14),
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(
//                                 AppScreenUtil().screenWidth(10)),
//                             topRight: Radius.circular(
//                                 AppScreenUtil().screenWidth(10))),
//                         color: adminDashBoardTotalRevenueGraphContainerColor
//                             .withOpacity(0.8)),
//                     child: Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(
//                                 left: AppScreenUtil().screenHeight(12),
//                                 right: AppScreenUtil().screenHeight(12)),
//                             child: Container(
//                               width: double.infinity,
//                               height: (AppScreenUtil().screenHeight(184) -
//                                   AppScreenUtil().screenHeight(159)),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Total Revenue',
//                                     style: totalRevenueTextStyle,
//                                   ),
//
//                                   ///Date dropdown
//                                   Container(
//                                     height: AppScreenUtil().screenHeight(12.67),
//                                     width: AppScreenUtil().screenWidth(57.45),
//                                     decoration: BoxDecoration(
//                                       color: adminDashBoardIconWhiteColor,
//                                       borderRadius: BorderRadius.circular(3),
//                                       boxShadow: const [
//                                         BoxShadow(
//                                           color:
//                                               adminDashBoardDateDropDownContainerBoxShadowColor,
//                                           offset: Offset(0, 3),
//                                           blurRadius: 6,
//                                         ),
//                                       ],
//                                     ),
//                                     child: DropdownButton<String>(
//                                       style: searchInputTextStyle,
//                                       padding: EdgeInsets.only(bottom: 2,left: 3,right: 3),
//                                       value: selectedCategory,
//                                       items: categoryItems.map((String item) {
//                                         return DropdownMenuItem<String>(
//                                           value: item,
//                                           child: Text(
//                                             item,
//                                             style: payrollTitleStyle,
//                                           ),
//                                         );
//                                       }).toList(),
//                                       onChanged: (String? newValue) {
//                                         setState(() {
//                                           selectedCategory = newValue;
//                                         });
//                                       },
//                                       icon: const Icon(
//                                         Icons.arrow_drop_down,
//                                         color: blackColor,
//                                       ),
//                                       iconSize: 15,
//                                       isExpanded: true,
//                                       underline:
//                                           const SizedBox(), // Removes the default underline
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: AppScreenUtil().screenHeight(157),
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(
//                                         AppScreenUtil().screenWidth(10)),
//                                     topRight: Radius.circular(
//                                         AppScreenUtil().screenWidth(10))),
//                                 color: adminDashBoardIconWhiteColor
//                                     .withOpacity(0.98)),
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   left: AppScreenUtil().screenWidth(9),
//                                   right: AppScreenUtil().screenWidth(9),
//                                   bottom: AppScreenUtil().screenHeight(9)),
//                               child: Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: Container(
//                                     child: const AdminDashBoardGraph(),
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )),
//
//               ///Table Data
//               ///Use the same width for heading and data container for the better alignment
//               ///Recent sales table
//               Padding(
//                 padding:
//                     EdgeInsets.only(bottom: AppScreenUtil().screenHeight(16)),
//                 child: AdminDashBoardTableLayout(
//                     heading: 'Recent Sales',
//                     scrollController: recentSalesScrollController,
//                     slidingIndicatorPosition: recentSalesIndicatorPosition,
//                     tableDataWidgets: List.generate(branchList.length, (index) {
//                       return Padding(
//                         padding: EdgeInsets.only(
//                             bottom: AppScreenUtil().screenWidth(5)),
//                         child: Container(
//                           height: AppScreenUtil().screenHeight(36),
//                           width: AppScreenUtil().screenWidth(660),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             color: tableDataAlternateColor[
//                                 index % tableDataAlternateColor.length],
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: AppScreenUtil().screenWidth(18)),
//
//                             ///scrolling row
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         branchList[index],
//                                         style: tableSubTitleLabelStyle,
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(orderIdList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(dateList[index],
//                                           style: tableDateFontStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(customerNameList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(itemQuantityList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(amountList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                     tableRowWidth: 660,
//                     titleWidgets: [
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Branch',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Order ID',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Date',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Customer',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'item Qty',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Amt',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]),
//               ),
//
//               ///Credit details table
//
//               Padding(
//                 padding:
//                     EdgeInsets.only(bottom: AppScreenUtil().screenHeight(16)),
//                 child: AdminDashBoardTableLayout(
//                     heading: 'Credit Details',
//                     scrollController: creditDetailScrollController,
//                     slidingIndicatorPosition: creditDetailsIndicatorPosition,
//                     tableDataWidgets: List.generate(branchList.length, (index) {
//                       return Padding(
//                         padding: EdgeInsets.only(
//                             bottom: AppScreenUtil().screenWidth(5)),
//                         child: Container(
//                           height: AppScreenUtil().screenHeight(36),
//                           width: AppScreenUtil().screenWidth(636),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             color: tableDataAlternateColor[
//                                 index % tableDataAlternateColor.length],
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: AppScreenUtil().screenWidth(18)),
//
//                             ///scrolling row
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(orderIdList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(dateList[index],
//                                           style: tableDateFontStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(amountList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(80),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(dateList[index],
//                                           style: tableDateFontStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(55),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(amountList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(50),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(amountList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                     tableRowWidth: 636,
//                     titleWidgets: [
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Order ID',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Order Date',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'NetAmt',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(80),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'L.P. Date',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(55),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Paid Amt',
//                               style: tableTitleLabelStyle,
//                               overflow: TextOverflow.fade,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(50),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Balance',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]),
//               ),
//
//               ///Staff Expitransparent Documents
//
//               Padding(
//                 padding:
//                     EdgeInsets.only(bottom: AppScreenUtil().screenHeight(16)),
//                 child: AdminDashBoardTableLayout(
//                     heading: 'Staff Expired Documents',
//                     scrollController: staffExpiredDocumentsScrollController,
//                     slidingIndicatorPosition:
//                         staffExpiredDocumentsIndicatorPosition,
//                     tableDataWidgets: List.generate(branchList.length, (index) {
//                       return Padding(
//                         padding: EdgeInsets.only(
//                             bottom: AppScreenUtil().screenWidth(5)),
//                         child: Container(
//                           height: AppScreenUtil().screenHeight(36),
//                           width: AppScreenUtil().screenWidth(480),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             color: tableDataAlternateColor[
//                                 index % tableDataAlternateColor.length],
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: AppScreenUtil().screenWidth(18)),
//
//                             ///scrolling row
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(70),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(employList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(75),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(employIdList[index],
//                                           style: tableDateFontStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(70),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(documentsList[index],
//                                           style: tableSubTitleLabelStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   color: Colors.transparent,
//                                   width: AppScreenUtil().screenWidth(70),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(dateList[index],
//                                           style: tableDateFontStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                     tableRowWidth: 480,
//                     titleWidgets: [
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(70),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Employee',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(75),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Employee ID',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(70),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Documents',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         color: Colors.transparent,
//                         width: AppScreenUtil().screenWidth(70),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Expiry Date',
//                               style: tableTitleLabelStyle,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]),
//               ),
//
//               //                    Padding(
//               //                    padding:  EdgeInsets.only(left: AppScreenUtil().screenWidth(15), right: AppScreenUtil().screenWidth(15),top: AppScreenUtil().screenHeight(15),bottom: AppScreenUtil().screenHeight(5)),
//               //                      child: Align(
//               //                       alignment: Alignment.topLeft,
//               //                       child: Text('Recent Sales',style: tableHeadingLabelStyle,)),
//               //                    ),
//               //                    Padding(
//               //   padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(15)),
//               //   child: SingleChildScrollView(
//               //     scrollDirection: Axis.horizontal,
//               //        controller: _scrollController,
//               //     child: Padding(
//               //       padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(15)),
//               //       child: Column(
//
//               //         children: [
//               //           ///Table heading
//               //           Padding(
//               //             padding:  EdgeInsets.only(bottom:  AppScreenUtil().screenWidth(5)),
//               //             child: Container(
//               //                   height: AppScreenUtil().screenHeight(36),
//               //                   width: AppScreenUtil().screenWidth(636),
//
//               //                   decoration: BoxDecoration(
//               //                     borderRadius: BorderRadius.circular(6),
//               //                     color: constantWhite,
//               //                   ),
//               //                   child: Padding(
//               //                     padding:  EdgeInsets.symmetric(horizontal:AppScreenUtil().screenWidth(18) ),
//               //                     child: Row(
//               //                       mainAxisSize: MainAxisSize.min,
//               //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //                       children: [
//               // Container(
//               //   color: Colors.transparent,
//               //   width: AppScreenUtil().screenWidth(70),
//               //   child: Text('Branch', style: tableTitleLabelStyle,maxLines:1 ,),
//               // ),
//               // Container(
//               //   color: Colors.red,
//               //   width: AppScreenUtil().screenWidth(70),
//               //   child: Text('Order.ID', style: tableTitleLabelStyle,maxLines:1 ,),
//               // ),
//               // Container(
//               //   color: Colors.red,
//               //   width: AppScreenUtil().screenWidth(50),
//               //   child: Column(
//               //     mainAxisSize: MainAxisSize.min,
//               //     crossAxisAlignment: CrossAxisAlignment.center,
//               //     children: [
//               //       Text('Date', style: tableTitleLabelStyle,maxLines: 1,),
//               //     ],
//               //   ),
//               // ),
//               // Container(
//               //   color: Colors.red,
//               //   width: AppScreenUtil().screenWidth(70),
//               //   child: Text('Customer', style: tableTitleLabelStyle,maxLines: 1,),
//               // ),
//               // Container(
//               //   color: Colors.red
//               //   ,
//               //   width: AppScreenUtil().screenWidth(50),
//               //   child: Text('item Qty', style: tableTitleLabelStyle,maxLines: 1,),
//               // ),
//               // Container(
//               //   color: Colors.red,
//               //   width: AppScreenUtil().screenWidth(45),
//               //   child: Text('Amt', style: tableTitleLabelStyle,maxLines: 1,),
//               // ),
//               //                       ],
//               //                     ),
//               //                   ),
//               //                 ),
//               //           ),
//
//               //           Column(
//               // children: List.generate(branchList.length, (index) {
//               //   return Padding(
//               //     padding:  EdgeInsets.only(bottom:  AppScreenUtil().screenWidth(5)),
//               //     child: Container(
//               //       height: AppScreenUtil().screenHeight(36),
//               //       width: AppScreenUtil().screenWidth(636),
//
//               //       decoration: BoxDecoration(
//               //         borderRadius: BorderRadius.circular(6),
//               //         color: tableDataAlternateColor[index % tableDataAlternateColor.length],
//               //       ),
//               //       child: Padding(
//               //         padding:  EdgeInsets.symmetric(horizontal:AppScreenUtil().screenWidth(18) ),
//               //         ///scrolling row
//               //         child: Row(
//               //           mainAxisSize: MainAxisSize.min,
//               //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //           children: [
//               //             Container(
//               //               color: Colors.transparent,
//               //               width: AppScreenUtil().screenWidth(70),
//               //               child: Text(branchList[index], style: tableSubTitleLabelStyle,maxLines:1,overflow: TextOverflow.ellipsis ,),
//               //             ),
//               //             Container(
//               //               color: Colors.transparent,
//               //               width: AppScreenUtil().screenWidth(70),
//               //               child: Text(orderIdList[index], style: tableSubTitleLabelStyle,maxLines:1 ,overflow: TextOverflow.ellipsis ),
//               //             ),
//               //             Container(
//               //               color: Colors.transparent,
//               //               width: AppScreenUtil().screenWidth(50),
//               //               child: Text(dateList[index], style: tableDateFontStyle,maxLines: 1,overflow: TextOverflow.ellipsis ),
//               //             ),
//               //             Container(
//               //               color: Colors.transparent,
//               //               width: AppScreenUtil().screenWidth(70),
//               //               child: Text(customerNameList[index], style: tableSubTitleLabelStyle,maxLines: 1,overflow: TextOverflow.ellipsis ),
//               //             ),
//               //             Container(
//               //               color: Colors.transparent
//               //               ,
//               //               width: AppScreenUtil().screenWidth(50),
//               //               child: Column(
//               //                 mainAxisSize: MainAxisSize.min,
//               //                 crossAxisAlignment: CrossAxisAlignment.center,
//               //                 children: [
//               //                   Text(itemQuantityList[index], style: tableSubTitleLabelStyle,maxLines: 1,overflow: TextOverflow.ellipsis ),
//               //                 ],
//               //               ),
//               //             ),
//               //             Container(
//               //               color: Colors.transparent,
//               //               width: AppScreenUtil().screenWidth(45),
//               //               child: Text(amountList[index], style: tableSubTitleLabelStyle,maxLines: 1,overflow: TextOverflow.ellipsis ),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //     ),
//               //   );
//               // }),
//               //           ),
//               //         ],
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(height: AppScreenUtil().screenHeight(14),),
//               // ///Scrolling indicator
//
//               // Container(
//               //     width:  AppScreenUtil().screenWidth(150),
//               //     height: AppScreenUtil().screenHeight(5),
//               //     color: Colors.transparent,
//               //   child: Stack(
//               //     children: [
//               //       Center(
//               //         ///Line container
//               //         child: Container(
//               //         width:  AppScreenUtil().screenWidth(150),
//               //         height: AppScreenUtil().screenHeight(0.5),
//               //         decoration: BoxDecoration(color: adminDashBoardSlidingIndicatorColor),
//
//               //         ),
//               //       ),
//               //       ///Sliding container
//               //       Positioned(
//               //         left: indicatorPosition,
//               //         child: Container(
//               //         width:  AppScreenUtil().screenWidth(40),
//               //             height: AppScreenUtil().screenHeight(5),
//               //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: adminDashBoardSlidingIndicatorColor),
//               //             ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // SizedBox(height: AppScreenUtil().screenHeight(9),),
//               // ///View more button
//               // Padding(
//               //   padding:  EdgeInsets.only(right:  AppScreenUtil().screenWidth(15)),
//               //   child: Align(
//               //     alignment: Alignment.topRight,
//               //     child: CustomButton(
//               //                                                   buttonHeight:
//               //                                                   AppScreenUtil().screenHeight(14),
//               //                                                     buttonWidth:
//               //                                                   AppScreenUtil().screenWidth(54),
//               //                                                   buttonColor: adminDashBoardTableAlternateColor,
//               //                                                   borderRadius: 7,
//               //                                                   buttonText: 'View More',
//               //                                                   buttonLabelStyle:
//               //                                                   adminDashBoardViewMoreButtonLabelStyle,
//
//               //                                                 ),
//               //   ),
//               // ),
//               ///Bottom space
//
//               SizedBox(
//                 height: AppScreenUtil().screenHeight(35),
//               )
//             ],
//           ),
//         ))
//       ],
//     )
