// To parse this JSON data, do
//
//     final endManualShiftResModel = endManualShiftResModelFromJson(jsonString);

import 'dart:convert';

EndManualShiftResModel endManualShiftResModelFromJson(String str) => EndManualShiftResModel.fromJson(json.decode(str));

String endManualShiftResModelToJson(EndManualShiftResModel data) => json.encode(data.toJson());

class EndManualShiftResModel {
    String? id;
    int? shiftId;
    int? startDate;
    int? endDate;
    int? startTime;
    int? endTime;
    String? branchId;
    String? status;
    String? empId;
    String? startedBy;
    String? endedBy;
    int? v;

    EndManualShiftResModel({
        this.id,
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
        this.v,
    });

    factory EndManualShiftResModel.fromJson(Map<String, dynamic> json) => EndManualShiftResModel(
        id: json["_id"],
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
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
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
        "__v": v,
    };
}
