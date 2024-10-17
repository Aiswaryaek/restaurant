// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/models/inventory_product_category_model.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendors/create/vendors.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendors/list/vendors_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/purchase.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/configuration/configuration.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/grn/create/grn_create.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/grn/list/grn_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/purchase_aging_report/purchase_aging_report.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/purchase_order/create/purchase_order.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/purchase_order/list/purchase_order_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/purchase_report/list/purchase_report_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/request_for_quotation/create/request_for_quotation.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/request_for_quotation/list/request_for_quotation_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/unit_of_measurement/create/uom.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/unit_of_measurement/list/uom_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/vendors/create/vendors.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/vendors/list/vendors_list.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';
import '../../../../../user_app/widgets/custom_button.dart';
import '../controller/purchase_controller.dart';

class SubPurchase extends StatefulWidget {
  String tappedItem;
  String tappedHeadItem;

  SubPurchase(this.tappedItem, this.tappedHeadItem, {super.key});

  @override
  State<SubPurchase> createState() => _SubPurchaseState();
}

class _SubPurchaseState extends State<SubPurchase> {
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();
  final options = <InventoryProductModel>[];
  final item = <InventoryProductModel>[];
  final PurchaseController purchaseCtrl = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    print(widget.tappedItem);
    return widget.tappedItem == 'Purchase'
        ? Purchase()
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
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///
                            ///Filter button
                            purchaseCtrl.singleViewTapped.value == true ||
                                    purchaseCtrl.grnSingleViewTapped.value ==
                                        true
                                ? SizedBox(
                                    height: AppScreenUtil().screenHeight(14),
                                  )
                                : SizedBox(),
                            purchaseCtrl.singleViewTapped.value == true ||
                                    purchaseCtrl.grnSingleViewTapped.value ==
                                        true
                                ? SizedBox()
                                : widget.tappedItem == 'Request for quotation' ||
                                        widget.tappedItem == 'Purchase Order' ||
                                        widget.tappedItem ==
                                            'Goods Received Notes' ||
                                        widget.tappedItem ==
                                            'Purchase Report' ||
                                        widget.tappedItem ==
                                            'Unit Of Measurement' ||
                                        widget.tappedItem == 'Vendors' ||
                                        widget.tappedItem ==
                                            'Purchase Aging Report'
                                    ? Transform.translate(
                                        offset: Offset(0, 5),
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(4, 0, 4, 0),
                                          height:
                                              AppScreenUtil().screenHeight(14),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color:
                                                  reductionBottomSheetButtonColor
                                                      .withOpacity(0.1)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                ImageCons.imgTableFilterIcon,
                                                height: 6.71,
                                                width: 10.06,
                                              ),
                                              SizedBox(
                                                width: AppScreenUtil()
                                                    .screenWidth(5.7),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
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
                            widget.tappedItem == 'Request for quotation' ||
                                    widget.tappedItem == 'Purchase Order' ||
                                    widget.tappedItem ==
                                        'Goods Received Notes' ||
                                    widget.tappedItem == 'Configuration' ||
                                    widget.tappedItem == 'Purchase Report' ||
                                    widget.tappedItem ==
                                        'Unit Of Measurement' ||
                                    widget.tappedItem == 'Vendors' ||
                                    widget.tappedItem == 'Purchase Aging Report'
                                ? Transform.translate(
                                    offset: Offset(0, -17.5),
                                    child: Center(
                                      child: Text(
                                        'Purchase',
                                        style: btnTextStyle,
                                      ),
                                    ),
                                  )
                                : Transform.translate(
                                    offset: Offset(0, -25),
                                    child: Center(
                                      child: Text(
                                        'Purchase',
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
                                            widget.tappedItem = 'Purchase';
                                            purchaseCtrl
                                                .singleViewTapped.value = false;
                                            purchaseCtrl.grnSingleViewTapped
                                                .value = false;
                                          });
                                        },
                                        child: Text(
                                          'Purchase',
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
                                      widget.tappedItem == 'Purchase Report'
                                          ? Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      widget.tappedItem =
                                                          'Purchase';
                                                      purchaseCtrl
                                                          .singleViewTapped
                                                          .value = false;
                                                      purchaseCtrl
                                                          .grnSingleViewTapped
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
                                                  Icons
                                                      .arrow_forward_ios_rounded,
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
                                            width: AppScreenUtil()
                                                .screenHeight(120),
                                            color: Colors.transparent,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    widget.tappedItem ==
                                                            'Request for quotation Create'
                                                        ? 'Request for quotation'
                                                        : widget.tappedItem ==
                                                                'Purchase Order Create'
                                                            ? 'Purchase Order'
                                                            : widget.tappedItem ==
                                                                    'Goods Received Notes Create'
                                                                ? 'Goods Received Notes'
                                                                : widget.tappedItem ==
                                                                        'Unit Of Measurement Create'
                                                                    ? 'Unit Of Measurement'
                                                                    : widget.tappedItem ==
                                                                            'Configuration Create'
                                                                        ? 'Configuration'
                                                                        : widget.tappedItem ==
                                                                                'Purchase Report Create'
                                                                            ? 'Purchase Report'
                                                                            : widget.tappedItem == 'Vendors Create'
                                                                                ? 'Vendors'
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
                                purchaseCtrl.singleViewTapped.value == true ||
                                        purchaseCtrl
                                                .grnSingleViewTapped.value ==
                                            true ||
                                        widget.tappedItem ==  'Purchase Report'
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.2),
                                            width:
                                                AppScreenUtil().screenWidth(24),
                                            height: AppScreenUtil()
                                                .screenHeight(21),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: shareContainerColor
                                                    .withOpacity(0.7)),
                                            child: SvgPicture.asset(
                                              ImageCons.imgShare,
                                              color: whiteColor,
                                              height: 11,
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                AppScreenUtil().screenWidth(7),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5.2),
                                            width:
                                                AppScreenUtil().screenWidth(24),
                                            height: AppScreenUtil()
                                                .screenHeight(21),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color:
                                                    vendorBillBackGroundColor),
                                            child: SvgPicture.asset(
                                              ImageCons.imgPrinter,
                                              color: whiteColor,
                                              height: 11,
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                AppScreenUtil().screenWidth(7),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(4.5),
                                            width:
                                                AppScreenUtil().screenWidth(24),
                                            height: AppScreenUtil()
                                                .screenHeight(21),
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
                                    : SizedBox(),
                                Visibility(
                                  visible: (widget.tappedItem ==
                                              'Request for quotation Create' ||
                                          widget.tappedItem ==
                                              'Purchase Order Create' ||
                                          widget.tappedItem ==
                                              'Goods Received Notes' ||
                                          widget.tappedItem ==
                                              'Configuration' ||
                                          widget.tappedItem ==
                                              'Purchase Report' ||
                                          widget.tappedItem ==
                                              'Unit Of Measurement Create' ||
                                          widget.tappedItem ==
                                              'Vendors Create' ||
                                          widget.tappedItem ==
                                              'Purchase Aging Report' ||
                                          purchaseCtrl.singleViewTapped.value ==
                                              true)
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
                                              'Request for quotation') {
                                            widget.tappedItem =
                                                'Request for quotation Create';
                                          } else if (widget.tappedItem ==
                                              'Purchase Order') {
                                            widget.tappedItem =
                                                'Purchase Order Create';
                                          } else if (widget.tappedItem ==
                                              'Goods Received Notes') {
                                            widget.tappedItem =
                                                'Goods Received Notes Create';
                                          } else if (widget.tappedItem ==
                                              'Unit Of Measurement') {
                                            widget.tappedItem =
                                                'Unit Of Measurement Create';
                                          } else if (widget.tappedItem ==
                                              'Configuration') {
                                            widget.tappedItem =
                                                'Configuration Create';
                                          } else if (widget.tappedItem ==
                                              'Purchase Report') {
                                            widget.tappedItem =
                                                'Purchase Report Create';
                                          } else if (widget.tappedItem ==
                                              'Vendors') {
                                            widget.tappedItem =
                                                'Vendors Create';
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
                      )),
                  Expanded(
                      child: SingleChildScrollView(
                    child: widget.tappedItem == 'Request for quotation'
                        ? RequestForQuotationList()
                        : widget.tappedItem == 'Request for quotation Create'
                            ? RequestForQuotation()
                            : widget.tappedItem == 'Purchase Order'
                                ? PurchaseOrderList()
                                : widget.tappedItem == 'Purchase Order Create'
                                    ? PurchaseOrder()
                                    : widget.tappedItem ==
                                            'Goods Received Notes'
                                        ? GrnList()
                                        : widget.tappedItem ==
                                                'Goods Received Notes Create'
                                            ? GrnCreate()
                                            : widget.tappedItem == 'Vendors'
                                                ? PurchaseVendorsList()
                                                : widget.tappedItem ==
                                                        'Vendors Create'
                                                    ? PurchaseVendors()
                                                    : widget.tappedItem ==
                                                            'Unit Of Measurement'
                                                        ? UOMList()
                                                        : widget.tappedItem ==
                                                                'Unit Of Measurement Create'
                                                            ? UnitOfMeasurement()
                                                            : widget.tappedItem ==
                                                                    'Configuration'
                                                                ? Configuration()
                                                                : widget.tappedItem ==
                                                                        'Purchase Report'
                                                                    ? PurchaseReportList()
                                                                    : widget.tappedItem ==
                                                                            'Purchase Aging Report'
                                                                        ? PurchaseAgingReportList()
                                                                        : Text(
                                                                            'Last Item'),
                  ))
                ]),
              )
            ],
          );
////
  }
}
