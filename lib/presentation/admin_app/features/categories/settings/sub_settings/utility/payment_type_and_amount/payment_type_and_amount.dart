// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/widgets/coloredDateField.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/outlined_table.dart';

class PaymentTypeAndAmount extends StatefulWidget {
  const PaymentTypeAndAmount({super.key});

  @override
  State<PaymentTypeAndAmount> createState() => _PaymentTypeAndAmountState();
}

class _PaymentTypeAndAmountState extends State<PaymentTypeAndAmount> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final fromDateInput = TextEditingController();
  final toDateInput = TextEditingController();
  ScrollController paymentTypeAndAmountController = ScrollController();
  dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {
      if (kDebugMode) {
        print("Date is not selected");
      }
    }
  }
  List<String> orderId = [
    'ORD5345',
    'ORD5345',
    'ORD5345',
    'ORD5345',
    'ORD5345',
    'ORD5345',
    'ORD5345',
    'ORD5345',
    'ORD5345',
    'ORD5345',
  ];
  List<String> date = [
    '23/08/2023',
    '23/08/2023',
    '23/08/2023',
    '23/08/2023',
    '23/08/2023',
    '23/08/2023',
    '23/08/2023',
    '23/08/2023',
    '23/08/2023',
    '23/08/2023',
  ];
  List<String> customerName = [
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
  ];
  List<String> location = [
    'kozhikode',
    'kozhikode',
    'kozhikode',
    'kozhikode',
    'kozhikode',
    'kozhikode',
    'kozhikode',
    'kozhikode',
    'kozhikode',
    'kozhikode',
  ];

  List<String> amount = [
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
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


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(padding: EdgeInsets.only(right: 25),child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColoredDropDown(isVisible: true,
              dropDownItems: _dropdownItems,
              title: 'Branch',
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(14),
            ),
            ColoredDropDown(isVisible: true,
              dropDownItems: _dropdownItems,
              title: 'Order Type',
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(14),
            ),
            ColoredDropDown(isVisible: true,
              dropDownItems: _dropdownItems,
              title: 'Order ID',
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(14),
            ),
            ColoredDateField(
              controller: fromDateInput,
              title: 'From',
              onTap: () async {
                dateSelection(controller: fromDateInput);
              },
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(14),
            ),
            ColoredDateField(
              controller: toDateInput,
              title: 'To',
              onTap: () async {
                dateSelection(controller: toDateInput);
              },
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(14),
            ),
            Text('Stock Listed',style: bookedTextStyle,),
            SizedBox(
              height: AppScreenUtil().screenHeight(12),
            ),
          ],
        ),),
        OutLinedTable( visible: false,
            scrollController: paymentTypeAndAmountController,
            tableHeight: MediaQuery.of(context).size.height / 2,
            tableDataWidgets: List.generate(orderId.length, (index) {
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
                                child:  Text(
                                  orderId[index],
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
                                child: Text(date[index],
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
                                child: Text(customerName[index],
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
                                child:  Text(location[index],
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
                                child: Text(amount[index],
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
                                Expanded(child: Center(
                                  child: DropdownButton<String>(
                                    style: searchInputTextStyle,
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    value: _selectedItem,hint: SvgPicture.asset(ImageCons.imgTableDropdownImage),
                                    items: _dropdownItems.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: subTitleTextStyle,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedItem = newValue;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: blackColor,
                                    ),
                                    iconSize: 18,
                                    isExpanded: false,
                                    underline:
                                    const SizedBox(), // Removes the default underline
                                  ),
                                )),
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
                      'Order ID',
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
                        'Date',
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
                        'Customer Name',
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
                        'Location',
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
                        'Amount',
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
                        'Type',
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
