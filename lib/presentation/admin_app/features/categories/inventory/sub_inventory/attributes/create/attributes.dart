// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class Attributes extends StatefulWidget {
  const Attributes({super.key});

  @override
  State<Attributes> createState() => _AttributesState();
}

class _AttributesState extends State<Attributes> {
  final attributeController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  ScrollController productTableController = ScrollController();
  double productIndicatorPosition = 0.0;

  List<String> value = [
    'S',
    'M',
    'L',
    'XL',
    'M',
    'S',
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();
  final attributesController = TextEditingController();

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
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:
                        CustomTextFieldWithTitle(
                            controller: attributesController,
                            title: 'Attribute')
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Values',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(5),
                ),
                Align(alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      6,
                      6,
                      6,
                      6,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: inventorySelectionColor),
                    child: Icon(
                      Icons.add,
                      color: redColor,
                      size: 18,
                    ),
                  ),
                ),
                DefaultProductTable( visible: false,

                    scrollController: productTableController,
                    slidingIndicatorPosition: productIndicatorPosition,
                    tableDataWidgets: List.generate(value.length, (index) {
                      return InkWell(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: AppScreenUtil().screenWidth(5)),
                          child: Container(
                            height: AppScreenUtil().screenHeight(36),
                            width: AppScreenUtil().screenWidth(325),
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
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 18,width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: whiteColor,
                                              border:
                                              Border.all(color: blackColor)),
                                          child: Text(textAlign: TextAlign.center,
                                            value[index],
                                            style: largeTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
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
                    tableRowWidth: 325,
                    titleWidgets: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'value',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ],
            )),
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
