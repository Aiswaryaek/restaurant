// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/sub_purchase.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';

class Purchase extends StatefulWidget {
  const Purchase({super.key});

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  final purchase = <ProductCategoriesModel>[];
  final report = <ProductCategoriesModel>[];
  int? tappedPurchases;
  int? tappedReport;
  String tappedPurchase = 'Purchase';
  String tappedReports = 'Report';
  dynamic currentTab;
  dynamic item;

  @override
  void initState() {
    purchase.add(ProductCategoriesModel('Request for quotation',ImageCons.imgRequestForQuotation));
    purchase.add(ProductCategoriesModel('Purchase Order',ImageCons.imgPurchaseOrder));
    purchase.add(ProductCategoriesModel('Goods Received Notes',ImageCons.imgGrn));
    purchase.add(ProductCategoriesModel('Unit Of Measurement',ImageCons.imgUom));
    purchase.add(ProductCategoriesModel('Vendors', ImageCons.imgVendor));
    purchase.add(ProductCategoriesModel('Configuration', ImageCons.imgConfiguration));
    report.add(ProductCategoriesModel('Purchase Report', ImageCons.imgPurchaseReport));
    // report.add(ProductCategoriesModel('Purchase Aging Report', ImageCons.purchaseAgingReport));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentTab == 'Request for quotation' ||
            currentTab == 'Purchase Order' ||
            currentTab == 'Goods Received Notes' ||
            currentTab == 'Unit Of Measurement' ||
            currentTab == 'Configuration' ||
            currentTab == 'Purchase Report' ||
            currentTab == 'Vendors'||
        currentTab == 'Purchase Aging Report'
        ? SubPurchase(currentTab, item)
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
              child:  Text(
                'Purchase',
                style: dashBoardLabelTextStyle,
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(20),
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 13,
              children: List<Widget>.generate(purchase.length, (int index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        tappedPurchases = index;
                        currentTab = purchase[index].text;
                        item = tappedPurchase;
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
                              color: tabSelectionAColor.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SvgPicture.asset(purchase[index].icon),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(6),
                          ),
                          Center(
                            child: Text(
                              purchase[index].text.toString(),textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                              style: clearDataAlertYesButtonLabelStyle,
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
                'Report',
                style: categoryTextStyle,
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 13,
              children: List<Widget>.generate(report.length, (int index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        tappedReport = index;
                        currentTab = report[index].text;
                        item = tappedReports;
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
                              color: tabSelectionAColor.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SvgPicture.asset(report[index].icon),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(6),
                          ),
                          Text(
                            report[index].text.toString(),
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
              height: AppScreenUtil().screenHeight(25),
            ),
          ],
        ),))
      ],
    ));
  }
}
