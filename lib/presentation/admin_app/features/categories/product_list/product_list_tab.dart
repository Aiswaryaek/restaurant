// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/product_list/product.dart';

import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';
import '../../../../../utiles/image_constant.dart';
import '../../../widgets/product_table.dart';

class ProductListTab extends StatefulWidget {
  const ProductListTab({super.key});

  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  ScrollController productTableController = ScrollController();
  double productIndicatorPosition = 0.0;
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  List<String> productId = [
    'PKDGS1233',
    'PKDGS1233',
    'PKDGS1233',
    'PKDGS1233',
    'PKDGS1233',
    'PKDGS1233',
    'PKDGS1233',
    'PKDGS1233',
    'PKDGS1233',
    'PKDGS1233',
  ];
  List<String> productName = [
    'Water',
    'Water',
    'Water',
    'Water',
    'Water',
    'Water',
    'Water',
    'Water',
    'Water',
    'Water',
  ];
  List<String> attributes1 = [
    'Flavoutransparent',
    'Flavoutransparent',
    'Flavoutransparent',
    'Flavoutransparent',
    'Flavoutransparent',
    'Flavoutransparent',
    'Flavoutransparent',
    'Flavoutransparent',
    'Flavoutransparent',
    'Flavoutransparent',
  ];
  List<String> attributes2 = [
    'Normal',
    'Normal',
    'Normal',
    'Normal',
    'Normal',
    'Normal',
    'Normal',
    'Normal',
    'Normal',
    'Normal',
  ];
  List<String> uom = [
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
  ];
  List<String> purchaseUom1 = [
    '1ltr',
    '1ltr',
    '1ltr',
    '1ltr',
    '1ltr',
    '1ltr',
    '1ltr',
    '1ltr',
    '1ltr',
    '1ltr',
  ];
  List<String> purchaseUom2 = [
    '2ltr',
    '2ltr',
    '2ltr',
    '2ltr',
    '2ltr',
    '2ltr',
    '2ltr',
    '2ltr',
    '2ltr',
    '2ltr',
  ];
  List<String> barcode = [
    '8006765463',
    '8006765463',
    '8006765463',
    '8006765463',
    '8006765463',
    '8006765463',
    '8006765463',
    '8006765463',
    '8006765463',
    '8006765463',
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
  String? tappedItem = 'Product List';
  bool tapped = false;

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
    return Container(
        // height: 600,
        width: double.infinity,
        child: Column(
      children: [
        SizedBox(height: AppScreenUtil().screenHeight(25),),
        Expanded(child: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.only(left: 16),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, 2.5),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                    height: AppScreenUtil().screenHeight(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: reductionBottomSheetButtonColor.withOpacity(0.1)),
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
                            style: mainRedTextStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: AppScreenUtil().screenWidth(8),
                ),
                Transform.translate(
                  offset: Offset(0, -17.5),
                  child: Center(
                    child: Text(
                      'Product List',
                      style: btnTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(5),
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
                                tappedItem = 'Product List';
                              });
                            },
                            child: Text(
                              'Product List',
                              style: tappedItem == 'Product'
                                  ? taxCreateEnterAPassWordLabelStyle
                                  : gridTextStyle,
                            ),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(2),
                          ),
                          tappedItem == 'Product List'
                              ? SizedBox()
                              : Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 10,
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(4),
                          ),
                          tappedItem == 'Product List'
                              ? SizedBox()
                              : Expanded(
                            child: Container(
                                width: AppScreenUtil().screenHeight(120),
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Product',
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
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                tappedItem == 'Product'
                    ? ProductTab()
                    : Padding(padding: EdgeInsets.only(bottom: 30),child: DefaultProductTable(
                    visible: true,
                    scrollController: productTableController,
                    slidingIndicatorPosition: productIndicatorPosition,
                    tableDataWidgets:
                    List.generate(productId.length, (index) {
                      return InkWell(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: AppScreenUtil().screenWidth(0)),
                          child: Container(
                            height: AppScreenUtil().screenHeight(36),
                            width: AppScreenUtil().screenWidth(1006),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: tableDataAlternateColor[
                              index % tableDataAlternateColor.length],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(5)),

                              ///scrolling row
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  ///Product id data
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(100),
                                      child: Center(
                                        child: Text(
                                          productId[index],
                                          style: xlTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),

                                  ///Product name data
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(110),
                                      child: Center(
                                        child: Text(productName[index],
                                            style: xlTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      )),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: AppScreenUtil()
                                              .screenHeight(14),
                                          width:
                                          AppScreenUtil().screenWidth(55),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                inventoryTableVariantContainerBorderColor),
                                          ),
                                          child: Transform.translate(
                                            offset: Offset(0, -0.8),
                                            child: Text(attributes1[index],
                                                style: xlTextStyle,
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow:
                                                TextOverflow.ellipsis),
                                          ),
                                        ),
                                        Container(
                                            height: AppScreenUtil()
                                                .screenHeight(14),
                                            width: AppScreenUtil()
                                                .screenWidth(55),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                  inventoryTableVariantContainerBorderColor),
                                            ),
                                            child: Transform.translate(
                                              offset: Offset(0, -0.8),
                                              child: Text(attributes2[index],
                                                  style: xlTextStyle,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                  TextOverflow.ellipsis),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(110),
                                      child: Center(
                                        child: Text(uom[index],
                                            style: xlTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      )),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: AppScreenUtil()
                                              .screenHeight(14),
                                          width:
                                          AppScreenUtil().screenWidth(55),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                inventoryTableVariantContainerBorderColor),
                                          ),
                                          child: Transform.translate(
                                            offset: Offset(0, -0.8),
                                            child: Text(purchaseUom1[index],
                                                style: xlTextStyle,
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow:
                                                TextOverflow.ellipsis),
                                          ),
                                        ),
                                        Container(
                                            height: AppScreenUtil()
                                                .screenHeight(14),
                                            width: AppScreenUtil()
                                                .screenWidth(55),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                  inventoryTableVariantContainerBorderColor),
                                            ),
                                            child: Transform.translate(
                                              offset: Offset(0, -0.8),
                                              child: Text(purchaseUom2[index],
                                                  style: xlTextStyle,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                  TextOverflow.ellipsis),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(barcode[index],
                                            style: xlTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(closingStock[index],
                                            style: closingStockTitleStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(unitCost[index],
                                            style: unitCostTitleStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(stockValue[index],
                                            style: xlTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          tappedItem = 'Product';
                          setState(() {
                            tapped = true;
                          });
                        },
                      );
                    }),
                    tableRowWidth: 1006,
                    titleWidgets: [
                      ///Product id heading
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'Product ID',
                              style: subCompanySettingsTextStyle,
                              maxLines: 1,
                            ),
                          )),

                      ///Product name heading

                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(110),
                          child: Center(
                            child: Text(
                              'Product Name',
                              style: subCompanySettingsTextStyle,
                              maxLines: 1,
                            ),
                          )),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(120),
                          child: Center(
                            child: Text(
                              'Attributes',
                              style: subCompanySettingsTextStyle,
                              maxLines: 1,
                            ),
                          )),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(110),
                          child: Center(
                            child: Text(
                              'UOM',
                              style: subCompanySettingsTextStyle,
                              maxLines: 1,
                            ),
                          )),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(120),
                          child: Center(
                            child: Text(
                              'Purchase UOM',
                              style: subCompanySettingsTextStyle,
                              maxLines: 1,
                            ),
                          )),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(110),
                          child: Center(
                            child: Text(
                              'Barcode',
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
                    ]),),
              ],
            ),),))
      ],
    ));
  }
}
