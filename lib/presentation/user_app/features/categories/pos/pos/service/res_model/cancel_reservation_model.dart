// To parse this JSON data, do
//
//     final cancelReservationResModel = cancelReservationResModelFromJson(jsonString);

import 'dart:convert';

CancelReservationResModel cancelReservationResModelFromJson(String str) => CancelReservationResModel.fromJson(json.decode(str));

String cancelReservationResModelToJson(CancelReservationResModel data) => json.encode(data.toJson());

class CancelReservationResModel {
    String? id;
    int? transNo;
    String? name;
    String? cusId;
    int? mobileNo;
    int? date;
    String? time;
    int? totalPerson;
    String? note;
    String? floorId;
    List<String>? tableId;
    String? branchId;
    String? status;
    int? v;

    CancelReservationResModel({
        this.id,
        this.transNo,
        this.name,
        this.cusId,
        this.mobileNo,
        this.date,
        this.time,
        this.totalPerson,
        this.note,
        this.floorId,
        this.tableId,
        this.branchId,
        this.status,
        this.v,
    });

    factory CancelReservationResModel.fromJson(Map<String, dynamic> json) => CancelReservationResModel(
        id: json["_id"],
        transNo: json["transNo"],
        name: json["name"],
        cusId: json["cusId"],
        mobileNo: json["mobileNo"],
        date: json["date"],
        time: json["time"],
        totalPerson: json["totalPerson"],
        note: json["note"],
        floorId: json["floorId"],
        tableId: json["tableId"] == null ? [] : List<String>.from(json["tableId"]!.map((x) => x)),
        branchId: json["branchId"],
        status: json["status"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "transNo": transNo,
        "name": name,
        "cusId": cusId,
        "mobileNo": mobileNo,
        "date": date,
        "time": time,
        "totalPerson": totalPerson,
        "note": note,
        "floorId": floorId,
        "tableId": tableId == null ? [] : List<dynamic>.from(tableId!.map((x) => x)),
        "branchId": branchId,
        "status": status,
        "__v": v,
    };
}
