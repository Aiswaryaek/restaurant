// To parse this JSON data, do
//
//     final editReservationResModel = editReservationResModelFromJson(jsonString);

import 'dart:convert';

EditReservationResModel editReservationResModelFromJson(String str) => EditReservationResModel.fromJson(json.decode(str));

String editReservationResModelToJson(EditReservationResModel data) => json.encode(data.toJson());

class EditReservationResModel {
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
    List<dynamic>? tableId;
    String? branchId;
    String? status;
    int? v;

    EditReservationResModel({
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

    factory EditReservationResModel.fromJson(Map<String, dynamic> json) => EditReservationResModel(
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
        tableId: json["tableId"] == null ? [] : List<dynamic>.from(json["tableId"]!.map((x) => x)),
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
