// To parse this JSON data, do
//
//     final addPosOrderFromFloorPlanResModel = addPosOrderFromFloorPlanResModelFromJson(jsonString);

import 'dart:convert';

AddPosOrderFromFloorPlanResModel addPosOrderFromFloorPlanResModelFromJson(String str) => AddPosOrderFromFloorPlanResModel.fromJson(json.decode(str));

String addPosOrderFromFloorPlanResModelToJson(AddPosOrderFromFloorPlanResModel data) => json.encode(data.toJson());

class AddPosOrderFromFloorPlanResModel {
    int? transNo;
    String? name;
    String? shiftId;
    String? branchId;
    List<String>? tableId;
    List<String>? chairId;
    String? empId;
    int? orderDate;
    String? cusId;
    bool? isReturn;
    int? subTotal;
    int? discountAmt;
    int? totalExclusive;
    int? totalInclusive;
    int? amtTotal;
    dynamic deliveryNoteid;
    String? status;
    int? amountDue;
    bool? paymentStatus;
    String? ordType;
    dynamic aggregatorId;
    int? deliveryCharge;
    dynamic mainOrdId;
    dynamic aggregatorRef;
    dynamic waiterId;
    String? ordDuration;
    String? id;
    List<dynamic>? orderInfo;
    int? v;

    AddPosOrderFromFloorPlanResModel({
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
        this.id,
        this.orderInfo,
        this.v,
    });

    factory AddPosOrderFromFloorPlanResModel.fromJson(Map<String, dynamic> json) => AddPosOrderFromFloorPlanResModel(
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
        id: json["_id"],
        orderInfo: json["orderInfo"] == null ? [] : List<dynamic>.from(json["orderInfo"]!.map((x) => x)),
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
        "orderInfo": orderInfo == null ? [] : List<dynamic>.from(orderInfo!.map((x) => x)),
        "__v": v,
    };
}
