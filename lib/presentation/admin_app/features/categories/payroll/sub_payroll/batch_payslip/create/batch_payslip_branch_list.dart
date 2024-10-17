// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/image_constant.dart';

class BatchPaySlipBranchList extends StatefulWidget {
  const BatchPaySlipBranchList({super.key});

  @override
  State<BatchPaySlipBranchList> createState() => _BatchPaySlipBranchListState();
}

class _BatchPaySlipBranchListState extends State<BatchPaySlipBranchList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              height: AppScreenUtil().screenHeight(30),
              padding: EdgeInsets.only(left: 25,right: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: inventorySelectionColor.withOpacity(0.4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EMP054-Vaisak',
                    style: toggleTextStyle,
                  ),
                  SvgPicture.asset(
                    ImageCons.imgDelete,height: 18,
                    color: confirmColor,
                  )
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 3);
            },
          )
        ],
      ),
    );
  }
}
