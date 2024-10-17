// To parse this JSON data, do
//
//     final ongoingOrdersListResModel = ongoingOrdersListResModelFromJson(jsonString);

import 'dart:convert';

List<OngoingOrdersListResModel> ongoingOrdersListResModelFromJson(String str) =>
    List<OngoingOrdersListResModel>.from(
        json.decode(str).map((x) => OngoingOrdersListResModel.fromJson(x)));

String ongoingOrdersListResModelToJson(List<OngoingOrdersListResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

///Mapping List of data into empty list
class AllOngoingOrdersListResModel {
  List<OngoingOrdersListResModel> allOngoingOrdersView;

  AllOngoingOrdersListResModel({required this.allOngoingOrdersView});

  factory AllOngoingOrdersListResModel.fromJson(List<dynamic> parsedJson) {
    List<OngoingOrdersListResModel> allOngoingOrdersView = parsedJson
        .map((json) => OngoingOrdersListResModel.fromJson(json))
        .toList();
    return AllOngoingOrdersListResModel(
        allOngoingOrdersView: allOngoingOrdersView);
  }
}

///SingleList
class OngoingOrdersListResModel {
  String? id;
  dynamic orderDate;
  dynamic ordType;
  String? name;
  dynamic discountAmt;
  dynamic amtTotal;
  dynamic amountDue;
  dynamic status;
  dynamic customerName;
  dynamic customerMobile;
  dynamic paidAmt;
  List<String>? tableNames;
  dynamic aggregatorRef;
  dynamic aggregatorName;
  String? waiterName;
  List<String>? chairId;
  dynamic custAddress;
  dynamic transNo;
  String? orderTime;

  OngoingOrdersListResModel({
    this.id,
    this.orderDate,
    this.ordType,
    this.name,
    this.discountAmt,
    this.amtTotal,
    this.amountDue,
    this.status,
    this.customerName,
    this.customerMobile,
    this.paidAmt,
    this.tableNames,
    this.aggregatorRef,
    this.aggregatorName,
    this.waiterName,
    this.chairId,
    this.custAddress,
    this.transNo,
    this.orderTime,
  });

  factory OngoingOrdersListResModel.fromJson(Map<String, dynamic> json) =>
      OngoingOrdersListResModel(
        id: json["_id"],
        orderDate: json["orderDate"],
        ordType: json["ordType"],
        name: json["name"],
        discountAmt: json["discountAmt"],
        amtTotal: json["amtTotal"],
        amountDue: json["amountDue"],
        status: json["status"],
        customerName: json["customerName"],
        customerMobile: json["customerMobile"],
        paidAmt: json["paidAmt"],
        tableNames: json["tableNames"] == null
            ? []
            : List<String>.from(json["tableNames"]!.map((x) => x)),
        aggregatorRef: json["aggregatorRef"],
        aggregatorName: json["aggregatorName"],
        waiterName: json["waiterName"],
        chairId: json["chairId"] == null
            ? []
            : List<String>.from(json["chairId"]!.map((x) => x)),
        custAddress: json["custAddress"],
        transNo: json["transNo"],
        orderTime: json["orderTime"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "orderDate":
            "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
        "ordType": ordType,
        "name": name,
        "discountAmt": discountAmt,
        "amtTotal": amtTotal,
        "amountDue": amountDue,
        "status": status,
        "customerName": customerName,
        "customerMobile": customerMobile,
        "paidAmt": paidAmt,
        "tableNames": tableNames == null
            ? []
            : List<dynamic>.from(tableNames!.map((x) => x)),
        "aggregatorRef": aggregatorRef,
        "aggregatorName": aggregatorName,
        "waiterName": waiterName,
        "chairId":
            chairId == null ? [] : List<dynamic>.from(chairId!.map((x) => x)),
        "custAddress": custAddress?.toJson(),
        "transNo": transNo,
        "orderTime": orderTime,
      };
}
