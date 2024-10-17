import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/outlined_table.dart';

class StockCorrections extends StatefulWidget {
  const StockCorrections({super.key});

  @override
  State<StockCorrections> createState() => _StockCorrectionsState();
}

class _StockCorrectionsState extends State<StockCorrections> {
  int? tappedProduct;
  dynamic currentTab;
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  List<String> productId = [
    'PRO34523',
    'PRO34523',
    'PRO34523',
    'PRO34523',
    'PRO34523',
    'PRO34523',
    'PRO34523',
    'PRO34523',
    'PRO34523',
    'PRO34523',
  ];
  List<String> category = [
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
  ];
  List<String> productName = [
    'Banana',
    'Banana',
    'Banana',
    'Banana',
    'Banana',
    'Banana',
    'Banana',
    'Banana',
    'Banana',
    'Banana',
  ];
  List<String> stock = [
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
  ];

  List<String> unit = [
    'KG',
    'KG',
    'KG',
    'KG',
    'KG',
    'KG',
    'KG',
    'KG',
    'KG',
    'KG',
  ];

  List<String> image = [
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
  ];

  ScrollController stockController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 25,bottom: 30),
          child: ColoredDropDown(isVisible: true,
            dropDownItems: _dropdownItems,
            title: 'Branch',
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),
        ),
        Text('Stock Listed',style: bookedTextStyle,),
        SizedBox(
          height: AppScreenUtil().screenHeight(12),
        ),
        OutLinedTable( visible: false,
            scrollController: stockController,
            tableHeight: MediaQuery.of(context).size.height / 2,
            tableDataWidgets: List.generate(productId.length, (index) {
              return InkWell(
                child: Container(
                  height: AppScreenUtil().screenHeight(38),
                  width: AppScreenUtil().screenWidth(623),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: searchTextColor.withOpacity(0.15)),
                      color: Colors.transparent),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(18)),

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
                                  productId[index],
                                  style: tableSubTitleLabelStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
                                child:  Text(category[index],
                                    style: tableSubTitleLabelStyle,
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
                                child:  Text(productName[index],
                                    style: tableSubTitleLabelStyle,
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
                                child:  Text(stock[index],
                                    style: tableSubTitleLabelStyle,
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
                                child: Text(unit[index],
                                    style: tableSubTitleLabelStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(95),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(image[index],height: 23,),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  bottomBar(context);
                },
              );
            }),
            tableRowWidth: 623,
            titleWidgets: [
              Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Product ID',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Category',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Product Name',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Stock',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Unit',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Image',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
            ]),
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
                        iconPath: ImageCons.imgDisabledDelete,
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
