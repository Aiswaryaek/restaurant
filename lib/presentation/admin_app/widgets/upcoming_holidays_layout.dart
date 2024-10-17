import 'package:flutter/material.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class UpcomingHolidaysLayout extends StatelessWidget {
  final Color containerColor;
  final Color labelColor;
  final String day;
  final String month;
  final String holidayMainLabel;

  final String dateReminderLabel;

  const UpcomingHolidaysLayout(
      {super.key,
      required this.containerColor,
      required this.dateReminderLabel,
      required this.day,
      required this.holidayMainLabel,
      required this.labelColor,
      required this.month});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: AppScreenUtil().screenHeight(3)),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: AppScreenUtil().screenHeight(20),
              width: AppScreenUtil().screenWidth(20),
              decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    day,
                    style: upcomingHolidaysDateContainerLabelStyle(
                        labelColor),
                  ),
                  Text(
                    month,
                    style: upcomingHolidaysDateContainerLabelStyle(
                        labelColor),
                  ),
                ],
              ),
            ),
            Text(
              holidayMainLabel,
              style: upcomingHolidayMainLabelStyle(labelColor),
            ),
            Text(
              dateReminderLabel,
              style: upcomingHolidayDateReminderLabelStyle,
            )
          ],
        ),
      ),
    );
  }
}
