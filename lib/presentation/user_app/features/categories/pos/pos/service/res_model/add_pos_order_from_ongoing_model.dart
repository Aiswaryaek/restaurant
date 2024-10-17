// To parse this JSON data, do
//
//     final addPosOrderFromOngoingResModel = addPosOrderFromOngoingResModelFromJson(jsonString);

import 'dart:convert';

AddPosOrderFromOngoingResModel addPosOrderFromOngoingResModelFromJson(String str) => AddPosOrderFromOngoingResModel.fromJson(json.decode(str));

String addPosOrderFromOngoingResModelToJson(AddPosOrderFromOngoingResModel data) => json.encode(data.toJson());

class AddPosOrderFromOngoingResModel {
    Data? data;
    KotData? kotData;

    AddPosOrderFromOngoingResModel({
        this.data,
        this.kotData,
    });

    factory AddPosOrderFromOngoingResModel.fromJson(Map<String, dynamic> json) => AddPosOrderFromOngoingResModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        kotData: json["kotData"] == null ? null : KotData.fromJson(json["kotData"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "kotData": kotData?.toJson(),
    };
}

class Data {
    dynamic id;
    dynamic transNo;
    dynamic name;
    dynamic shiftId;
    dynamic branchId;
    List<String>? tableId;
    List<String>? chairId;
    dynamic empId;
    dynamic orderDate;
    dynamic cusId;
    bool? isReturn;
    dynamic subTotal;
    dynamic discountAmt;
    dynamic pkgCharge;
    dynamic totalExclusive;
    dynamic totalInclusive;
    dynamic amtTotal;
    dynamic deliveryNoteid;
    dynamic status;
    dynamic amountDue;
    bool? paymentStatus;
    dynamic ordType;
    dynamic aggregatorId;
    dynamic deliveryCharge;
    dynamic mainOrdId;
    dynamic aggregatorRef;
    dynamic waiterId;
   dynamic ordDuration;
    bool? isQuickBill;
    List<DataOrderInfo>? orderInfo;
    dynamic v;

    Data({
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
        this.pkgCharge,
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
        this.isQuickBill,
        this.orderInfo,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"]?? json['data']?['_id'],
        transNo: json["transNo"],
        name: json["name"],
        shiftId: json["shiftId"],
        branchId: json["branchId"],
        tableId: json["tableId"] == null ? [] : List<String>.from(json["tableId"]!.map((x) => x)),
        chairId: json["chairId"] == null ? [] : List<String>.from(json["chairId"]!.map((x) => x)),
        empId: json["empId"],
        orderDate: json["orderDate"],
        cusId: json["cusId"],
        isReturn: json["isReturn"],
        subTotal: json["subTotal"],
        discountAmt: json["discountAmt"],
        pkgCharge: json["pkgCharge"],
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
        isQuickBill: json["isQuickBill"],
        orderInfo: json["orderInfo"] == null ? [] : List<DataOrderInfo>.from(json["orderInfo"]!.map((x) => DataOrderInfo.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "transNo": transNo,
        "name": name,
        "shiftId": shiftId,
        "branchId": branchId,
        "tableId": tableId == null ? [] : List<dynamic>.from(tableId!.map((x) => x)),
        "chairId": chairId == null ? [] : List<dynamic>.from(chairId!.map((x) => x)),
        "empId": empId,
        "orderDate": orderDate,
        "cusId": cusId,
        "isReturn": isReturn,
        "subTotal": subTotal,
        "discountAmt": discountAmt,
        "pkgCharge": pkgCharge,
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
        "isQuickBill": isQuickBill,
        "orderInfo": orderInfo == null ? [] : List<dynamic>.from(orderInfo!.map((x) => x.toJson())),
        "__v": v,
    };
}

class DataOrderInfo {
    dynamic itemType;
    dynamic productId;
    dynamic desccription;
    dynamic customerNote;
   dynamic qty;
   dynamic uom;
    dynamic unitPrice;
    List<dynamic>? taxes;
    dynamic subTotalWoTax;
    dynamic lineTotal;
    dynamic kotOrderId;
    dynamic kotStatus;
    dynamic includedPrice;
    dynamic id;

    DataOrderInfo({
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

    factory DataOrderInfo.fromJson(Map<String, dynamic> json) => DataOrderInfo(
        itemType: json["itemType"],
        productId: json["productId"],
        desccription: json["desccription"],
        customerNote: json["customerNote"],
        qty: json["qty"],
        uom: json["uom"],
        unitPrice: json["unitPrice"],
        taxes: json["taxes"] == null ? [] : List<dynamic>.from(json["taxes"]!.map((x) => x)),
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
        "taxes": taxes == null ? [] : List<dynamic>.from(taxes!.map((x) => x)),
        "subTotalWoTax": subTotalWoTax,
        "lineTotal": lineTotal,
        "kotOrderId": kotOrderId,
        "kotStatus": kotStatus,
        "includedPrice": includedPrice,
        "_id": id,
    };
}

class KotData {
    dynamic id;
    dynamic transNo;
    dynamic name;
    dynamic orderId;
   dynamic ordName;
    dynamic status;
    dynamic ordType;
    dynamic waiterName;
    List<String>? tables;
    List<KotDataOrderInfo>? orderInfo;
    DateTime? orderDate;

    KotData({
        this.id,
        this.transNo,
        this.name,
        this.orderId,
        this.ordName,
        this.status,
        this.ordType,
        this.waiterName,
        this.tables,
        this.orderInfo,
        this.orderDate,
    });

    factory KotData.fromJson(Map<String, dynamic> json) => KotData(
        id: json["_id"],
        transNo: json["transNo"],
        name: json["name"],
        orderId: json["orderId"],
        ordName: json["ordName"],
        status: json["status"],
        ordType: json["ordType"],
        waiterName: json["waiterName"],
        tables: json["tables"] == null ? [] : List<String>.from(json["tables"]!.map((x) => x)),
        orderInfo: json["orderInfo"] == null ? [] : List<KotDataOrderInfo>.from(json["orderInfo"]!.map((x) => KotDataOrderInfo.fromJson(x))),
        orderDate: json["orderDate"] == null ? null : DateTime.parse(json["orderDate"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "transNo": transNo,
        "name": name,
        "orderId": orderId,
        "ordName": ordName,
        "status": status,
        "ordType": ordType,
        "waiterName": waiterName,
        "tables": tables == null ? [] : List<dynamic>.from(tables!.map((x) => x)),
        "orderInfo": orderInfo == null ? [] : List<dynamic>.from(orderInfo!.map((x) => x.toJson())),
        "orderDate": orderDate?.toIso8601String(),
    };
}

class KotDataOrderInfo {
    dynamic itemType;
    dynamic productId;
    dynamic qty;
    dynamic uom;
    dynamic status;
    dynamic productName;
    dynamic customerNote;
    dynamic id;

    KotDataOrderInfo({
        this.itemType,
        this.productId,
        this.qty,
        this.uom,
        this.status,
        this.productName,
        this.customerNote,
        this.id,
    });

    factory KotDataOrderInfo.fromJson(Map<String, dynamic> json) => KotDataOrderInfo(
        itemType: json["itemType"],
        productId: json["productId"],
        qty: json["qty"],
        uom: json["uom"],
        status: json["status"],
        productName: json["productName"],
        customerNote: json["customerNote"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "itemType": itemType,
        "productId": productId,
        "qty": qty,
        "uom": uom,
        "status": status,
        "productName": productName,
        "customerNote": customerNote,
        "_id": id,
    };
}
