import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_dropdown.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class ApplyLeaveScreen extends StatefulWidget {
  const ApplyLeaveScreen({super.key});

  @override
  State<ApplyLeaveScreen> createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(12),
  );
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: AppScreenUtil().screenHeight(20),
              left: AppScreenUtil().screenWidth(10),
              right: AppScreenUtil().screenWidth(18),
              bottom: AppScreenUtil().screenHeight(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Leave Summery',
                style: companyInfoBoldTitleLabelStyle,
              ),
              Row(
                children: [
                  Text(
                    'Selected Days : ',
                    style: companyInfoBoldTitleLabelStyle,
                  ),
                  Text(
                    '10',
                    style: leaveDetailsSelectedCountLabelStyle,
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(18),
              right: AppScreenUtil().screenWidth(18)),
          child: Column(
            children: [
              ColoredDropDown(
                dropDownItems: _dropdownItems,
                title: 'Select Leave Type',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              constHeight,
              ColoredTextField(
                  color: textFieldColor,
                  controller: TextEditingController(),
                  title: 'Leave Date From'),
              constHeight,
              ColoredDropDown(
                dropDownItems: _dropdownItems,
                title: 'Leave Date To',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              constHeight,
               ColoredTextField(
                textFieldHeight: AppScreenUtil().screenHeight(73),
                  color: textFieldColor,
                  controller: TextEditingController(),
                  title: 'Reason',maxLines: 5,),
                  constHeight,
                   Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              child: Column(
                children: [
                  Text(
                    'Image upload',
                    style: imageUploadLabelStyle,
                  ),
                  SvgPicture.asset(
                    ImageCons.uploadImage,
                    height: 53 * 1.32,
                    width: 55 * 1.32,
                  ),
                ],
              ),
            ),
          ),
            ],
          ),
        ),
      ],
    );
  }
}
