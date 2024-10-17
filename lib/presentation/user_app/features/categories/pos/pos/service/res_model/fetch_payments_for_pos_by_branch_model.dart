// To parse this JSON data, do
//
//     final fetchPaymentsForPosByBranchResModel = fetchPaymentsForPosByBranchResModelFromJson(jsonString);

import 'dart:convert';

List<FetchPaymentsForPosByBranchResModel> fetchPaymentsForPosByBranchResModelFromJson(String str) => List<FetchPaymentsForPosByBranchResModel>.from(json.decode(str).map((x) => FetchPaymentsForPosByBranchResModel.fromJson(x)));

String fetchPaymentsForPosByBranchResModelToJson(List<FetchPaymentsForPosByBranchResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
///Mapping List of data into empty list
class AllPaymentsForPosByBranchListResModel {
  List<FetchPaymentsForPosByBranchResModel> allPaymentsForPosView;

  AllPaymentsForPosByBranchListResModel({required this.allPaymentsForPosView});

  factory AllPaymentsForPosByBranchListResModel.fromJson(List<dynamic> parsedJson) {
    List<FetchPaymentsForPosByBranchResModel> allPaymentsForPosView = parsedJson
        .map((json) => FetchPaymentsForPosByBranchResModel.fromJson(json))
        .toList();
    return AllPaymentsForPosByBranchListResModel(allPaymentsForPosView: allPaymentsForPosView);
  }
}
///SingleList
class FetchPaymentsForPosByBranchResModel {
    dynamic type;
    dynamic journalId;
    dynamic id;
    dynamic journalName;

    FetchPaymentsForPosByBranchResModel({
        this.type,
        this.journalId,
        this.id,
        this.journalName,
    });

    factory FetchPaymentsForPosByBranchResModel.fromJson(Map<String, dynamic> json) => FetchPaymentsForPosByBranchResModel(
        type: json["type"],
        journalId: json["journalId"],
        id: json["_id"],
        journalName: json["journalName"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "journalId": journalId,
        "_id": id,
        "journalName": journalName,
    };
}
