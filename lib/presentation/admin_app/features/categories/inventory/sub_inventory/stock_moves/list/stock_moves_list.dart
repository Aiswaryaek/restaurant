import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../../../user_app/widgets/custom_button.dart';

class StockMovesList extends StatefulWidget {
  const StockMovesList({super.key});

  @override
  State<StockMovesList> createState() => _StockMovesListState();
}

class _StockMovesListState extends State<StockMovesList> {
   
 



  ScrollController stockMovesTableScrollController = ScrollController();
  double stockMovesTableIndicatorPosition = 0.0;
   @override
  void initState() {
    super.initState();
     stockMovesTableScrollController.addListener(() {
      setState(() {
        stockMovesTableIndicatorPosition = (stockMovesTableScrollController.offset /
                stockMovesTableScrollController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
  }
   @override
  void dispose() {
    stockMovesTableScrollController.dispose();
   
    super.dispose();
  }

  List<String> dateList = [
    '28/02/2023',
    '30/02/2023',
    '13/05/2023',
    '15/03/2023'
  ];
  List<String> referenceList = ['Lorem1', 'Lorem2', 'Lorem3', 'Lorem4'];
  List<String> productList = [
    'Shirt',
    'Shirt',
    'Shirt',
    'Shirt'
  ];
  List<String> toList = ['Kakkanad', 'Kakkanad', 'Kakkanad', 'Kakkanad'];
    List<String> fromList = ['Kannur', 'Kannur', 'Kannur', 'Kannur'];
    List<String> quantityList = ['10', '10', '10', '10'];
    List<String> uomList = ['Unit', 'Unit', 'Unit', 'Unit'];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  List<String> branchList = [
   'Cyber', 'Cyber', 'Cyber', 'Cyber'
  ];
  List<String> type = [
    'POS', 'Inventory Adjustment', 'POS', 'Inventory Adjustment'
  ];
    List<String> statusList = [
   'Available','Cancel'
  ];
    List<String> alternateArrowImagePath = [
   ImageCons.imgStocksDownArrow,ImageCons.imgStocksUpArrow
  ];
    List<Color> alternateStatusColor = [
    bankReceiptButtonColorGreen.withOpacity(0.6),
    bankReceiptButtonColorRed.withOpacity(0.5)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15),left: AppScreenUtil().screenWidth(16)),
              child: InventoryTableLayout(
                  scrollController: stockMovesTableScrollController,
                  slidingIndicatorPosition: stockMovesTableIndicatorPosition,
                  tableDataWidgets: List.generate(dateList.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                      child: GestureDetector(
                        onTap:(){} ,
                        child: Container(
                          height: AppScreenUtil().screenHeight(36),
                          width: AppScreenUtil().screenWidth(870),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ///Product id data
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child: Text(
                                          dateList[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                    
                                ///Product name data
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child:  Text(referenceList[index],
                                            style: dashBoardTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    )
                                  ],
                                ),
                                    
                                ///Product image data
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child: Text(productList[index],
                                            style: dashBoardTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    )
                                  ],
                                ),
                                    ///Uom data
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child:  Text(fromList[index],
                                            style: dashBoardTextStyle,
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
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child:  Text(toList[index],
                                            style: dashBoardTextStyle,
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
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child: Text(quantityList[index],
                                            style: dashBoardTextStyle,
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
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child: Text(uomList[index],
                                            style: dashBoardTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    )
                                  ],
                                ), Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Center(
                                        child:  Text(branchList[index],
                                            style: dashBoardTextStyle,
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
                                        child:  Text(type[index],
                                            style: dashBoardTextStyle,
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
                  tableRowWidth: 870,
                  titleWidgets: [
                    ///Date heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(80),
                          child: Center(
                            child:  Text(
                              'Date',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
            
                    ///Name heading

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(80),
                          child: Center(
                            child:  Text(
                              'Reference',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
            
                    ///From heading

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(80),
                          child: Center(
                            child: Text(
                              'Product',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
            
                    /// To heading

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(80),
                          child: Center(
                            child:   Text(
                              'From',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    ///Contact heading

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(80),
                          child: Center(
                            child:  Text(
                              'To',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
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
                          width: AppScreenUtil().screenWidth(80),
                          child: Center(
                            child:   Text(
                              'Quantity',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
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
                          width: AppScreenUtil().screenWidth(80),
                          child: Center(
                            child:  Text(
                              'UOM',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
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
                          width: AppScreenUtil().screenWidth(80),
                          child: Center(
                            child:  Text(
                              'Branch',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
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
                            child:  Text(
                              'Type',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
          ]))
          ],
        ),
      
      ],
    );
  }
}