import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/image_constant.dart';

class CommonCheckBox extends StatefulWidget {
  final Color borderColor;
  final BorderRadiusGeometry? borderRadius;
  const CommonCheckBox(
      {super.key, required this.borderColor, this.borderRadius});

  @override
  State<CommonCheckBox> createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Container(
        height: 16.28,
        width: 16.28,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.borderColor,
            width: 1.0,
          ),
          borderRadius: widget.borderRadius,
          color: Colors.transparent,
        ),
        child: Visibility(
          visible: (_isChecked == false)?false:true,
       
          child: Center(

            child: ImageIcon(AssetImage(ImageCons.imgPosSettingsTikIcon),size: 9.00,)
          ),
        ),
      ),
    );
  }
}
