// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/models/inventory_product_category_model.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/accounts.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_payable/list/account_payable_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_receivable/list/account_receivable_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/balance_sheet/balance_sheet.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/bank_and_cash_report/list/bank_and_cash_report_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/bank_reconciliation/create/import_file.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/bank_reconciliation/list/bank_reconciliation_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/chart_of_accounts/create/chart_of_accounts.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/chart_of_accounts/list/chart_of_accounts_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/credit_notes/create/credit_note.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/credit_notes/list/credit_note_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/customer_invoice/create/customer_invoice.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/customers/create/customers.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/customers/list/customers_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/debit_notes/list/debit_note_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/general_ledger/list/general_ledger_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/gl_configuration/gl_configuration.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/input_output_report/input_output_report.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/journal_entries/create/journal_entries.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/journal_entries/list/journal_entries_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/journals/list/journals_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/payments/create/payments_create_screen.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/payments/list/payments_list_screen.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/product_margin_report/list/product_margin_report_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/profit_and_loss_report/profit_and_loss_report.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/purchase/create/purchase_create_screen.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/purchase/list/purchase_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/recurring_posting/create/recurring_posting.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/recurring_posting/list/recurring_posting_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/sales/create/sales.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/sales/list/sales_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/trail_balance/trail_balance.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendor_bills/create/vendor_bills.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendor_bills/list/vendor_bills_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendor_payments/create/vendor_payments_create_screen.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendor_payments/list/vendor_payments_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendors/create/vendors.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendors/list/vendors_list.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';
import '../../../../../user_app/widgets/custom_button.dart';
import 'accounts_Receivable_aging_report/list/accounts_receivable_aging_report_list.dart';
import 'accounts_payable_aging_report/list/accounts_payable_aging_report_list.dart';
import 'bank_reconciliation/create/bank_reconciliation.dart';
import 'customer_invoice/list/customer_invoice_list.dart';
import 'customer_receipt_report/list/customer_receipt_list.dart';
import 'debit_notes/create/debit_notes.dart';
import 'invoice_margin_report/list/invoice_margin_report.dart';
import 'journals/create/journals_create.dart';

class SubAccountsPage extends StatefulWidget {
  String tappedItem;
  dynamic tappedHeadItem;

  SubAccountsPage(this.tappedItem, this.tappedHeadItem, {super.key});

  @override
  State<SubAccountsPage> createState() => _SubAccountsPageState();
}

class _SubAccountsPageState extends State<SubAccountsPage> {
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();
  final fileUploadController = TextEditingController();
  final options = <InventoryProductModel>[];
  final item = <InventoryProductModel>[];
  bool fileImported = false;

  @override
  Widget build(BuildContext context) {
    print(widget.tappedItem);
    return widget.tappedItem == 'Accounts'
        ? Accounts()
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
                          ///
                          ///Filter button
                          widget.tappedItem == 'Customer Invoices' ||
                              widget.tappedItem == 'Sales W/SO' ||
                              widget.tappedItem == 'Credit Notes' ||
                              widget.tappedItem == 'Customers' ||
                              widget.tappedItem == 'Payments' ||
                              widget.tappedItem == 'Vendor Bills' ||
                              widget.tappedItem == 'Debit Notes' ||
                              widget.tappedItem == 'Vendors' ||
                              widget.tappedItem == ' Payments' ||
                              widget.tappedItem == 'Journals' ||
                              widget.tappedItem == 'Chart Of Accounts' ||
                              widget.tappedItem == 'Journal Entries' ||
                              widget.tappedItem == 'Vendor Bills' ||
                              widget.tappedItem == 'Debit Notes' ||
                              widget.tappedItem == 'Recurring Posting' ||
                              widget.tappedItem == 'Bank Reconciliation' ||
                              widget.tappedItem == 'Bank Reconciliation' ||
                              widget.tappedItem == 'Account Payable' ||
                              widget.tappedItem == 'Trial Balance' ||
                              widget.tappedItem == 'General Ledger' ||
                              widget.tappedItem == 'Bank & Cash report' ||
                              widget.tappedItem == 'Invoice Margin Report' ||
                              widget.tappedItem == 'Product Margin Report' ||
                              widget.tappedItem ==
                                  'Customer Receipt Report' ||
                              widget.tappedItem == 'Balance Sheet' ||
                              widget.tappedItem == 'Input / Output Report' ||
                              widget.tappedItem == 'Account Receivable' ||
                              widget.tappedItem ==
                                  'Accounts Payable Aging Report' ||
                              widget.tappedItem == 'Profit & Loss Report' ||
                              widget.tappedItem ==
                                  'Accounts Receivable Aging Report' ||
                              widget.tappedItem == 'Purchase W/PO'
                              ? Container(
                            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                            height: AppScreenUtil().screenHeight(14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: reductionBottomSheetButtonColor
                                    .withOpacity(0.1)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Filter',
                                    style: gridTextStyle,
                                  ),
                                )
                              ],
                            ),
                          )
                              : widget.tappedItem ==
                              'Bank Reconciliation Create' ||
                              widget.tappedItem ==
                                  'Bank Conciliation Import file'
                              ? Row(
                            children: [
                              SvgPicture.asset(
                                ImageCons.save,
                                height: 23,
                                width: 12,
                              ),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(7),
                              ),
                              Container(
                                  padding: EdgeInsets.only(bottom: 2),
                                  height: AppScreenUtil()
                                      .screenHeight(17.5),
                                  width:
                                  AppScreenUtil().screenWidth(47),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(4),
                                      color: confirmColor),
                                  child: Center(
                                    child: Text(
                                      'Post',
                                      style:
                                      placeOrderingAndConfirmPaymentButtonLabelStyle,
                                    ),
                                  ))
                            ],
                          )
                              : SvgPicture.asset(
                            ImageCons.save,
                            height: 23,
                            width: 12,
                          ),

                          widget.tappedItem == 'Customer Invoices' ||
                              widget.tappedItem == 'Sales W/SO' ||
                              widget.tappedItem == 'Credit Notes' ||
                              widget.tappedItem == 'Customers' ||
                              widget.tappedItem == 'Payments' ||
                              widget.tappedItem == 'Vendor Bills' ||
                              widget.tappedItem == 'Debit Notes' ||
                              widget.tappedItem == 'Vendors' ||
                              widget.tappedItem == ' Payments' ||
                              widget.tappedItem == 'Journals' ||
                              widget.tappedItem == 'Chart Of Accounts' ||
                              widget.tappedItem == 'Journal Entries' ||
                              widget.tappedItem == 'Vendor Bills' ||
                              widget.tappedItem == 'Debit Notes' ||
                              widget.tappedItem == 'Bank Reconciliation' ||
                              widget.tappedItem == 'Recurring Posting' ||
                              widget.tappedItem == 'GL Configuration' ||
                              widget.tappedItem == 'Account Payable' ||
                              widget.tappedItem == 'Trial Balance' ||
                              widget.tappedItem == 'General Ledger' ||
                              widget.tappedItem == 'Account Receivable' ||
                              widget.tappedItem ==
                                  'Accounts Payable Aging Report' ||
                              widget.tappedItem ==
                                  'Accounts Receivable Aging Report' ||
                              widget.tappedItem == 'Purchase W/PO'
                              ? Transform.translate(
                            offset: Offset(0, -17.5),
                            child: Center(
                              child: Text(
                                'Accounts',
                                style: dashBoardBlackLabelTextStyle,
                              ),
                            ),
                          )
                              : Transform.translate(
                            offset: Offset(0, -22),
                            child: Center(
                              child: Text(
                                'Accounts',
                                style: dashBoardBlackLabelTextStyle,
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
                                          widget.tappedItem = 'Accounts';
                                        });
                                      },
                                      child: Text(
                                        'Accounts',
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
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              widget.tappedItem = 'Accounts';
                                            });
                                          },
                                          child: Text(
                                            widget.tappedHeadItem,
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
                                      ],
                                    ),

                                    ///Last Tap text
                                    widget.tappedItem ==
                                        'Bank Conciliation Import file'
                                        ? Expanded(
                                      child: Container(
                                          width: AppScreenUtil()
                                              .screenHeight(120),
                                          color: Colors.transparent,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Bank Reconciliation',
                                                  maxLines: 1,
                                                  style: gridTextStyle,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                              )
                                            ],
                                          )),
                                    )
                                        : Expanded(
                                      child: Container(
                                          width: AppScreenUtil()
                                              .screenHeight(120),
                                          color: Colors.transparent,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  widget.tappedItem,
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
                              widget.tappedItem == 'Bank Reconciliation Create'
                                  ? GestureDetector(
                                child: Container(
                                  padding:
                                  EdgeInsets.only(left: 7, right: 8),
                                  height: AppScreenUtil().screenHeight(18),
                                  width: AppScreenUtil().screenWidth(61),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      color: importBackgroundColor),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(0, -1),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          'Import',
                                          style: importTextStyle,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        ImageCons.imgImport,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  importFile(context);
                                },
                              )
                                  : Visibility(
                                visible: (widget.tappedItem == 'Customer Invoices Create' ||
                                    widget.tappedItem ==
                                        'Profit & Loss Report' ||
                                    widget.tappedItem ==
                                        'Sales W/SO Create' ||
                                    widget.tappedItem ==
                                        'Credit Notes Create' ||
                                    widget.tappedItem ==
                                        'Customers Create' ||
                                    widget.tappedItem ==
                                        'Payments Create' ||
                                    widget.tappedItem ==
                                        'Vendor Bills Create' ||
                                    widget.tappedItem ==
                                        'Debit Notes Create' ||
                                    widget.tappedItem ==
                                        'Vendors Create' ||
                                    widget.tappedItem ==
                                        ' Payments Create' ||
                                    widget.tappedItem ==
                                        'Journals Create' ||
                                    widget.tappedItem ==
                                        'Chart Of Accounts Create' ||
                                    widget.tappedItem ==
                                        'Journal Entries Create' ||
                                    widget.tappedItem ==
                                        'Vendor Bills Create' ||
                                    widget.tappedItem ==
                                        'Debit Notes Create' ||
                                    widget.tappedItem ==
                                        'Recurring Posting Create' ||
                                    widget.tappedItem ==
                                        'Bank Reconciliation Create' ||
                                    widget.tappedItem ==
                                        'Purchase W/PO Create' ||
                                    widget.tappedItem ==
                                        'GL Configuration' ||
                                    widget.tappedItem ==
                                        'Account Payable' ||
                                    widget.tappedItem ==
                                        'General Ledger' ||
                                    widget.tappedItem ==
                                        'Trial Balance' ||
                                    widget.tappedItem ==
                                        'Account Receivable' ||
                                    widget.tappedItem ==
                                        'Balance Sheet' ||
                                    widget.tappedItem ==
                                        'Bank & Cash report' ||
                                    widget.tappedItem ==
                                        'Invoice Margin Report' ||
                                    widget.tappedItem ==
                                        'Product Margin Report' ||
                                    widget.tappedItem ==
                                        'Customer Receipt Report' ||
                                    widget.tappedItem ==
                                        'Accounts Payable Aging Report' ||
                                    widget.tappedItem ==
                                        'Input / Output Report' ||
                                    widget.tappedItem ==
                                        'Accounts Receivable Aging Report' ||
                                    widget.tappedItem ==
                                        'Bank Conciliation Import file')
                                    ? false
                                    : true,
                                child: CustomButton(
                                    buttonHeight:
                                    AppScreenUtil().screenHeight(18),
                                    buttonWidth:
                                    AppScreenUtil().screenWidth(61),
                                    buttonColor: confirmColor,
                                    borderRadius: 4,
                                    buttonText: 'Create',
                                    onTap: () {
                                      setState(() {
                                        if (widget.tappedItem ==
                                            'Customer Invoices') {
                                          widget.tappedItem =
                                          'Customer Invoices Create';
                                        } else if (widget.tappedItem ==
                                            'Sales W/SO') {
                                          widget.tappedItem =
                                          'Sales W/SO Create';
                                        } else if (widget.tappedItem ==
                                            'Credit Notes') {
                                          widget.tappedItem =
                                          'Credit Notes Create';
                                        } else if (widget.tappedItem ==
                                            'Customers') {
                                          widget.tappedItem =
                                          'Customers Create';
                                        } else if (widget.tappedItem ==
                                            'Payments') {
                                          widget.tappedItem =
                                          'Payments Create';
                                        } else if (widget.tappedItem ==
                                            'Vendor Bills') {
                                          widget.tappedItem =
                                          'Vendor Bills Create';
                                        } else if (widget.tappedItem ==
                                            'Debit Notes') {
                                          widget.tappedItem =
                                          'Debit Notes Create';
                                        } else if (widget.tappedItem ==
                                            'General Ledger') {
                                          widget.tappedItem =
                                          'General Ledger Create';
                                        } else if (widget.tappedItem ==
                                            'Vendors') {
                                          widget.tappedItem =
                                          'Vendors Create';
                                        } else if (widget.tappedItem ==
                                            'Accounts Receivable Aging Report') {
                                          widget.tappedItem =
                                          'Accounts Receivable Aging Report Create';
                                        } else if (widget.tappedItem ==
                                            ' Payments') {
                                          widget.tappedItem =
                                          ' Payments Create';
                                        } else if (widget.tappedItem ==
                                            'Journals') {
                                          widget.tappedItem =
                                          'Journals Create';
                                        } else if (widget.tappedItem ==
                                            'Chart Of Accounts') {
                                          widget.tappedItem =
                                          'Chart Of Accounts Create';
                                        } else if (widget.tappedItem ==
                                            'Journal Entries') {
                                          widget.tappedItem =
                                          'Journal Entries Create';
                                        } else if (widget.tappedItem ==
                                            'Journal Entries') {
                                          widget.tappedItem =
                                          'Journal Entries Create';
                                        } else if (widget.tappedItem ==
                                            'Input / Output Report') {
                                          widget.tappedItem =
                                          'Input / Output Report Create';
                                        } else if (widget.tappedItem ==
                                            'Recurring Posting') {
                                          widget.tappedItem =
                                          'Recurring Posting Create';
                                        } else if (widget.tappedItem ==
                                            'Accounts Payable Aging Report') {
                                          widget.tappedItem =
                                          'Accounts Payable Aging Report Create';
                                        } else if (widget.tappedItem ==
                                            'Purchase W/PO') {
                                          widget.tappedItem =
                                          'Purchase W/PO Create';
                                        } else if (widget.tappedItem ==
                                            'GL Configuration') {
                                          widget.tappedItem =
                                          'GL Configuration Create';
                                        } else if (widget.tappedItem ==
                                            'Account Payable') {
                                          widget.tappedItem =
                                          'Account Payable Create';
                                        } else if (widget.tappedItem ==
                                            'Trial Balance') {
                                          widget.tappedItem =
                                          'Trial Balance Create';
                                        } else if (widget.tappedItem ==
                                            'Bank & Cash report') {
                                          widget.tappedItem =
                                          'Bank & Cash report Create';
                                        } else if (widget.tappedItem ==
                                            'Invoice Margin Report') {
                                          widget.tappedItem =
                                          'Invoice Margin Report Create';
                                        } else if (widget.tappedItem ==
                                            'Product Margin Report') {
                                          widget.tappedItem =
                                          'Product Margin Report Create';
                                        } else if (widget.tappedItem ==
                                            'Customer Receipt Report') {
                                          widget.tappedItem =
                                          'Customer Receipt Report Create';
                                        } else if (widget.tappedItem ==
                                            'Balance Sheet') {
                                          widget.tappedItem =
                                          'Balance Sheet Create';
                                        } else if (widget.tappedItem ==
                                            'Account Receivable') {
                                          widget.tappedItem =
                                          'Account Receivable Create';
                                        } else if (widget.tappedItem ==
                                            'Bank Reconciliation') {
                                          fileImported == true
                                              ? widget.tappedItem ==
                                              'Bank Conciliation'
                                              : widget.tappedItem =
                                          'Bank Reconciliation Create';
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
                    Expanded(child: SingleChildScrollView(child: widget.tappedItem == 'Customer Invoices'
                        ? CustomerInvoiceList()
                        : widget.tappedItem == 'Customer Invoices Create'
                        ? CustomerInvoice()
                        : widget.tappedItem == 'Sales W/SO'
                        ? SalesWithSoList()
                        : widget.tappedItem == 'Sales W/SO Create'
                        ? SalesWithSo()
                        : widget.tappedItem == 'Credit Notes'
                        ? CreditNotesList()
                        : widget.tappedItem ==
                        'Credit Notes Create'
                        ? CreditNotes()
                        : widget.tappedItem == 'Customers'
                        ? CustomersList()
                        : widget.tappedItem ==
                        'Customers Create'
                        ? Customers()
                        : widget.tappedItem ==
                        'Payments Create'
                        ? PaymentsCreateScreen(
                        widget.tappedItem)
                        : widget.tappedItem ==
                        'Payments'
                        ? PaymentsListScreen()
                        : widget.tappedItem ==
                        'Vendor Bills'
                        ? VendorBillsList()
                        : widget.tappedItem ==
                        'Vendor Bills Create'
                        ? VendorBills()
                        : widget.tappedItem ==
                        'Debit Notes'
                        ? DebitNotesList()
                        : widget.tappedItem ==
                        ' Payments'
                        ? VendorPaymentsList()
                        : widget.tappedItem == ' Payments Create'
                        ? VendorPaymentsCreate(widget.tappedItem)
                        : widget.tappedItem == 'Debit Notes Create'
                        ? DebitNotes()
                        : widget.tappedItem == 'Vendors'
                        ? VendorsList()
                        : widget.tappedItem == 'Journal Entries'
                        ? JournalEntrieslist()
                        : widget.tappedItem == 'Journal Entries Create'
                        ? JournalEntries()
                        : widget.tappedItem == 'Vendors Create'
                        ? Vendors()
                        : widget.tappedItem == 'Journals'
                        ? JournalsList()
                        : widget.tappedItem == 'Chart Of Accounts'
                        ? ChartOfAccountsList()
                        : widget.tappedItem == 'Chart Of Accounts Create'
                        ? ChartOfAccounts()
                        : widget.tappedItem == 'Recurring Posting Create'
                        ? RecurringPosting()
                        : widget.tappedItem == 'Recurring Posting'
                        ? const ReccuringPostingList()
                        : widget.tappedItem == 'Journals Create'
                        ? Journal()
                        : widget.tappedItem == 'Purchase W/PO'
                        ? PurchaseList()
                        : widget.tappedItem == 'GL Configuration'
                        ? Gl_Configuration()
                        : widget.tappedItem == 'Account Payable'
                        ? AccountPayableList()
                        : widget.tappedItem == 'Purchase W/PO Create'
                        ? PurchaseCreate()
                        : widget.tappedItem == 'Bank Reconciliation'
                        ? BankConciliationList()
                        : widget.tappedItem == 'General Ledger'
                        ? GeneralLedgerList()
                        : widget.tappedItem == 'Account Receivable'
                        ? AccountReceivableList()
                        : widget.tappedItem == 'Trial Balance'
                        ? TrailBalance()
                        : widget.tappedItem == 'Balance Sheet'
                        ? BalanceSheet()
                        : widget.tappedItem == 'Bank & Cash report'
                        ? BankAndCashReportList()
                        : widget.tappedItem == 'Invoice Margin Report'
                        ? InvoiceMarginReportList()
                        : widget.tappedItem == 'Product Margin Report'
                        ? ProductMarginReportList()
                        : widget.tappedItem == 'Customer Receipt Report'
                        ? CustomerReceiptReportList()
                        : widget.tappedItem == 'Accounts Payable Aging Report'
                        ? AccountPayableAgingReportList()
                        : widget.tappedItem == 'Accounts Receivable Aging Report'
                        ? AccountReceivableAgingReportList()
                        : widget.tappedItem == 'Bank Reconciliation Create'
                        ? BankReconciliation()
                        : widget.tappedItem == 'Bank Conciliation Import file'
                        ? BankConciliationImportFile()
                        : widget.tappedItem == 'Input / Output Report'
                        ? InputOutPutReport()
                        : widget.tappedItem == 'Profit & Loss Report'
                        ? ProfitAndLossReport()
                        : Text('Last Item')))
                  ]),)
            ],
          );
////
  }

  void importFile(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(25), // Set border radius here
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 25, 18, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: constantWhite,
                ),
                // height: AppScreenUtil().screenHeight(191),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Import File',
                        style: tableHeadingLabelStyle,
                      ),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(15),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'File Upload',
                                style: bookedTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                color: textFieldColor,
                              ),
                              child: SizedBox(
                                  height: 33.9,
                                  child: TextFormField(
                                    controller: fileUploadController,
                                    style: searchInputTextStyle,
                                    cursorColor: whiteColor,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      isDense: true,
                                      fillColor: blackColor,
                                      focusColor: textFieldColor,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        borderSide:
                                            BorderSide(color: textFieldColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        borderSide:
                                            BorderSide(color: textFieldColor),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        borderSide:
                                            BorderSide(color: textFieldColor),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        borderSide:
                                            BorderSide(color: textFieldColor),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        )),
                        Transform.translate(
                          offset: Offset(-1, 11.1),
                          child: Container(
                            width: 45,
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(7),
                                  topRight: Radius.circular(7),
                                ),
                                color: blackColor),
                            child: SvgPicture.asset(
                              ImageCons.imgImportFileIcon,
                              height: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(15),
                    ),
                    SvgPicture.asset(ImageCons.imgLargeImportIcon),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(15),
                    ),
                    GestureDetector(
                      child: Container(
                          width: 92,
                          height: 28,
                          decoration: BoxDecoration(
                              color: blackColor,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: blackColor)),
                          padding: EdgeInsets.only(bottom: 2),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Submit',
                                style: confirmTextStyle,
                                textAlign: TextAlign.center),
                          )),
                      onTap: () {
                        setState(() {
                          fileImported = true;
                          widget.tappedItem = 'Bank Conciliation Import file';
                          print('import Text${widget.tappedItem}');
                          print(fileImported);
                        });
                        Navigator.pop(context);
                      },
                    )
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
