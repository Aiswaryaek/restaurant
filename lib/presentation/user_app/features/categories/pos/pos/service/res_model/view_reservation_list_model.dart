// To parse this JSON data, do
//
//     final viewReservationListResModel = viewReservationListResModelFromJson(jsonString);

import 'dart:convert';

ViewReservationListResModel viewReservationListResModelFromJson(String str) => ViewReservationListResModel.fromJson(json.decode(str));

String viewReservationListResModelToJson(ViewReservationListResModel data) => json.encode(data.toJson());

class ViewReservationListResModel {
    int? pendingCount;
    List<ListElement>? list;

    ViewReservationListResModel({
        this.pendingCount,
        this.list,
    });

    factory ViewReservationListResModel.fromJson(Map<String, dynamic> json) => ViewReservationListResModel(
        pendingCount: json["pendingCount"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pendingCount": pendingCount,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    String? id;
    int? transNo;
    String? name;
    String? cusId;
    int? mobileNo;
    dynamic date;
    String? time;
    int? totalPerson;
    String? note;
    String? floorId;
    List<String>? tableId;
    String? branchId;
    String? status;
    List<String>? tableNames;
    String? customerNameL;

    ListElement({
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
        this.tableNames,
        this.customerNameL,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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
        tableNames: json["tableNames"] == null ? [] : List<String>.from(json["tableNames"]!.map((x) => x)),
        customerNameL: json["customerNameL"],
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
        "tableNames": tableNames == null ? [] : List<dynamic>.from(tableNames!.map((x) => x)),
        "customerNameL": customerNameL,
    };
}
