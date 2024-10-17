// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../../user_app/widgets/common_image_view.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';

class ProductMasterList extends StatefulWidget {

  const ProductMasterList({super.key});

  @override
  State<ProductMasterList> createState() => _ProductMasterListState();
}

class _ProductMasterListState extends State<ProductMasterList> {
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  ScrollController productMasterTableScrollController = ScrollController();
  double productMasterTableIndicatorPosition = 0.0;
  @override
  void initState() {
    super.initState();
    productMasterTableScrollController.addListener(() {
      setState(() {
        productMasterTableIndicatorPosition =
            (productMasterTableScrollController.offset /
                    productMasterTableScrollController
                        .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    productMasterTableScrollController.dispose();

    super.dispose();
  }

  List<String> productIdList = [
    'PKDGS1233',
    'PKDGS1245',
    'PKDGS1256',
    'PKDGS1278',
    'PKDGS1233',
    'PKDGS1245',
    'PKDGS1256',
    'PKDGS1278',
    'PKDGS1233',
    'PKDGS1245',
    'PKDGS1256',
    'PKDGS1278'
  ];
  List<String> productNameList = [
    'Orange',
    'Apple',
    'Mango',
    'Apple',
    'Orange',
    'Apple',
    'Mango',
    'Apple',
    'Orange',
    'Apple',
    'Mango',
    'Apple'
  ];
  List<String> productImageList = [
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
    'https://usapple.org/wp-content/uploads/2019/10/apple-pink-lady.png',
  ];
  List<String> uomList = [
    'Unit1',
    'Unit2',
    'Unit3',
    'Unit4',
    'Unit1',
    'Unit2',
    'Unit3',
    'Unit4',
    'Unit1',
    'Unit2',
    'Unit3',
    'Unit4'
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    bottom: AppScreenUtil().screenHeight(15),
                    left: AppScreenUtil().screenWidth(16)),
                child: InventoryTableLayout(
                    scrollController: productMasterTableScrollController,
                    slidingIndicatorPosition:
                        productMasterTableIndicatorPosition,
                    tableDataWidgets:
                        List.generate(productIdList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: GestureDetector(
                          onTap: (){
                            bottomBar(context);
                          },
                          child: Container(
                            height: AppScreenUtil().screenHeight(36),
                            width: AppScreenUtil().screenWidth(450),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: tableDataAlternateColor[
                                  index % tableDataAlternateColor.length],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(18)),

                              ///scrolling row
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ///Product id data
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(85),
                                        child: Center(
                                          child: Text(
                                            productIdList[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Product name data
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(85),
                                        child: Center(
                                          child: Text(productNameList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Product image data
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(85),
                                        child: Center(
                                          child:  CommonImageView(
                                            url: productImageList[index],
                                            height: 23,
                                            width: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Uom data
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(85),
                                        child: Center(
                                          child: Text(uomList[index],
                                              style: tableSubTitleLabelStyle,
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
                      );
                    }),
                    tableRowWidth: 450,
                    titleWidgets: [
                      ///Product id heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Center(
                              child: Text(
                                'Product ID',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),

                      ///Product name heading

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Center(
                              child:  Text(
                                'Product Name',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),

                      ///Product image heading

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Center(
                              child: Text(
                                'Product Image',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),

                      ///Product uom heading

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Center(
                              child: Text(
                                'UOM',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),

                      ///Variant heading

                    ]))
          ],
        ),
      ],
    );
  }
  void bottomBar(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: AppScreenUtil().screenHeight(100),
          decoration: BoxDecoration(
            color: confirmColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              SizedBox(
                width: AppScreenUtil().screenWidth(50),
                child: Center(
                  child: Divider(
                    color: whiteColor,
                    thickness: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InventoryBottomSheetItemLayout(
                        iconHeight: 13.09,
                        iconPath: ImageCons.imgDisabledView,
                        iconWidth: 20.53),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.edit,
                        iconWidth: 15.29),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDelete,
                        iconWidth: 13.91),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
