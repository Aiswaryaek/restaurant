import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CommonDropDownWithTitle extends StatefulWidget {
  final List<String> dropDownItems;
  final String title;
  final String? value;
  final double width;
  final Function(String?)? onChanged;
  const CommonDropDownWithTitle({super.key,required this.dropDownItems,required this.title,this.width = double.infinity,required this.value,required this.onChanged});

  @override
  State<CommonDropDownWithTitle> createState() => _CommonDropDownWithTitleState();
}

class _CommonDropDownWithTitleState extends State<CommonDropDownWithTitle> {
  String? _selectedItem;
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: bookedTextStyle,
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(8),
                              ),
                              Container(
                                width: widget.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: whiteColor,
                                    boxShadow:const [
                                       BoxShadow(
                                        color: searchTextColor,
                                        offset: Offset(0, 0),
                                        blurRadius: 1,
                                      ),
                                    ]),
                                child: SizedBox(
                                  height: 38,
                                  child: DropdownButton<String>(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    value: widget.value,
                                    items: widget.dropDownItems.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: subTitleTextStyle,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged:widget.onChanged,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.transparent,
                                    ),
                                    iconSize: 20,
                                    isExpanded: true,
                                    underline:
                                        const SizedBox(), // Removes the default underline
                                  ),
                                ),
                              )
                            ],
                          );
  }
}