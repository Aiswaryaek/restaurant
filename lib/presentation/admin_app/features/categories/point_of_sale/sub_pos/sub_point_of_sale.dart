// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/branch_settings/create/branch_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/branch_settings/list/branch_settings_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/cash_or_card_summary/cash_or_card_summary.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/kot_display/kot_display.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/payment/pos_payment.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/petty_cash_receipts/list/petty_cash_receipts_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/pos_settings/pos_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/receipts/receipts.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/return/create/return.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/return/list/return_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/sales_details/sales_details.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift/add_return/shift_add_return.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift/list/shift.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/shift_report.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_summary_report/shift_summary_report.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/special_items/create/special_items.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/special_items/list/special_items_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/staff_expenses/add_expense/add_expense.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/staff_expenses/list/staff_expenses_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/wallet/wallet.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_toggle_button.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';
import '../../../../../user_app/widgets/custom_button.dart';
import '../../../../widgets/coloredDateField.dart';
import '../../../../widgets/colored_dropdown.dart';
import '../../../../widgets/colored_textfield.dart';
import '../point_of_sale.dart';
import 'add_expense_type/add_expense_type.dart';
import 'aggregator/list/aggregator.dart';
import 'credit/credit.dart';
import 'floor_management/floor_management.dart';
import 'orders/orders_controller.dart';
import 'orders/pos_orders.dart';
import 'outlet_expense/add/outlet_expense.dart';
import 'outlet_expense/list/outlet_expense.dart';

class SubPointOfSale extends StatefulWidget {
  String tappedItem;
  String tappedHeadItem;

  SubPointOfSale(this.tappedItem, this.tappedHeadItem, {super.key});

  @override
  State<SubPointOfSale> createState() => _SubPointOfSaleState();
}

class _SubPointOfSaleState extends State<SubPointOfSale> {
  bool isToggled = false;
  final docNoController = TextEditingController();
  final amountController = TextEditingController();
  final aggregatorNameController = TextEditingController();
  final commissionController = TextEditingController();
  final dateController = TextEditingController();
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

  final PosOrderController posOrdersCtrl = Get.put(PosOrderController());

  @override
  Widget build(BuildContext context) {
    return widget.tappedItem == 'Point Of Sale'
        ? PointOfSale()
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
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        ///Filter button
                        widget.tappedItem == 'Receipts' ||
                                widget.tappedItem == 'Wallet' ||
                                widget.tappedItem == 'Return' ||
                                widget.tappedItem == 'Branch Settings' ||
                                widget.tappedItem == 'Staff Expenses' ||
                                widget.tappedItem == 'Petty Cash Receipts' ||
                                widget.tappedItem == 'Orders' ||
                                widget.tappedItem == 'Special Items' ||
                                widget.tappedItem == 'Shift' ||
                                widget.tappedItem == 'Shift Report' ||
                                widget.tappedItem == 'Shift Summary Report' ||
                                widget.tappedItem == 'Sales Details' ||
                                widget.tappedItem ==
                                    'Daily Cash/Card Summary' ||
                                widget.tappedItem == 'Outlet Expenses' ||
                                widget.tappedItem == 'Aggregator'
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
                            : widget.tappedItem == 'Credit' ||
                                    widget.tappedItem == 'Wallet' ||
                                    widget.tappedItem == 'Floor Management'
                                ? SizedBox()
                                : SvgPicture.asset(
                                    ImageCons.save,
                                    height: 23,
                                    width: 12,
                                  ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),
                        Transform.translate(
                          offset: Offset(0, -20.5),
                          child: Center(
                            child: Text(
                              'Point Of Sale',
                              style: btnTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(),
                        Obx(
                          () => Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widget.tappedItem = 'Point Of Sale';
                                          posOrdersCtrl
                                              .orderDetailTapped.value = false;
                                        });
                                      },
                                      child: Text(
                                        'Point Of Sale',
                                        style:
                                            taxCreateEnterAPassWordLabelStyle,
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
                                    widget.tappedHeadItem == 'Billing'
                                        ? SizedBox()
                                        : Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    widget.tappedItem =
                                                        'Point Of Sale';
                                                    posOrdersCtrl
                                                        .orderDetailTapped
                                                        .value = false;
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
                                                  (widget.tappedItem ==
                                                          'Branch Settings Create')
                                                      ? 'Branch Settings'
                                                      : widget.tappedItem ==
                                                              'Special Items Create'
                                                          ? 'Special Items'
                                                          : widget.tappedItem ==
                                                                  'Return Create'
                                                              ? 'Return'
                                                              : widget.tappedItem ==
                                                                      'Branch Settings Create'
                                                                  ? 'Branch Settings'
                                                                  : widget.tappedItem ==
                                                                          'Special Items Create'
                                                                      ? 'Special Items'
                                                                      : widget.tappedItem ==
                                                                              'Shift Create'
                                                                          ? 'Shift'
                                                                          : widget.tappedItem == 'Aggregator Create'
                                                                              ? 'Aggregator'
                                                                              : widget.tappedItem,
                                                  maxLines: 1,
                                                  style: gridTextStyle,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                              // Visibility(
                              //   visible: widget.tappedItem == 'KOT Display'
                              //       ? true
                              //       : false,
                              //   child: CustomToggleButton(
                              //     isToggled: isToggled,
                              //     onTap: () {
                              //       setState(() {
                              //         isToggled = !isToggled;
                              //         isDarkMode = !isDarkMode;
                              //       });
                              //     },
                              //   ),
                              // ),
                              posOrdersCtrl.orderDetailTapped.value == true ||
                                      widget.tappedItem == 'Shift Report' ||
                                      widget.tappedItem ==
                                          'Shift Summary Report' ||
                                      widget.tappedItem == 'Sales Details' ||
                                      widget.tappedItem ==
                                          'Daily Cash/Card Summary'
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5.2),
                                          width:
                                              AppScreenUtil().screenWidth(24),
                                          height:
                                              AppScreenUtil().screenHeight(21),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: vendorBillBackGroundColor),
                                          child: SvgPicture.asset(
                                            ImageCons.imgPrinter,
                                            color: whiteColor,
                                            height: 11,
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppScreenUtil().screenWidth(7),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(4.5),
                                          width:
                                              AppScreenUtil().screenWidth(24),
                                          height:
                                              AppScreenUtil().screenHeight(21),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color:
                                                  vendorBillDownLoadBackgroundColor),
                                          child: SvgPicture.asset(
                                            ImageCons.imgPaySlipDownloadIcon,
                                            color: vendorBillBackGroundColor,
                                            height: 11,
                                          ),
                                        )
                                      ],
                                    )
                                  : Visibility(
                                      visible: (widget.tappedItem == 'Wallet' ||
                                              widget.tappedItem == 'Settings' ||
                                              widget.tappedItem ==
                                                  'Branch Settings Create' ||
                                              widget.tappedItem ==
                                                  'Add Expense' ||
                                              widget.tappedItem ==
                                                  'Add Outlet Expense' ||
                                              widget.tappedItem ==
                                                  'Add Expense Type' ||
                                              widget.tappedItem == 'Orders' ||
                                              widget.tappedItem == 'Payment' ||
                                              widget.tappedItem ==
                                                  'Special Items Create' ||
                                              widget.tappedItem == 'Shift' ||
                                              widget.tappedItem ==
                                                  'Shift Report' ||
                                              widget.tappedItem ==
                                                  'Shift Summary Report' ||
                                              widget.tappedItem ==
                                                  'Sales Details' ||
                                              widget.tappedItem ==
                                                  'Daily Cash/Card Summary')
                                          ? false
                                          : true,
                                      child: CustomButton(
                                          buttonHeight:
                                              AppScreenUtil().screenHeight(18),
                                          buttonWidth: widget.tappedItem ==
                                                  'Staff Expenses'
                                              ? AppScreenUtil().screenWidth(73)
                                              : widget.tappedItem ==
                                                      'Petty Cash Receipts'
                                                  ? AppScreenUtil()
                                                      .screenWidth(118)
                                                  : AppScreenUtil()
                                                      .screenWidth(61),
                                          buttonColor: confirmColor,
                                          borderRadius: 4,
                                          buttonText: widget.tappedItem ==
                                                  'Return'
                                              ? 'Add Return'
                                              : widget.tappedItem ==
                                                      'Staff Expenses'
                                                  ? 'Add Expense'
                                                  : widget.tappedItem ==
                                                          'Petty Cash Receipts'
                                                      ? 'Add Petty Cash Receipt'
                                                      : 'Create',
                                          onTap: () {
                                            widget.tappedItem ==
                                                    'Petty Cash Receipts'
                                                ? addPettyCashReceipts(context)
                                                : widget.tappedItem ==
                                                        'Aggregator'
                                                    ? addAggregator(
                                                        context)
                                                    : disable();
                                            setState(() {
                                              if (widget.tappedItem ==
                                                  'Receipts') {
                                                widget.tappedItem =
                                                    'Receipts Create';
                                              } else if (widget.tappedItem ==
                                                  'Return') {
                                                widget.tappedItem =
                                                    'Return Create';
                                              } else if (widget.tappedItem ==
                                                  'Credit') {
                                                widget.tappedItem =
                                                    'Credit Create';
                                              } else if (widget.tappedItem ==
                                                  'Wallet') {
                                                widget.tappedItem =
                                                    'Wallet Create';
                                              } else if (widget.tappedItem ==
                                                  'Branch Settings') {
                                                widget.tappedItem =
                                                    'Branch Settings Create';
                                              } else if (widget.tappedItem ==
                                                  'Staff Expenses') {
                                                widget.tappedItem =
                                                    'Add Expense';
                                              } else if (widget.tappedItem ==
                                                  'Outlet Expenses') {
                                                widget.tappedItem =
                                                    'Add Outlet Expense';
                                              } else if (widget.tappedItem ==
                                                  'Special Items') {
                                                widget.tappedItem =
                                                    'Special Items Create';
                                              } else if (widget.tappedItem ==
                                                  'Shift') {
                                                widget.tappedItem =
                                                    'Shift Create';
                                              }
                                            });
                                          },
                                          buttonLabelStyle:
                                              inventoryCreateButtonLabelStyle),
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(15),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: widget.tappedItem == 'Receipts'
                              ? Receipts()
                              : widget.tappedItem == 'Shift Report'
                                  ? ShiftReport()
                                  : widget.tappedItem == 'Shift Summary Report'
                                      ? ShiftSummaryReport()
                                      : widget.tappedItem == 'Return'
                                          ? ReturnList()
                                          : widget.tappedItem == 'Sales Details'
                                              ? SalesDetailReport()
                                              : widget.tappedItem ==
                                                      'Daily Cash/Card Summary'
                                                  ? CashOrCardSummary()
                                                  : widget.tappedItem ==
                                                          'Return Create'
                                                      ? Return()
                                                      : widget.tappedItem ==
                                                              'Aggregator'
                                                          ? AggregatorsList()
                                                          : widget.tappedItem ==
                                                                  'Credit'
                                                              ? Credit()
                                                              : widget.tappedItem ==
                                                                      'Wallet'
                                                                  ? Wallet()
                                                                  : widget.tappedItem ==
                                                                          'Floor Management'
                                                                      ? FloorManagement()
                                                                      : widget.tappedItem ==
                                                                              'Settings'
                                                                          ? PosSettings()
                                                                          : widget.tappedItem == 'Branch Settings'
                                                                              ? BranchSettingsList()
                                                                              : widget.tappedItem == 'Branch Settings Create'
                                                                                  ? BranchSettings()
                                                                                  : widget.tappedItem == 'Staff Expenses'
                                                                                      ? StaffExpensesList()
                                                                                      : widget.tappedItem == 'Outlet Expenses'
                                                                                          ? OutletExpensesList()
                                                                                          : widget.tappedItem == 'Add Outlet Expense'
                                                                                              ? OutletAddExpense()
                                                                                              : widget.tappedItem == 'Add Expense'
                                                                                                  ? StaffAddExpense()
                                                                                                  : widget.tappedItem == 'Shift'
                                                                                                      ? PosShiftList()
                                                                                                      : widget.tappedItem == 'KOT Display'
                                                                                                          ? KotDisplay()
                                                                                                          : widget.tappedItem == 'Add Expense Type'
                                                                                                              ? AddExpenseType()
                                                                                                              : widget.tappedItem == 'Petty Cash Receipts'
                                                                                                                  ? PettyCashReceiptsList()
                                                                                                                  : widget.tappedItem == 'Orders'
                                                                                                                      ? PosOrderList()
                                                                                                                      : widget.tappedItem == 'Payment'
                                                                                                                          ? PosPaymentList()
                                                                                                                          : widget.tappedItem == 'Special Items'
                                                                                                                              ? PosSpecialItemsList()
                                                                                                                              : widget.tappedItem == 'Special Items Create'
                                                                                                                                  ? PosSpecialItems()
                                                                                                                                  : Text('Last Item')))
                ]),
              )
            ],
          );
  }

  void addPettyCashReceipts(
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
                        Text(
                          'Edit Petty Cash Receipt',
                          style: rolesAndPermissionModuleAccessTabLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        ColoredTextField(
                            textFieldHeight: 30,
                            color: textFieldColor,
                            controller: docNoController,
                            title: 'Doc No'),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredDropDown(
                          textFieldHeight: 37,
                          isVisible: true,
                          dropDownItems: _dropdownItems,
                          title: 'Branch',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredDropDown(
                          textFieldHeight: 37,
                          isVisible: true,
                          dropDownItems: _dropdownItems,
                          title: 'Expense Type',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredTextField(
                            textFieldHeight: 30,
                            color: textFieldColor,
                            controller: amountController,
                            title: 'Amount'),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredDateField(
                          textFieldHeight: 37,
                          controller: dateController,
                          title: 'Date',
                          onTap: () async {
                            dateSelection(controller: dateController);
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 83,
                                  height: 24,
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
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(8),
                            ),
                            GestureDetector(
                              child: Container(
                                  width: 83,
                                  height: 24,
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
                              onTap: () {
                                Navigator.pop(context);
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
  void addAggregator(
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
                        SvgPicture.asset(
                          ImageCons.save,
                          height: 23,
                          width: 12,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        ColoredTextField(
                            textFieldHeight: 30,
                            color: textFieldColor,
                            controller: aggregatorNameController,
                            title: 'Aggregator Name'),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredDropDown(
                          textFieldHeight: 37,
                          isVisible: true,
                          dropDownItems: _dropdownItems,
                          title: 'Branch',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredDropDown(
                          textFieldHeight: 37,
                          isVisible: true,
                          dropDownItems: _dropdownItems,
                          title: 'Commission Type',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(16),
                        ),
                        ColoredTextField(
                            textFieldHeight: 30,
                            color: textFieldColor,
                            controller: commissionController,
                            title: 'Commission'),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 83,
                                  height: 24,
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
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(8),
                            ),
                            GestureDetector(
                              child: Container(
                                  width: 83,
                                  height: 24,
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
                              onTap: () {
                                Navigator.pop(context);
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

  void disable() {
    print('No Dialogues');
  }
}
