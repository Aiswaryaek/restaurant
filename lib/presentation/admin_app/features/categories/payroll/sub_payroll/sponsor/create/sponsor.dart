// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';

class Sponsor extends StatefulWidget {
  const Sponsor({super.key});

  @override
  State<Sponsor> createState() => _SponsorState();
}

class _SponsorState extends State<Sponsor> {
  final nameController = TextEditingController();
  final sponsorController = TextEditingController();
  final sponsorExpiryController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: nameController, title: 'Name'),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: sponsorController, title: 'Sponsor No.'),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextFieldWithDate(
                controller: sponsorExpiryController,
                title: 'Sponsor Expiry',
                onTap: () async {
                  dateSelection(controller: sponsorExpiryController);
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(child: Container()),
            ],
          )
        ]) );
  }
}
