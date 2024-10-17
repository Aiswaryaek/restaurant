// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/sub_inventory.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  final product = <ProductCategoriesModel>[];
  int? tappedProducts;
  String tappedProduct = 'Product';
  final operations = <ProductCategoriesModel>[];
  int? tappedOperations;
  String tappedOperation = 'Operations';
  final configuration = <ProductCategoriesModel>[];
  int? tappedConfigurations;
  String tappedConfiguration = 'Configuration';
  int? tappedReports;
  String tappedReport = 'Reports';
  final reports = <ProductCategoriesModel>[];
  dynamic currentTab;
  String? item;
  bool tappedColor = false;

  @override
  void initState() {
    product.add(
        ProductCategoriesModel('Product Master', ImageCons.imgProductMaster));
    product.add(ProductCategoriesModel('Product', ImageCons.imgProduct));
    operations.add(ProductCategoriesModel(
        'Internal Transfer', ImageCons.imgInternalTransfer));
    operations.add(
        ProductCategoriesModel('Branch Transfer', ImageCons.imgBranchTransfer));
    operations.add(
        ProductCategoriesModel('Branch Receipt', ImageCons.imgBranchReceipt));
    operations
        .add(ProductCategoriesModel('Stock Moves', ImageCons.imgStockMoves));
    operations.add(ProductCategoriesModel(
        'Inventory Adjustment', ImageCons.imgInventoryAdjustments));
    operations
        .add(ProductCategoriesModel('Landed Cost', ImageCons.imgLandedCost));
    configuration
        .add(ProductCategoriesModel('Warehouse', ImageCons.imgWareHouse));
    configuration
        .add(ProductCategoriesModel('Location', ImageCons.imgLocation));
    configuration
        .add(ProductCategoriesModel('Settings', ImageCons.imgTabSettings));
    configuration
        .add(ProductCategoriesModel('Attributes', ImageCons.imgAttributes));
    configuration
        .add(ProductCategoriesModel('POS Category', ImageCons.imgPosCategory));
    configuration
        .add(ProductCategoriesModel('Category', ImageCons.imgCategory));
    reports.add(ProductCategoriesModel('Stock Move', ImageCons.imgStockMove));
    reports
        .add(ProductCategoriesModel('Transfer Report', ImageCons.imgStockAgingReport));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentTab == 'Product Master' ||
            currentTab == 'Product' ||
            currentTab == 'Internal Transfer' ||
            currentTab == 'Branch Receipt' ||
            currentTab == 'Branch Transfer' ||
            currentTab == 'Stock Moves' ||
            currentTab == 'Inventory Adjustment' ||
            currentTab == 'Landed Cost' ||
            currentTab == 'Warehouse' ||
            currentTab == 'Settings' ||
            currentTab == 'Location' ||
            currentTab == 'Attributes' ||
            currentTab == 'POS Category' ||
            currentTab == 'Category' ||
            currentTab == 'POS Category Create' ||
            currentTab == 'Stock Move' ||
            currentTab == 'Transfer Report'
        ? SubInventoryPage(currentTab, item)
        : Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 0),
            // height: 600,
            width: double.infinity,
            // padding: EdgeInsets.fromLTRB(5, 3, 15, 13),
            decoration: BoxDecoration(
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
            child: Column(
              children: [
                SizedBox(height: AppScreenUtil().screenHeight(25),),
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -2),
                        child: Text(
                          'Inventory',
                          style: dashBoardLabelTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(18),
                      ),
                      Center(
                        child: Text(
                          'Product',
                          style: categoryTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children:
                            List<Widget>.generate(product.length, (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedProducts = index;
                                  currentTab = product[index].text;
                                  item = tappedProduct;
                                  tappedColor = true;
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
                                      padding: EdgeInsets.all(9),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child:
                                          SvgPicture.asset(product[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Center(
                                      child: Text(textAlign: TextAlign.center,
                                        product[index].text.toString(),
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
                        height: AppScreenUtil().screenHeight(20),
                      ),
                      Center(
                        child: Text(
                          'Operations',
                          style: categoryTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(operations.length,
                            (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedOperations = index;
                                  currentTab = operations[index].text;
                                  item = tappedOperation;
                                });
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: operations[index].icon ==
                                              ImageCons.imgInternalTransfer
                                          ? EdgeInsets.all(8.5)
                                          : operations[index].icon ==
                                                  ImageCons
                                                      .imgInventoryAdjustments
                                              ? EdgeInsets.all(9.3)
                                              : operations[index].icon ==
                                                      ImageCons.imgLandedCost
                                                  ? EdgeInsets.all(11)
                                                  : EdgeInsets.all(10.5),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          operations[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      operations[index].text.toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style: clearDataAlertYesButtonLabelStyle,
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(20),
                      ),
                      Center(
                        child: Text(
                          'Configuration',
                          style: categoryTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(configuration.length,
                            (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedConfigurations = index;
                                  currentTab = configuration[index].text;
                                  item = tappedConfiguration;
                                });
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: configuration[index].icon ==
                                              ImageCons.imgAttributes
                                          ? EdgeInsets.all(11.3)
                                          : configuration[index].icon ==
                                                  ImageCons.imgPosCategory
                                              ? EdgeInsets.all(11.5)
                                              : configuration[index].icon ==
                                                      ImageCons.imgCategory
                                                  ? EdgeInsets.all(11.5)
                                                  : EdgeInsets.all(10.5),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          configuration[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Center(
                                      child: Text(textAlign: TextAlign.center,
                                        configuration[index].text.toString(),
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
                        height: AppScreenUtil().screenHeight(20),
                      ),
                      Center(
                        child: Text(
                          'Reports',
                          style: categoryTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(reports.length,
                                (int index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      tappedReports = index;
                                      currentTab = reports[index].text;
                                      item = tappedReport;
                                    });
                                    print('current Tab :$currentTab');
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(80),
                                    padding: EdgeInsets.only(right: 15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10.5),
                                          height: AppScreenUtil().screenHeight(38),
                                          width: AppScreenUtil().screenWidth(47),
                                          decoration: BoxDecoration(
                                            color: tabSelectionAColor
                                                .withOpacity(0.20),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: SvgPicture.asset(
                                              reports[index].icon),
                                        ),
                                        SizedBox(
                                          height: AppScreenUtil().screenHeight(6),
                                        ),
                                        Center(
                                          child: Text(
                                            reports[index].text,textAlign: TextAlign.center,
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
                  )),
                )
              ],
            ));
  }
}
