// To parse this JSON data, do
//
//     final addPosOrderModel = addPosOrderModelFromJson(jsonString);

import 'dart:convert';

AddPosOrderModel addPosOrderModelFromJson(String str) => AddPosOrderModel.fromJson(json.decode(str));

String addPosOrderModelToJson(AddPosOrderModel data) => json.encode(data.toJson());

class AddPosOrderModel {
    int? transNo;
    String? name;
    String? shiftId;
    String? branchId;
    List<dynamic>? tableId;
    List<dynamic>? chairId;
    String? empId;
    int? orderDate;
    String? cusId;
    List<OrderInfo>? orderInfo;
    bool? isReturn;
    int? subTotal;
    int? discountAmt;
    int? totalExclusive;
    double? totalInclusive;
    int? amtTotal;
    dynamic deliveryNoteid;
    String? status;
    int? amountDue;
    bool? paymentStatus;
    String? ordType;
    dynamic aggregatorId;
    int? deliveryCharge;
    dynamic mainOrdId;
    String? aggregatorRef;
    dynamic waiterId;
    String? ordDuration;
    String? id;
    int? v;

    AddPosOrderModel({
        this.transNo,
        this.name,
        this.shiftId,
        this.branchId,
        this.tableId,
        this.chairId,
        this.empId,
        this.orderDate,
        this.cusId,
        this.orderInfo,
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
        this.id,
        this.v,
    });

    factory AddPosOrderModel.fromJson(Map<String, dynamic> json) => AddPosOrderModel(
        transNo: json["transNo"],
        name: json["name"],
        shiftId: json["shiftId"],
        branchId: json["branchId"],
        tableId: json["tableId"] == null ? [] : List<dynamic>.from(json["tableId"]!.map((x) => x)),
        chairId: json["chairId"] == null ? [] : List<dynamic>.from(json["chairId"]!.map((x) => x)),
        empId: json["empId"],
        orderDate: json["orderDate"],
        cusId: json["cusId"],
        orderInfo: json["orderInfo"] == null ? [] : List<OrderInfo>.from(json["orderInfo"]!.map((x) => OrderInfo.fromJson(x))),
        isReturn: json["isReturn"],
        subTotal: json["subTotal"],
        discountAmt: json["discountAmt"],
        totalExclusive: json["totalExclusive"],
        totalInclusive: json["totalInclusive"]?.toDouble(),
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
        id: json["_id"]?? json['data']?['_id'],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "transNo": transNo,
        "name": name,
        "shiftId": shiftId,
        "branchId": branchId,
        "tableId": tableId == null ? [] : List<dynamic>.from(tableId!.map((x) => x)),
        "chairId": chairId == null ? [] : List<dynamic>.from(chairId!.map((x) => x)),
        "empId": empId,
        "orderDate": orderDate,
        "cusId": cusId,
        "orderInfo": orderInfo == null ? [] : List<dynamic>.from(orderInfo!.map((x) => x.toJson())),
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
        "_id": id,
        "__v": v,
    };
}

class OrderInfo {
    int? itemType;
    String? productId;
    String? desccription;
    dynamic customerNote;
    int? qty;
    String? uom;
    int? unitPrice;
    List<Tax>? taxes;
    int? subTotalWoTax;
    int? lineTotal;
    dynamic kotOrderId;
    String? kotStatus;
    bool? includedPrice;
    String? id;

    OrderInfo({
        this.itemType,
        this.productId,
        this.desccription,
        this.customerNote,
        this.qty,
        this.uom,
        this.unitPrice,
        this.taxes,
        this.subTotalWoTax,
        this.lineTotal,
        this.kotOrderId,
        this.kotStatus,
        this.includedPrice,
        this.id,
    });

    factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
        itemType: json["itemType"],
        productId: json["productId"],
        desccription: json["desccription"],
        customerNote: json["customerNote"],
        qty: json["qty"],
        uom: json["uom"],
        unitPrice: json["unitPrice"],
        taxes: json["taxes"] == null ? [] : List<Tax>.from(json["taxes"]!.map((x) => Tax.fromJson(x))),
        subTotalWoTax: json["subTotalWoTax"],
        lineTotal: json["lineTotal"],
        kotOrderId: json["kotOrderId"],
        kotStatus: json["kotStatus"],
        includedPrice: json["includedPrice"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "itemType": itemType,
        "productId": productId,
        "desccription": desccription,
        "customerNote": customerNote,
        "qty": qty,
        "uom": uom,
        "unitPrice": unitPrice,
        "taxes": taxes == null ? [] : List<dynamic>.from(taxes!.map((x) => x.toJson())),
        "subTotalWoTax": subTotalWoTax,
        "lineTotal": lineTotal,
        "kotOrderId": kotOrderId,
        "kotStatus": kotStatus,
        "includedPrice": includedPrice,
        "_id": id,
    };
}

class Tax {
    String? id;
    bool? includedPrice;
    int? amount;
    String? accountId;
    String? taxName;

    Tax({
        this.id,
        this.includedPrice,
        this.amount,
        this.accountId,
        this.taxName,
    });

    factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        id: json["_id"],
        includedPrice: json["includedPrice"],
        amount: json["amount"],
        accountId: json["accountId"],
        taxName: json["taxName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "includedPrice": includedPrice,
        "amount": amount,
        "accountId": accountId,
        "taxName": taxName,
    };
}
