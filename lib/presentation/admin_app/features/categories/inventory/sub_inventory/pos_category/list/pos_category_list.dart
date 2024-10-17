import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_table_layout_without_scroll.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class PosCategoryList extends StatefulWidget {
  const PosCategoryList({super.key});

  @override
  State<PosCategoryList> createState() => _PosCategoryListState();
}

class _PosCategoryListState extends State<PosCategoryList> {
  ScrollController posCategoryTableController = ScrollController();
  double posCategoryIndicatorPosition = 0.0;
  List<String> productIdList = [
    '123',
    '123',
    '123',
    '123',
    '123',
    '123',
    '123',
    '123',
    '123',
    '123',
    '123'
  ];
  List<String> name = [
     'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid'
  ];

  List<String> mainCategoryList = [
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
    posCategoryTableController.addListener(() {
      setState(() {
        posCategoryIndicatorPosition = (posCategoryTableController.offset /
            posCategoryTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    posCategoryTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(16),),
            child: InventoryTableLayoutWithoutScroll(
              scrollIndicatorVisibility: false,
                tableHeight: MediaQuery.of(context).size.height/2,
                scrollController: posCategoryTableController,
                slidingIndicatorPosition: posCategoryIndicatorPosition,
                tableDataWidgets: List.generate(name.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(350),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(
                                      child: Text(
                                        name[index],
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
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child:  Text(mainCategoryList[index],
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
                                    width: AppScreenUtil().screenWidth(90),
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                }),
                tableRowWidth: 350,
                titleWidgets: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(80),
                        child: Center(
                          child: Text(
                            'Name',
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
                        width: AppScreenUtil().screenWidth(90),
                        child: Center(
                          child:  Text(
                            'Main Category',
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
                        width: AppScreenUtil().screenWidth(90),
                        child: Center(
                          child:   Text(
                            'Parent ID',
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
}
