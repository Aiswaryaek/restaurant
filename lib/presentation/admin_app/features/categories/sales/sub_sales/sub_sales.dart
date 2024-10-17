// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/customers/create/customers.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/customers/list/customers_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sales.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/delivery_note/create/delivery_note.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/delivery_note/list/delivery_note_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/price_list/create/price_list_create.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/price_list/list/price_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/quotation/create/quotation.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/quotation/list/quotation_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/sales_order/create/sales_order.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/sales_order/list/sales_order_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/sales_report/list/sales_report_list.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';
import '../../../../../user_app/widgets/custom_button.dart';
import 'customers/create/sales_customers.dart';
import 'customers/list/sales_customers_list.dart';

class SubSales extends StatefulWidget {
  String tappedItem;
  String tappedHeadItem;

  SubSales(this.tappedItem, this.tappedHeadItem, {super.key});

  @override
  State<SubSales> createState() => _SubSalesState();
}

class _SubSalesState extends State<SubSales> {
  @override
  Widget build(BuildContext context) {
    print(widget.tappedItem);
    return widget.tappedItem == 'Sales'
        ? Sales()
        : Column(
      children: [
        SizedBox(height: AppScreenUtil().screenHeight(25),),
        Expanded(child: Column(children: [
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
                widget.tappedItem == 'Quotation' ||
                    widget.tappedItem == 'Sales Order' ||
                    widget.tappedItem == 'Delivery Note' ||
                    widget.tappedItem == 'Price List' ||
                    widget.tappedItem == 'Customers'
                    ? Transform.translate(
                  offset: Offset(0, 5),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                    height: AppScreenUtil().screenHeight(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                  ),
                )
                    : SvgPicture.asset(
                  ImageCons.save,
                  height: 23,
                  width: 12,
                ),
                widget.tappedItem == 'Quotation' ||
                    widget.tappedItem == 'Sales Order' ||
                    widget.tappedItem == 'Delivery Note' ||
                    widget.tappedItem == 'Price List' ||
                    widget.tappedItem == 'Customers'
                    ? Transform.translate(
                  offset: Offset(0, -17.5),
                  child: Center(
                    child: Text(
                      'Sales',
                      style: btnTextStyle,
                    ),
                  ),
                )
                    : Transform.translate(
                  offset: Offset(0, -25),
                  child: Center(
                    child: Text(
                      'Sales',
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
                                widget.tappedItem = 'Sales';
                              });
                            },
                            child: Text(
                              'Sales',
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
                          widget.tappedHeadItem == 'Accounting'
                              ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.tappedItem = 'Sales';
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
                          )
                              : SizedBox(),

                          ///Last Tap text
                          Expanded(
                            child: Container(
                                width: AppScreenUtil().screenHeight(120),
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.tappedItem ==
                                            'Quotation Create'
                                            ? 'Quotation'
                                            : widget.tappedItem ==
                                            'Sales Order Create'
                                            ? 'Sales Order'
                                            : widget.tappedItem ==
                                            'Delivery Note Create'
                                            ? 'Delivery Note'
                                            : widget.tappedItem ==
                                            'Customers Create'
                                            ? 'Customers'
                                            : widget.tappedItem ==
                                            'Sales Report Create'
                                            ? 'Sales Report'
                                            : widget.tappedItem ==
                                            'Price List Create'
                                            ? 'Price List'
                                            : widget
                                            .tappedItem,
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
                    Visibility(
                      visible: (widget.tappedItem == 'Quotation Create' ||
                          widget.tappedItem == 'Sales Order Create' ||
                          widget.tappedItem == 'Delivery Note Create' ||
                          widget.tappedItem == 'Customers Create' ||
                          widget.tappedItem == 'Sales Report' ||
                          widget.tappedItem == 'Price List Create')
                          ? false
                          : true,
                      child: CustomButton(
                          buttonHeight: AppScreenUtil().screenHeight(18),
                          buttonWidth: AppScreenUtil().screenWidth(61),
                          buttonColor: confirmColor,
                          borderRadius: 4,
                          buttonText: 'Create',
                          onTap: () {
                            setState(() {
                              if (widget.tappedItem == 'Quotation') {
                                widget.tappedItem = 'Quotation Create';
                              } else if (widget.tappedItem ==
                                  'Sales Order') {
                                widget.tappedItem = 'Sales Order Create';
                              } else if (widget.tappedItem ==
                                  'Delivery Note') {
                                widget.tappedItem = 'Delivery Note Create';
                              } else if (widget.tappedItem == 'Customers') {
                                widget.tappedItem = 'Customers Create';
                              } else if (widget.tappedItem ==
                                  'Price List') {
                                widget.tappedItem = 'Price List Create';
                              } else if (widget.tappedItem ==
                                  'Sales Report') {
                                widget.tappedItem = 'Sales Report Create';
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
          Expanded(child: SingleChildScrollView(
            child: widget.tappedItem == 'Quotation'
                ? QuotationList()
                : widget.tappedItem == 'Sales Report'
                ? SalesReportList()
                : widget.tappedItem == 'Sales Order'
                ? SalesOrderList()
                : widget.tappedItem == 'Sales Order Create'
                ? SalesOrder()
                : widget.tappedItem == 'Quotation'
                ? QuotationList()
                : widget.tappedItem == 'Quotation Create'
                ? Quotation()
                : widget.tappedItem == 'Delivery Note'
                ? DeliveryNoteList()
                : widget.tappedItem ==
                'Delivery Note Create'
                ? DeliveryNote()
                : widget.tappedItem ==
                'Price List'
                ? PriceList()
                : widget.tappedItem ==
                'Price List Create'
                ? PriceListCreate()
                : widget.tappedItem ==
                'Sales Report'
                ? SalesReportList()
                : widget.tappedItem ==
                'Customers'
                ? SalesCustomersList()
                : widget.tappedItem ==
                'Customers Create'
                ? SalesCustomers()
                : Text(
                'Last Item')
          ))
        ]),)
      ],
    );
////
  }
}
