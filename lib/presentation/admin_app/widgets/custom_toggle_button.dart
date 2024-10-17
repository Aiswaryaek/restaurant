import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/image_constant.dart';

class CustomToggleButton extends StatefulWidget {
  final bool isToggled;
  final Function()? onTap;
  const CustomToggleButton({super.key,this.onTap,required this.isToggled});

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}


class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 16,
        width: 30,
        color: Colors.transparent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 30,
                height: 9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: kotDarkModeToggleButtonTrackColor,
                ),
            
              ),
            ),
            AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: widget.isToggled ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: 16,
                    height:  16,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isToggled?blackColor:redColor,
                    ),
                    child: Center(child:widget.isToggled?SvgPicture.asset(ImageCons.imgDark,height: 8.62,width: 7.71,): SvgPicture.asset(ImageCons.imgBright,height: 8.49,width: 8.49,)),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
