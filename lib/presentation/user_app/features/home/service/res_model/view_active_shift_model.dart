// To parse this JSON data, do
//
//     final viewActiveShiftResModel = viewActiveShiftResModelFromJson(jsonString);

import 'dart:convert';

ViewActiveShiftResModel viewActiveShiftResModelFromJson(String str) => ViewActiveShiftResModel.fromJson(json.decode(str));

String viewActiveShiftResModelToJson(ViewActiveShiftResModel data) => json.encode(data.toJson());

class ViewActiveShiftResModel {
    dynamic id;
    dynamic startDate;
    dynamic startTime;
    dynamic branchId;
    dynamic status;
    dynamic endDate;
    dynamic endTime;
    dynamic shiftId;
    dynamic empId;
    dynamic startedBy;
    dynamic endedBy;
    dynamic v;
    dynamic starttime;
    dynamic timer;
    bool? isDenomination;

    ViewActiveShiftResModel({
        this.id,
        this.startDate,
        this.startTime,
        this.branchId,
        this.status,
        this.endDate,
        this.endTime,
        this.shiftId,
        this.empId,
        this.startedBy,
        this.endedBy,
        this.v,
        this.starttime,
        this.timer,
        this.isDenomination,
    });

    factory ViewActiveShiftResModel.fromJson(Map<String, dynamic> json) => ViewActiveShiftResModel(
        id: json["_id"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        startTime: json["startTime"],
        branchId: json["branchId"],
        status: json["status"],
        endDate: json["endDate"],
        endTime: json["endTime"],
        shiftId: json["shiftId"],
        empId: json["empId"],
        startedBy: json["startedBy"],
        endedBy: json["endedBy"],
        v: json["__v"],
        starttime: json["STARTTIME"],
        timer: json["timer"],
        isDenomination: json["isDenomination"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "startDate": startDate?.toIso8601String(),
        "startTime": startTime,
        "branchId": branchId,
        "status": status,
        "endDate": endDate,
        "endTime": endTime,
        "shiftId": shiftId,
        "empId": empId,
        "startedBy": startedBy,
        "endedBy": endedBy,
        "__v": v,
        "STARTTIME": starttime,
        "timer": timer,
        "isDenomination": isDenomination,
    };
}
