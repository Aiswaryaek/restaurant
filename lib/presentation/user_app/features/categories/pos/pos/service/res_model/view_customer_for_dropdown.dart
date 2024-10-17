

import 'dart:convert';

List<ViewCustomerForDropdownResModel> viewCustomerForDropdownResModelFromJson(String str) => List<ViewCustomerForDropdownResModel>.from(json.decode(str).map((x) => ViewCustomerForDropdownResModel.fromJson(x)));

String viewCustomerForDropdownResModelToJson(List<ViewCustomerForDropdownResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


///Mapping List of data into empty list
class AllCustomerDropdownList {
  List<ViewCustomerForDropdownResModel> allCustomerDropdown;

  AllCustomerDropdownList({required this.allCustomerDropdown});

  factory AllCustomerDropdownList.fromJson(List<dynamic> parsedJson) {
    List<ViewCustomerForDropdownResModel> allCustomerDropdown = parsedJson
        .map((json) => ViewCustomerForDropdownResModel.fromJson(json))
        .toList();
    return AllCustomerDropdownList(allCustomerDropdown: allCustomerDropdown);
  }
}
///SingleList
class ViewCustomerForDropdownResModel {
    String? id;
    String? name;
    String? mobileNo;

    ViewCustomerForDropdownResModel({
        this.id,
        this.name,
        this.mobileNo,
    });

    factory ViewCustomerForDropdownResModel.fromJson(Map<String, dynamic> json) => ViewCustomerForDropdownResModel(
        id: json["_id"],
        name: json["name"],
        mobileNo: json["mobileNo"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "mobileNo": mobileNo,
    };
}
