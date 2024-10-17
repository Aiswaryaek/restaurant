import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/colored_textfield.dart';

class Sequence extends StatefulWidget {
  const Sequence({super.key});

  @override
  State<Sequence> createState() => _SequenceState();
}

class _SequenceState extends State<Sequence> {
  final prefixController = TextEditingController();
  final sequenceSizeController = TextEditingController();
  final nextNumberController = TextEditingController();
  String? _selectedItem;
  final List<String> _dropdownItems = ['01', '02', '03'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredDropDown(isVisible: true,
            dropDownItems: _dropdownItems,
            title: 'Sequence Name',
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
          ColoredTextField(
              color: textFieldColor,
              controller: prefixController,
              title: 'Prefix'),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          ColoredTextField(
              color: textFieldColor,
              controller: sequenceSizeController,
              title: 'Sequence Size'),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          ColoredTextField(
              color: textFieldColor,
              controller: nextNumberController,
              title: 'Next Number'),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
        ],
      )
    );
  }
}
