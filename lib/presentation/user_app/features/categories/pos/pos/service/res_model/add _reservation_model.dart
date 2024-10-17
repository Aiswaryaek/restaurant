// To parse this JSON data, do
//
//     final addReservationResModel = addReservationResModelFromJson(jsonString);

import 'dart:convert';

AddReservationResModel addReservationResModelFromJson(String str) => AddReservationResModel.fromJson(json.decode(str));

String addReservationResModelToJson(AddReservationResModel data) => json.encode(data.toJson());

class AddReservationResModel {
    int? transNo;
    String? name;
    String? cusId;
    int? mobileNo;
    int? date;
    String? time;
    int? totalPerson;
    String? note;
    String? floorId;
    List<dynamic>? tableId;
    String? branchId;
    String? status;
    String? id;
    int? v;

    AddReservationResModel({
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
        this.id,
        this.v,
    });

    factory AddReservationResModel.fromJson(Map<String, dynamic> json) => AddReservationResModel(
        transNo: json["transNo"],
        name: json["name"],
        cusId: json["cusId"],
        mobileNo: json["mobileNo"],
        date: json["date"],
        time: json["time"],
        totalPerson: json["totalPerson"],
        note: json["note"],
        floorId: json["floorId"],
        tableId: json["tableId"] == null ? [] : List<dynamic>.from(json["tableId"]!.map((x) => x)),
        branchId: json["branchId"],
        status: json["status"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
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
        "_id": id,
        "__v": v,
    };
}
