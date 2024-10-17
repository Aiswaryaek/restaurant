// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/models/inventory_product_category_model.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/inventory.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/attributes/create/attributes.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/attributes/list/attributes_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/branch_receipt/list/branch_receipt_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/branch_transfer/create/branch_transfer.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/branch_transfer/list/branch_transfer_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/category/create/category.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/category/list/category_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/inventory_adjustment/create/inventory_adjustment_create.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/inventory_adjustment/list/inventory_adjustment_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/location/create/location.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/pos_category/create/pos_category_create.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/pos_category/list/pos_category_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/product/list/product_List.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/product_master/list/product_master_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/settings/settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/stock_moves/list/stock_moves_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/transfer_report/list/transfer_report_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/ware_house/create/ware_house.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/ware_house/list/ware_house_list.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_bottom_sheet_item_layout.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_product_create_layout.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../user_app/widgets/custom_button.dart';
import 'branch_receipt/create/branch_receipt.dart';
import 'internal_tranfer/create/internal_transfer.dart';
import 'internal_tranfer/list/internal_transfer_list.dart';
import 'inventory_stock_moves/stock_move_list/stock_moves_list.dart';
import 'inventory_stock_moves/stock_moves_controller.dart';
import 'landed_cost/create/landed_cost.dart';
import 'landed_cost/list/landed_cost_list.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_drop_down.dart';
import 'location/list/location_list.dart';

class SubInventoryPage extends StatefulWidget {
  String tappedItem;
  dynamic tappedHeadItem;

  SubInventoryPage(this.tappedItem, this.tappedHeadItem, {super.key});

  @override
  State<SubInventoryPage> createState() => _SubInventoryPageState();
}

class _SubInventoryPageState extends State<SubInventoryPage> {
  final inventoryDropdown = <InventoryAdjustmentDropdown>[];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();
  final options = <InventoryProductModel>[];
  final item = <InventoryProductModel>[];
  final StockMovesController stockMovesCtrl = Get.put(StockMovesController());
  bool isChecked = false;
  String? _selectedItem;
  final List<String> _dropdownItems = ['01', '02', '03'];

  @override
  void initState() {
    inventoryDropdown
        .add(InventoryAdjustmentDropdown('Import', ImageCons.imgImport));
    inventoryDropdown
        .add(InventoryAdjustmentDropdown('Export', ImageCons.imgImport));
    inventoryDropdown
        .add(InventoryAdjustmentDropdown('Print', ImageCons.imgPrinter));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.tappedItem);
    return widget.tappedItem == 'Inventory'
        ? Inventory()
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
                      widget.tappedItem == 'Product'
                          ? Transform.translate(
                              offset: Offset(0, 5),
                              child: stockMovesCtrl.isVendorBillTapped.value ==
                                      true
                                  ? SizedBox(
                                      height: 14,
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
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
                                                  style: mainRedTextStyle,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 5, 0),
                                          height:
                                              AppScreenUtil().screenHeight(19),
                                          width:
                                              AppScreenUtil().screenWidth(52),
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
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 1.5),
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  'Export',
                                                  style: imageUploadLabelStyle,
                                                ),
                                              ),
                                              SizedBox(
                                                width: AppScreenUtil()
                                                    .screenWidth(4),
                                              ),
                                              SvgPicture.asset(
                                                ImageCons.imgImport,
                                                height: 11.96,
                                                width: 12.33,
                                                color: confirmColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))
                          : widget.tappedItem == 'Internal Transfer' ||
                                  widget.tappedItem == 'Branch Receipt' ||
                                  widget.tappedItem == 'Product Master' ||
                                  widget.tappedItem == 'Branch Transfer' ||
                                  widget.tappedItem == 'Stock Moves' ||
                                  widget.tappedItem == 'Inventory Adjustment' ||
                                  widget.tappedItem == 'Landed Cost' ||
                                  widget.tappedItem == 'Warehouse' ||
                                  widget.tappedItem == 'Location' ||
                                  widget.tappedItem == 'Attributes' ||
                                  widget.tappedItem == 'POS Category' ||
                                  widget.tappedItem == 'Category' ||
                                  widget.tappedItem == 'Stock Move' ||
                                  widget.tappedItem == 'Transfer Report' ||
                                  widget.tappedItem == 'Stock Aging Report'
                              ? Transform.translate(
                                  offset: Offset(0, 5),
                                  child: stockMovesCtrl
                                              .isVendorBillTapped.value ==
                                          true
                                      ? SizedBox(
                                          height: 14,
                                        )
                                      : Container(
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
                                                  style: mainRedTextStyle,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                )
                              : widget.tappedItem ==
                                      'Inventory Adjustment Create'
                                  ? Row(
                                      children: [
                                        SvgPicture.asset(
                                          ImageCons.save,
                                          height: 23,
                                          width: 12,
                                        ),
                                        SizedBox(
                                          width: AppScreenUtil().screenWidth(5),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                                width: AppScreenUtil()
                                                    .screenWidth(45),
                                                height: AppScreenUtil()
                                                    .screenHeight(15),
                                                decoration: BoxDecoration(
                                                  color:
                                                      inventorySelectionColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                padding:
                                                    EdgeInsets.only(bottom: 2),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text('Request',
                                                      style:
                                                          inventoryReturnButtonStyle,
                                                      textAlign:
                                                          TextAlign.center),
                                                )),
                                            SizedBox(
                                              height: AppScreenUtil()
                                                  .screenHeight(5),
                                            ),
                                            Container(
                                                width: AppScreenUtil()
                                                    .screenWidth(45),
                                                height: AppScreenUtil()
                                                    .screenHeight(14),
                                                decoration: BoxDecoration(
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                        color: blackColor,
                                                        width: 0.5)),
                                                padding:
                                                    EdgeInsets.only(bottom: 2),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text('Cancel',
                                                      style:
                                                          staffNotificationLabelStyle,
                                                      textAlign:
                                                          TextAlign.center),
                                                )),
                                          ],
                                        )
                                      ],
                                    )
                                  : SvgPicture.asset(
                                      ImageCons.save,
                                      height: 23,
                                      width: 12,
                                    ),
                      widget.tappedItem == 'Product' ||
                              widget.tappedItem == 'Internal Transfer' ||
                              widget.tappedItem == 'Branch Receipt' ||
                              widget.tappedItem == 'Product Master' ||
                              widget.tappedItem == 'Branch Transfer' ||
                              widget.tappedItem == 'Stock Moves' ||
                              widget.tappedItem == 'Inventory Adjustment' ||
                              widget.tappedItem == 'Landed Cost' ||
                              widget.tappedItem == 'Warehouse' ||
                              widget.tappedItem == 'Location' ||
                              widget.tappedItem == 'Settings' ||
                              widget.tappedItem == 'Attributes' ||
                              widget.tappedItem == 'POS Category' ||
                              widget.tappedItem == 'Category' ||
                              widget.tappedItem == 'Stock Move' ||
                              widget.tappedItem == 'Transfer Report' ||
                              widget.tappedItem == 'Stock Aging Report'
                          ? Transform.translate(
                              offset: Offset(0, -17.5),
                              child: Center(
                                child: Text(
                                  'Inventory',
                                  style: btnTextStyle,
                                ),
                              ),
                            )
                          : Transform.translate(
                              offset: Offset(0, -25.91),
                              child: Center(
                                child: Text(
                                  'Inventory',
                                  style: btnTextStyle,
                                ),
                              ),
                            ),
                      widget.tappedItem == 'Inventory Adjustment Create'
                          ? Transform.translate(
                              offset: Offset(0, -43),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: AppScreenUtil().screenWidth(74),
                                  height: AppScreenUtil().screenHeight(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: inventorySelectionColor,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      iconStyleData: IconStyleData(
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: inventorySelectionColor,
                                            size: 0,
                                          ),),
                                      //To avoid long text overflowing.
                                      alignment: Alignment.centerLeft,
                                      hint: Text(
                                        'Action',
                                        style: staffLeftLabelStyle,
                                      ),
                                      value: _selectedItem,
                                      items: inventoryDropdown
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                  value: item.text,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SvgPicture.asset(
                                                        item.icon,
                                                        color: confirmColor,
                                                      ),
                                                      SizedBox(width: AppScreenUtil().screenWidth(5),),
                                                      Text(item.text,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              staffLeftLabelStyle),
                                                    ],
                                                  )))
                                          .toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedItem = newValue;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),

                      // SizedBox(
                      //   height: AppScreenUtil().screenHeight(5),
                      // ),
                      widget.tappedItem == 'Product'
                          ? Transform.translate(
                              offset: Offset(0, -13),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  height: AppScreenUtil().screenHeight(19),
                                  width: AppScreenUtil().screenWidth(52),
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 1.5),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          'Export',
                                          style: imageUploadLabelStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(4),
                                      ),
                                      SvgPicture.asset(
                                        ImageCons.imgImport,
                                        height: 11.96,
                                        width: 12.33,
                                        color: confirmColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      widget.tappedItem == 'Stock Move'
                          ? Obx(() => Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              widget.tappedItem = 'Inventory';
                                            });
                                          },
                                          child: Text(
                                            'Inventory',
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
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  widget.tappedItem =
                                                      'Inventory';
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
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              widget.tappedItem = 'Stock Move';
                                              stockMovesCtrl.isVendorBillTapped
                                                  .value = false;
                                              stockMovesCtrl
                                                  .stockMovesDetailTapped
                                                  .value = 'Test';
                                            });
                                          },
                                          child: Text(
                                            widget.tappedItem,
                                            maxLines: 1,
                                            style: stockMovesCtrl
                                                        .stockMovesDetailTapped
                                                        .value ==
                                                    'Test'
                                                ? gridTextStyle
                                                : taxCreateEnterAPassWordLabelStyle,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppScreenUtil().screenWidth(2),
                                        ),
                                        stockMovesCtrl.stockMovesDetailTapped
                                                    .value ==
                                                'Test'
                                            ? SizedBox()
                                            : Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: blackColor,
                                                size: 10,
                                              ),
                                        SizedBox(
                                          width: AppScreenUtil().screenWidth(4),
                                        ),
                                        stockMovesCtrl.stockMovesDetailTapped
                                                    .value ==
                                                'Test'
                                            ? SizedBox()
                                            : GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    widget.tappedItem =
                                                        'Stock Move';
                                                    stockMovesCtrl
                                                        .isVendorBillTapped
                                                        .value = false;
                                                    stockMovesCtrl
                                                        .stockMovesDetailTapped
                                                        .value = 'Test';
                                                    print(
                                                        'Detail Tapped: ${stockMovesCtrl.isVendorBillTapped.value}');
                                                  });
                                                },
                                                child: Text(
                                                  stockMovesCtrl
                                                      .stockMovesDetailTapped
                                                      .value,
                                                  style: stockMovesCtrl
                                                              .stockMovesDetailTapped
                                                              .value ==
                                                          'Test'
                                                      ? taxCreateEnterAPassWordLabelStyle
                                                      : stockMovesCtrl
                                                                  .isVendorBillTapped
                                                                  .value ==
                                                              true
                                                          ? taxCreateEnterAPassWordLabelStyle
                                                          : gridTextStyle,
                                                ),
                                              ),
                                        SizedBox(
                                          width: AppScreenUtil().screenWidth(2),
                                        ),
                                        stockMovesCtrl
                                                    .isVendorBillTapped.value ==
                                                false
                                            ? SizedBox()
                                            : Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: blackColor,
                                                size: 10,
                                              ),
                                        SizedBox(
                                          width: AppScreenUtil().screenWidth(4),
                                        ),
                                        stockMovesCtrl
                                                    .isVendorBillTapped.value ==
                                                false
                                            ? SizedBox()
                                            : Expanded(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        stockMovesCtrl
                                                                .isVendorBillTapped
                                                                .value ==
                                                            false;
                                                      });
                                                    },
                                                    child: SizedBox(
                                                      width: AppScreenUtil()
                                                          .screenWidth(100),
                                                      child: Text(
                                                        'Vendor Bill',
                                                        style: gridTextStyle,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    )),
                                              )

                                        ///Create button
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            widget.tappedItem = 'Inventory';
                                          });
                                        },
                                        child: Text(
                                          'Inventory',
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
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                widget.tappedItem = 'Inventory';
                                              });
                                            },
                                            child: Text(
                                              widget.tappedHeadItem,
                                              style:
                                                  taxCreateEnterAPassWordLabelStyle,
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                AppScreenUtil().screenWidth(2),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: blackColor,
                                            size: 10,
                                          ),
                                          SizedBox(
                                            width:
                                                AppScreenUtil().screenWidth(4),
                                          ),
                                        ],
                                      ),

                                      ///Last Tap text
                                      Text(
                                        widget.tappedItem ==
                                                'Product Master Create'
                                            ? 'Product Master'
                                            : widget.tappedItem ==
                                                    'Product Create'
                                                ? 'Product'
                                                : widget.tappedItem ==
                                                        'Internal Transfer Create'
                                                    ? 'Internal Transfer'
                                                    : widget.tappedItem ==
                                                            'Branch Receipt Create'
                                                        ? 'Branch Receipt'
                                                        : widget.tappedItem ==
                                                                'Branch Transfer Create'
                                                            ? 'Branch Transfer'
                                                            : widget.tappedItem ==
                                                                    'Landed Cost Create'
                                                                ? 'Landed Cost'
                                                                : widget.tappedItem ==
                                                                        'Warehouse Create'
                                                                    ? 'Warehouse'
                                                                    : widget.tappedItem ==
                                                                            'Location Create'
                                                                        ? 'Location'
                                                                        : widget.tappedItem ==
                                                                                'Category Create'
                                                                            ? 'Category'
                                                                            : widget.tappedItem == 'Attributes Create'
                                                                                ? 'Attributes'
                                                                                : widget.tappedItem == 'Inventory Adjustment Create'
                                                                                    ? 'Inventory Adjustment'
                                                                                    : widget.tappedItem == 'POS Category Create'
                                                                                        ? 'POS Category'
                                                                                        : widget.tappedItem,
                                        maxLines: 1,
                                        style: gridTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      ///Create button
                                    ],
                                  ),
                                ),
                                widget.tappedItem == 'Product Create' ||
                                        widget.tappedItem ==
                                            'Product Master Create'
                                    ? Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                isChecked = !isChecked;
                                              });
                                            },
                                            child: Container(
                                              width: 13,
                                              height: 13,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: blackColor),
                                                color: isChecked
                                                    ? constantWhite
                                                    : Colors.transparent,
                                              ),
                                              child: isChecked
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1),
                                                      child: SvgPicture.asset(
                                                        ImageCons
                                                            .imgCheckboxTikMark,
                                                        width: 11.92,
                                                        height: 9.13,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                          ),
                                          SizedBox(
                                              width: AppScreenUtil()
                                                  .screenWidth(10)),
                                          Text(
                                            'Raw Material',
                                            style: settingsCheckBoxLabelStyle,
                                          ),
                                        ],
                                      )
                                    : Visibility(
                                        visible:
                                            (widget.tappedItem ==
                                                        'Product Master Create' ||
                                                    widget.tappedItem ==
                                                        'Product Create' ||
                                                    widget.tappedItem ==
                                                        'Internal Transfer Create' ||
                                                    widget.tappedItem ==
                                                        'Branch Receipt' ||
                                                    widget.tappedItem ==
                                                        'Branch Transfer Create' ||
                                                    widget.tappedItem ==
                                                        'Stock Moves' ||
                                                    widget.tappedItem ==
                                                        'Landed Cost Create' ||
                                                    widget.tappedItem ==
                                                        'Warehouse Create' ||
                                                    widget.tappedItem ==
                                                        'Stock Moves' ||
                                                    widget.tappedItem ==
                                                        'Location Create' ||
                                                    widget.tappedItem ==
                                                        'Category Create' ||
                                                    widget.tappedItem ==
                                                        'Attributes Create' ||
                                                    widget.tappedItem ==
                                                        'Inventory Adjustment Create' ||
                                                    widget.tappedItem ==
                                                        'Settings' ||
                                                    widget.tappedItem ==
                                                        'POS Category Create' ||
                                                    widget.tappedItem ==
                                                        'Stock Aging Report' ||
                                                    widget.tappedItem ==
                                                        'Transfer Report')
                                                ? false
                                                : true,
                                        child: CustomButton(
                                            buttonHeight: AppScreenUtil()
                                                .screenHeight(18),
                                            buttonWidth:
                                                AppScreenUtil().screenWidth(61),
                                            buttonColor: confirmColor,
                                            borderRadius: 4,
                                            buttonText: 'Create',
                                            onTap: () {
                                              setState(() {
                                                if (widget.tappedItem ==
                                                    'Product Master') {
                                                  widget.tappedItem =
                                                      'Product Master Create';
                                                } else if (widget.tappedItem ==
                                                    'Product') {
                                                  widget.tappedItem =
                                                      'Product Create';
                                                } else if (widget.tappedItem ==
                                                    'Internal Transfer') {
                                                  widget.tappedItem =
                                                      'Internal Transfer Create';
                                                } else if (widget.tappedItem ==
                                                    'Branch Receipt') {
                                                  widget.tappedItem =
                                                      'Branch Receipt Create';
                                                } else if (widget.tappedItem ==
                                                    'Landed Cost') {
                                                  widget.tappedItem =
                                                      'Landed Cost Create';
                                                } else if (widget.tappedItem ==
                                                    'Branch Transfer') {
                                                  widget.tappedItem =
                                                      'Branch Transfer Create';
                                                } else if (widget.tappedItem ==
                                                    'Warehouse') {
                                                  widget.tappedItem =
                                                      'Warehouse Create';
                                                } else if (widget.tappedItem ==
                                                    'Category') {
                                                  widget.tappedItem =
                                                      'Category Create';
                                                } else if (widget.tappedItem ==
                                                    'Location') {
                                                  widget.tappedItem =
                                                      'Location Create';
                                                } else if (widget.tappedItem ==
                                                    'Attributes') {
                                                  widget.tappedItem =
                                                      'Attributes Create';
                                                } else if (widget.tappedItem ==
                                                    'Inventory Adjustment') {
                                                  widget.tappedItem =
                                                      'Inventory Adjustment Create';
                                                } else if (widget.tappedItem ==
                                                    'POS Category') {
                                                  widget.tappedItem =
                                                      'POS Category Create';
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
                        child: widget.tappedItem == 'Product'
                            ? ProductList()
                            : widget.tappedItem == 'Internal Transfer'
                                ? InternalTransferList()
                                : widget.tappedItem == 'Branch Receipt'
                                    ? BranchReceiptList()
                                    : widget.tappedItem == 'Product Master'
                                        ? ProductMasterList()
                                        : widget.tappedItem ==
                                                'Product Master Create'
                                            ? InventoryProductAndProductMasterCreateLayout(
                                                widget.tappedItem)
                                            : widget.tappedItem ==
                                                    'Product Create'
                                                ? InventoryProductAndProductMasterCreateLayout(
                                                    widget.tappedItem)
                                                : widget.tappedItem ==
                                                        'Internal Transfer Create'
                                                    ? InternalTransfer(
                                                        widget.tappedItem)
                                                    // : widget.tappedItem ==
                                                    //         'Branch Receipt Create'
                                                    //     ? BranchReceipt()
                                                    : widget.tappedItem ==
                                                            'Branch Transfer'
                                                        ? BranchTransferList()
                                                        : widget.tappedItem ==
                                                                'Branch Transfer Create'
                                                            ? BranchTransfer()
                                                            : widget.tappedItem ==
                                                                    'Stock Moves'
                                                                ? StockMovesList()
                                                                : widget.tappedItem ==
                                                                        'Inventory Adjustment'
                                                                    ? InventoryAdjustmentList()
                                                                    : widget.tappedItem ==
                                                                            'Landed Cost'
                                                                        ? LandedCostList()
                                                                        : widget.tappedItem ==
                                                                                'Landed Cost Create'
                                                                            ? LandedCost()
                                                                            : widget.tappedItem == 'Category Create'
                                                                                ? Category()
                                                                                : widget.tappedItem == 'Category'
                                                                                    ? CategoryList()
                                                                                    : widget.tappedItem == 'Inventory Adjustment Create'
                                                                                        ? InventoryAdjustmentCreateScreen()
                                                                                        : widget.tappedItem == 'Settings'
                                                                                            ? ConfigurationSettings()
                                                                                            : widget.tappedItem == 'Warehouse'
                                                                                                ? WareHouseList()
                                                                                                : widget.tappedItem == 'Warehouse Create'
                                                                                                    ? Warehouse()
                                                                                                    : widget.tappedItem == 'Location'
                                                                                                        ? LocationList()
                                                                                                        : widget.tappedItem == 'Location Create'
                                                                                                            ? Location()
                                                                                                            : widget.tappedItem == 'POS Category'
                                                                                                                ? PosCategoryList()
                                                                                                                : widget.tappedItem == 'POS Category Create'
                                                                                                                    ? PosCategoryCreate()
                                                                                                                    : widget.tappedItem == 'Attributes'
                                                                                                                        ? AttributesList()
                                                                                                                        : widget.tappedItem == 'Attributes Create'
                                                                                                                            ? Attributes()
                                                                                                                            : widget.tappedItem == 'Transfer Report'
                                                                                                                                ? TransferReportList()
                                                                                                                                : widget.tappedItem == 'Stock Move'
                                                                                                                                    ? InventoryStockMovesList()
                                                                                                                                    : Text('Last Item'))),
              ]))
            ],
          );
  }
}

void inventoryProductBottomSheet(BuildContext context,
    {dynamic visibilityColor,
    dynamic deleteColor,
    dynamic editColor,
    dynamic viewOnTap,
    dynamic deleteOnTap,
    dynamic editOnTap}) {
  showModalBottomSheet(
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
    ),
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: AppScreenUtil().screenHeight(100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: reductionBottomSheetButtonColor),
        child: Column(
          children: [
            SizedBox(
              height: AppScreenUtil().screenHeight(8),
            ),

            ///Divider
            SizedBox(
              width: AppScreenUtil().screenWidth(50),
              child: Center(
                child: Divider(
                  color: whiteColor,
                  thickness: 3,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                  bottom: AppScreenUtil().screenHeight(15),
                  left: AppScreenUtil().screenWidth(20),
                  right: AppScreenUtil().screenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///BottomSheet items
                  GestureDetector(
                    onTap: viewOnTap,
                    child: InventoryBottomSheetItemLayout(
                        iconHeight: 13.09,
                        iconPath: ImageCons.imgVisibility,
                        iconColor: visibilityColor,
                        iconWidth: 20.53),
                  ),

                  GestureDetector(
                    onTap: editOnTap,
                    child: InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.edit,
                        iconColor: editColor,
                        iconWidth: 15.29),
                  ),
                  GestureDetector(
                    onTap: deleteOnTap,
                    child: InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDelete,
                        iconColor: deleteColor,
                        iconWidth: 13.91),
                  ),

// Container(
//   width: AppScreenUtil().screenWidth(52),
//   height: AppScreenUtil().screenHeight(52),
//   decoration: BoxDecoration(shape: BoxShape.circle,color: constantWhite,boxShadow: [BoxShadow(
//     offset: Offset(0, 3),
//     blurRadius: 6,
//     color: inventoryBottomSheetItemBoxshadowColor,
//   )]),
//   child: Center(child: SvgPicture.asset(ImageCons.edit,width: 15.29,height: 15.29,)
//   ),
// )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

class InventoryAdjustmentDropdown {
  String text;
  dynamic icon;

  InventoryAdjustmentDropdown(this.text, this.icon);
}
