import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/kot_display/kot_display.dart';
import 'package:restaurant/presentation/admin_app/widgets/kot_tab_item_layout.dart';

class AllTab extends StatefulWidget {
  final bool isDarkMode;
  const AllTab({super.key,required this.isDarkMode});

  @override
  State<AllTab> createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  ///These lists are used only for testing purpose

  final List<String> cancelledItemName = ['Chiken Burger', 'Beef Burger'];

  final List<String> cancelledItemCount = ['03', '05'];

  final List<String> orderedItemName = [
    'Chiken Burger',
    'Beef Burger',
    'Chiken Burger'
  ];

  final List<String> orderedItemCount = ['03', '05', '03'];

  final List<bool> isNoteAddedList = [true, true, false];

  // /button status 0 is new order and 1 is preparing order and 2 is completed order. these status will change on api calls
  final List<int> orderStatusList = [
    0,1,2
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
          3,
          (index) => KotTabItemLayout(
            isDarkMode: widget.isDarkMode,
              orderStatus: orderStatusList[index ],
              cancelledItemCount: cancelledItemCount,
              cancelledItemName: cancelledItemName,
              date: '13 - 09 - 2022',
              isNoteAddedList: isNoteAddedList,
              orderNumber: 'ABCD123456789',
              orderedItemCount: orderedItemCount,
              orderedItemName: orderedItemName,
              tableNumber: '03',
              time: '12 : 36 PM',
              tokenNumber: '165',
              type: 'ONLINE ORDER',
              waiterName: 'Neeraj')),
    );
  }
}
