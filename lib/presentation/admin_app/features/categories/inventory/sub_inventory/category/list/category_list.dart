// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  ScrollController categoryTableController = ScrollController();
  double categoryIndicatorPosition = 0.0;

  List<String> category = [
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem'
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    categoryTableController.addListener(() {
      setState(() {
        categoryIndicatorPosition = (categoryTableController.offset /
            categoryTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    categoryTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: DefaultProductTable( visible: false,
                scrollController: categoryTableController,
                slidingIndicatorPosition: categoryIndicatorPosition,
                tableDataWidgets: List.generate(category.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(330),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(
                                        category[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      bottomBar(context);
                    },
                  );
                }),
                tableRowWidth: 330,
                titleWidgets: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Center(
                          child: Text(
                            'Category',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        )
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
                        iconPath: ImageCons.imgVisibility,
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
