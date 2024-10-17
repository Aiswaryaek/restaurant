

import 'dart:convert';

ViewCashCustomerResModel viewCashCustomerResModelFromJson(String str) => ViewCashCustomerResModel.fromJson(json.decode(str));

String viewCashCustomerResModelToJson(ViewCashCustomerResModel data) => json.encode(data.toJson());

class ViewCashCustomerResModel {
    dynamic id;
    String? name;

    ViewCashCustomerResModel({
        this.id,
        this.name,
    });

    factory ViewCashCustomerResModel.fromJson(Map<dynamic, dynamic> json) => ViewCashCustomerResModel(
        id: json["_id"],
        name: json["name"],
    );

    Map<dynamic, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
