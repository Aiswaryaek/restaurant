// To parse this JSON data, do
//
//     final viewPosOrderByIdResModel = viewPosOrderByIdResModelFromJson(jsonString);

import 'dart:convert';

ViewPosOrderByIdResModel viewPosOrderByIdResModelFromJson(String str) =>
    ViewPosOrderByIdResModel.fromJson(json.decode(str));

String viewPosOrderByIdResModelToJson(ViewPosOrderByIdResModel data) =>
    json.encode(data.toJson());

class ViewPosOrderByIdResModel {
  String? id;
  dynamic transNo;
  String? name;
  String? shiftId;
  String? branchId;
  List<String>? tableId;
  List<String>? chairId;
  String? empId;
  dynamic orderDate;
  String? cusId;
  bool? isReturn;
  dynamic subTotal;
  dynamic discountAmt;
  dynamic totalExclusive;
  dynamic totalInclusive;
  dynamic amtTotal;
  dynamic deliveryNoteid;
  String? status;
  dynamic amountDue;
  bool? paymentStatus;
  String? ordType;
  dynamic aggregatorId;
  dynamic deliveryCharge;
  dynamic mainOrdId;
  dynamic aggregatorRef;
  dynamic waiterId;
  String? ordDuration;
  List<dynamic>? orderInfo;
  dynamic v;
  List<Branch>? branches;
  dynamic contactNumber;
  String? address;
  dynamic logo;
  String? nativeAddress;
  List<String>? tableNames;

  ViewPosOrderByIdResModel({
    this.id,
    this.transNo,
    this.name,
    this.shiftId,
    this.branchId,
    this.tableId,
    this.chairId,
    this.empId,
    this.orderDate,
    this.cusId,
    this.isReturn,
    this.subTotal,
    this.discountAmt,
    this.totalExclusive,
    this.totalInclusive,
    this.amtTotal,
    this.deliveryNoteid,
    this.status,
    this.amountDue,
    this.paymentStatus,
    this.ordType,
    this.aggregatorId,
    this.deliveryCharge,
    this.mainOrdId,
    this.aggregatorRef,
    this.waiterId,
    this.ordDuration,
    this.orderInfo,
    this.v,
    this.branches,
    this.contactNumber,
    this.address,
    this.logo,
    this.nativeAddress,
    this.tableNames,
  });

  factory ViewPosOrderByIdResModel.fromJson(Map<String, dynamic> json) =>
      ViewPosOrderByIdResModel(
        id: json["_id"],
        transNo: json["transNo"],
        name: json["name"],
        shiftId: json["shiftId"],
        branchId: json["branchId"],
        tableId: json["tableId"] == null
            ? []
            : List<String>.from(json["tableId"]!.map((x) => x)),
        chairId: json["chairId"] == null
            ? []
            : List<String>.from(json["chairId"]!.map((x) => x)),
        empId: json["empId"],
        orderDate: json["orderDate"] ?? json['orderDate'],
        cusId: json["cusId"],
        isReturn: json["isReturn"],
        subTotal: json["subTotal"],
        discountAmt: json["discountAmt"],
        totalExclusive: json["totalExclusive"],
        totalInclusive: json["totalInclusive"],
        amtTotal: json["amtTotal"],
        deliveryNoteid: json["deliveryNoteid"],
        status: json["status"],
        amountDue: json["amountDue"],
        paymentStatus: json["paymentStatus"],
        ordType: json["ordType"],
        aggregatorId: json["aggregatorId"],
        deliveryCharge: json["deliveryCharge"],
        mainOrdId: json["mainOrdId"],
        aggregatorRef: json["aggregatorRef"],
        waiterId: json["waiterId"],
        ordDuration: json["ordDuration"],
        orderInfo: json["orderInfo"] == null
            ? []
            : List<dynamic>.from(json["orderInfo"]!.map((x) => x)),
        v: json["__v"],
        branches: json["branches"] == null
            ? []
            : List<Branch>.from(
                json["branches"]!.map((x) => Branch.fromJson(x))),
        contactNumber: json["contactNumber"],
        address: json["address"],
        logo: json["logo"],
        nativeAddress: json["nativeAddress"],
        tableNames: json["tableNames"] == null
            ? []
            : List<String>.from(json["tableNames"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "transNo": transNo,
        "name": name,
        "shiftId": shiftId,
        "branchId": branchId,
        "tableId":
            tableId == null ? [] : List<dynamic>.from(tableId!.map((x) => x)),
        "chairId":
            chairId == null ? [] : List<dynamic>.from(chairId!.map((x) => x)),
        "empId": empId,
        "orderDate": orderDate?.toIso8601String(),
        "cusId": cusId,
        "isReturn": isReturn,
        "subTotal": subTotal,
        "discountAmt": discountAmt,
        "totalExclusive": totalExclusive,
        "totalInclusive": totalInclusive,
        "amtTotal": amtTotal,
        "deliveryNoteid": deliveryNoteid,
        "status": status,
        "amountDue": amountDue,
        "paymentStatus": paymentStatus,
        "ordType": ordType,
        "aggregatorId": aggregatorId,
        "deliveryCharge": deliveryCharge,
        "mainOrdId": mainOrdId,
        "aggregatorRef": aggregatorRef,
        "waiterId": waiterId,
        "ordDuration": ordDuration,
        "orderInfo": orderInfo == null
            ? []
            : List<dynamic>.from(orderInfo!.map((x) => x)),
        "__v": v,
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
        "contactNumber": contactNumber,
        "address": address,
        "logo": logo,
        "nativeAddress": nativeAddress,
        "tableNames": tableNames == null
            ? []
            : List<dynamic>.from(tableNames!.map((x) => x)),
      };
}

class Branch {
  String? id;
  String? locationId;
  bool? status;
  String? contactPerson;
  String? nameOfStore;
  String? branchName;
  Categories? categories;
  dynamic transNo;
  String? storeCode;
  dynamic v;
  String? address;
  String? nativeAddress;
  String? nativenameOfStore;
  dynamic contactNumber;
  dynamic logo;
  bool? isCode;
  bool? outClothOrder;

  Branch({
    this.id,
    this.locationId,
    this.status,
    this.contactPerson,
    this.nameOfStore,
    this.branchName,
    this.categories,
    this.transNo,
    this.storeCode,
    this.v,
    this.address,
    this.nativeAddress,
    this.nativenameOfStore,
    this.contactNumber,
    this.logo,
    this.isCode,
    this.outClothOrder,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["_id"],
        locationId: json["locationId"],
        status: json["status"],
        contactPerson: json["contactPerson"],
        nameOfStore: json["nameOfStore"],
        branchName: json["branchName"],
        categories: json["categories"] == null
            ? null
            : Categories.fromJson(json["categories"]),
        transNo: json["transNo"],
        storeCode: json["storeCode"],
        v: json["__v"],
        address: json["address"],
        nativeAddress: json["nativeAddress"],
        nativenameOfStore: json["nativenameOfStore"],
        contactNumber: json["contactNumber"],
        logo: json["logo"],
        isCode: json["isCode"],
        outClothOrder: json["outClothOrder"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "locationId": locationId,
        "status": status,
        "contactPerson": contactPerson,
        "nameOfStore": nameOfStore,
        "branchName": branchName,
        "categories": categories?.toJson(),
        "transNo": transNo,
        "storeCode": storeCode,
        "__v": v,
        "address": address,
        "nativeAddress": nativeAddress,
        "nativenameOfStore": nativenameOfStore,
        "contactNumber": contactNumber,
        "logo": logo,
        "isCode": isCode,
        "outClothOrder": outClothOrder,
      };
}

class Categories {
  List<String>? model;
  bool? isQrcode;

  Categories({
    this.model,
    this.isQrcode,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        model: json["model"] == null
            ? []
            : List<String>.from(json["model"]!.map((x) => x)),
        isQrcode: json["isQrcode"],
      );

  Map<String, dynamic> toJson() => {
        "model": model == null ? [] : List<dynamic>.from(model!.map((x) => x)),
        "isQrcode": isQrcode,
      };
}