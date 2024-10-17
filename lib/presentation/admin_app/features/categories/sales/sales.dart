// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/sub_purchase.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/sub_sales.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final configuration = <ProductCategoriesModel>[];
  final accounting = <ProductCategoriesModel>[];
  int? tappedConfiguration;
  String tappedConfig = 'Configuration';
  String tappedConfigurationHead = 'Reports';
  dynamic currentTab;
  String? item;

  @override
  void initState() {
    configuration.add(ProductCategoriesModel('Quotation',ImageCons.imgQuotation));
    configuration.add(ProductCategoriesModel('Sales Order',ImageCons.imgSalesOrder));
    configuration.add(ProductCategoriesModel('Delivery Note',ImageCons.imgDeliveryOrder));
    configuration.add(ProductCategoriesModel('Customers',ImageCons.imgSalesCustomer));
    configuration.add(ProductCategoriesModel('Price List',ImageCons.imgPriceList));
    accounting.add(ProductCategoriesModel('Sales Report',ImageCons.imgSalesReport));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentTab == 'Quotation' ||
            currentTab == 'Sales Order' ||
            currentTab == 'Delivery Note' ||
            currentTab == 'Price List' ||
            currentTab == 'Sales Report' ||
            currentTab == 'Customers'
        ? SubSales(currentTab, tappedConfig)
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
        child: Column(
      children: [
        SizedBox(height: AppScreenUtil().screenHeight(25),),
        Expanded(child: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0, -2),
              child: Center(
                child: Text(
                  'Sales',
                  style: dashBoardLabelTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(18),
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 13,
              children:
              List<Widget>.generate(configuration.length, (int index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        tappedConfiguration = index;
                        currentTab = configuration[index].text;
                        item = tappedConfig;
                      });
                      print('current Tab :$currentTab');
                    },
                    child:  Container(
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
                            SvgPicture.asset(configuration[index].icon),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(6),
                          ),
                          Center(
                            child: Text(
                              configuration[index].text.toString(),textAlign: TextAlign.center,
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
              child: Text(tappedConfigurationHead, style: categoryTextStyle),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(8),
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 13,
              children:
              List<Widget>.generate(accounting.length, (int index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        tappedConfiguration = index;
                        currentTab = accounting[index].text;
                        item = tappedConfigurationHead;
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
                            padding:  EdgeInsets.all(9.3),
                            height: AppScreenUtil().screenHeight(38),
                            width: AppScreenUtil().screenWidth(47),
                            decoration: BoxDecoration(
                              color: tabSelectionAColor
                                  .withOpacity(0.20),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SvgPicture.asset(
                                accounting[index].icon),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(6),
                          ),
                          Text(
                            accounting[index].text.toString(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            style: clearDataAlertYesButtonLabelStyle,
                          ),
                        ],
                      ),
                    ));
              }).toList(),
            ),
          ],
        ),))
      ],
    ));
  }
}
