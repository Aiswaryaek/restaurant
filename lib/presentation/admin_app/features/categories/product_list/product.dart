// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';
import '../../../../../utiles/image_constant.dart';
import '../../../widgets/product_table.dart';

class ProductTab extends StatefulWidget {
  ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  ScrollController productTableController = ScrollController();
  double productIndicatorPosition = 0.0;
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  List<String> branchName = [
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
    'Branch 1',
  ];
  List<String> closingStock = [
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
  ];
  List<String> unitCost = [
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
  ];
  List<String> stockValue = [
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
  ];

  @override
  void initState() {
    productTableController.addListener(() {
      setState(() {
        productIndicatorPosition = (productTableController.offset /
                productTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    productTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: DefaultProductTable(
          visible: true,
          scrollController: productTableController,
          slidingIndicatorPosition: productIndicatorPosition,
          tableDataWidgets: List.generate(branchName.length, (index) {
            return InkWell(
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: AppScreenUtil().screenWidth(0)),
                child: Container(
                  height: AppScreenUtil().screenHeight(36),
                  width: AppScreenUtil().screenWidth(436),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: tableDataAlternateColor[
                        index % tableDataAlternateColor.length],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(100),
                            child: Center(
                              child: Text(
                                branchName[index],
                                style: xlTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child: Text(closingStock[index],
                                    style: closingStockTitleStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child:  Text(unitCost[index],
                                    style: unitCostTitleStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                              child: Center(
                                child:  Text(stockValue[index],
                                    style: xlTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {},
            );
          }),
          tableRowWidth: 436,
          titleWidgets: [
            Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(100),
                child: Center(
                  child: Text(
                    'Branch Name',
                    style: subCompanySettingsTextStyle,
                    maxLines: 1,
                  ),
                )),
            Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(100),
                child: Center(
                  child: Text(
                    'Closing Stock',
                    style: closingStockLabelStyle,
                    maxLines: 1,
                  ),
                )),
            Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(100),
                child: Center(
                  child: Text(
                    'Unit Cost',
                    style: unitCostLabelStyle,
                    maxLines: 1,
                  ),
                )),
            Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(100),
                child: Center(
                  child: Text(
                    'Stock Value',
                    style: subCompanySettingsTextStyle,
                    maxLines: 1,
                  ),
                )),
          ]),
    );
  }
}
