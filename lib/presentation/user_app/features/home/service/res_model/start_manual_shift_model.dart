// To parse this JSON data, do
//
//     final startManualShiftResModel = startManualShiftResModelFromJson(jsonString);

import 'dart:convert';

StartManualShiftResModel startManualShiftResModelFromJson(String str) => StartManualShiftResModel.fromJson(json.decode(str));

String startManualShiftResModelToJson(StartManualShiftResModel data) => json.encode(data.toJson());

class StartManualShiftResModel {
    int? shiftId;
    int? startDate;
    dynamic endDate;
    int? startTime;
    dynamic endTime;
    String? branchId;
    String? status;
    String? empId;
    String? startedBy;
    dynamic endedBy;
    String? id;
    int? v;

    StartManualShiftResModel({
        this.shiftId,
        this.startDate,
        this.endDate,
        this.startTime,
        this.endTime,
        this.branchId,
        this.status,
        this.empId,
        this.startedBy,
        this.endedBy,
        this.id,
        this.v,
    });

    factory StartManualShiftResModel.fromJson(Map<String, dynamic> json) => StartManualShiftResModel(
        shiftId: json["shiftId"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        branchId: json["branchId"],
        status: json["status"],
        empId: json["empId"],
        startedBy: json["startedBy"],
        endedBy: json["endedBy"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "shiftId": shiftId,
        "startDate": startDate,
        "endDate": endDate,
        "startTime": startTime,
        "endTime": endTime,
        "branchId": branchId,
        "status": status,
        "empId": empId,
        "startedBy": startedBy,
        "endedBy": endedBy,
        "_id": id,
        "__v": v,
    };
}
