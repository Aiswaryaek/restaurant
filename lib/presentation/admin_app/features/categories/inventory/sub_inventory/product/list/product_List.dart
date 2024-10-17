// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../../user_app/widgets/common_image_view.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ScrollController productTableController = ScrollController();
  double productIndicatorPosition = 0.0;
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
    'PKDGS1278',
    'PKDGS1233',
    'PKDGS1245',
    'PKDGS1256',
    'PKDGS1278',
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
    'Apple',
    'Orange',
    'Apple',
    'Mango',
    'Apple',
  ];
  List<String> productImageList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcFXQTV9k9CtIt_77TWlslG3S9yW-JvmYD9TuNZvQFR0TEgsaUReJCX6Ns_MB2GUNWxvQ&usqp=CAU',
  ];
  List<String> uomList = [
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
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();
  bool isChecked = false;

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15,bottom: 20),
          child: DefaultProductTable( visible: true,
              scrollController: productTableController,
              slidingIndicatorPosition: productIndicatorPosition,
              tableDataWidgets: List.generate(productIdList.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(583),
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
                            ///Product id data
                            Padding(padding: EdgeInsets.only(left: 15),child: Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(70),
                              child: Text(
                                productIdList[index],
                                style: dashBoardTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),),

                            ///Product name data
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(85),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(productNameList[index],
                                      style: dashBoardTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),

                            ///Product image data
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(85),
                                child: Center(
                                    child: CommonImageView(
                                  url: productImageList[index],
                                  height: 30,
                                  width: 30,
                                ))),

                            ///Uom data
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(50),
                              child: Text(uomList[index],
                                  style: dashBoardTextStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            ///variant
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: Container(
                                width: 16,
                                height: 15,
                                decoration: BoxDecoration(
                                  border: Border.all(color: blackColor,width: 1.5),
                                  color: isChecked ? constantWhite : Colors.transparent,
                                ),
                                child: isChecked
                                    ?Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: SvgPicture.asset(ImageCons.imgCheckboxTikMark,width: 15,height: 11,),
                                )
                                    : null,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 15),child:    Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(75),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: AppScreenUtil().screenHeight(16),
                                      width: AppScreenUtil().screenWidth(35),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color:
                                            inventoryTableVariantContainerBorderColor),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '1ltr',
                                          style:
                                          inventoryTableVariantLabelStyle,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height:
                                        AppScreenUtil().screenHeight(16),
                                        width: AppScreenUtil().screenWidth(35),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1,
                                              color:
                                              inventoryTableVariantContainerBorderColor),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '3ltr',
                                            style:
                                            inventoryTableVariantLabelStyle,
                                          ),
                                        ))
                                  ],
                                )),)
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
              tableRowWidth: 583,
              titleWidgets: [
                ///Product id heading
               Padding(padding: EdgeInsets.only(left: 15),child:  Container(
                 color: Colors.transparent,
                 width: AppScreenUtil().screenWidth(70),
                 child: Text(
                   'Product ID',
                   style: tableTitleLabelStyle,
                   maxLines: 1,
                 ),
               ),),

                ///Product name heading

                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Product Name',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),

                ///Product image heading

                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(85),
                  child: Text(
                    'Product Image',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                ),

                ///Product uom heading

                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(50),
                  child: Text(
                    'UOM',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    width: 16,
                    height: 15,
                    decoration: BoxDecoration(
                      border: Border.all(color: blackColor,width: 1.5),
                      color: isChecked ? constantWhite : Colors.transparent,
                    ),
                    child: isChecked
                        ?Padding(
                      padding: const EdgeInsets.all(2),
                      child: SvgPicture.asset(ImageCons.imgCheckboxTikMark,width: 15,height: 11,),
                    )
                        : null,
                  ),
                ),
               Padding(padding: EdgeInsets.only(right: 15),child:    Container(
                 color: Colors.transparent,
                 width: AppScreenUtil().screenWidth(75),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Variant',
                       style: tableTitleLabelStyle,
                       maxLines: 1,
                     ),
                   ],
                 ),
               ),)
              ]),
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
