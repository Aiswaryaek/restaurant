// To parse this JSON data, do
//
//     final aggregatorsListResModel = aggregatorsListResModelFromJson(jsonString);

import 'dart:convert';

List<AggregatorsListResModel> aggregatorsListResModelFromJson(String str) => List<AggregatorsListResModel>.from(json.decode(str).map((x) => AggregatorsListResModel.fromJson(x)));

String aggregatorsListResModelToJson(List<AggregatorsListResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

///Mapping List of data into empty list
class AllAggregatorsListResModel {
  List<AggregatorsListResModel> allAggregatorsView;

  AllAggregatorsListResModel({required this.allAggregatorsView});

  factory AllAggregatorsListResModel.fromJson(List<dynamic> parsedJson) {
    List<AggregatorsListResModel> allAggregatorsView = parsedJson
        .map((json) => AggregatorsListResModel.fromJson(json))
        .toList();
    return AllAggregatorsListResModel(allAggregatorsView: allAggregatorsView);
  }
}
///SingleList
class AggregatorsListResModel {
    String? id;
    String? name;
    String? branchId;
    String? commType;
    double? amount;
    int? v;
    String? empId;
    bool? isSelf;
    String? code;
    String? branchName;
    bool? isDefault;

    AggregatorsListResModel({
        this.id,
        this.name,
        this.branchId,
        this.commType,
        this.amount,
        this.v,
        this.empId,
        this.isSelf,
        this.code,
        this.branchName,
        this.isDefault,
    });

    factory AggregatorsListResModel.fromJson(Map<String, dynamic> json) => AggregatorsListResModel(
        id: json["_id"],
        name: json["name"],
        branchId: json["branchId"],
        commType: json["commType"],
        amount: json["amount"]?.toDouble(),
        v: json["__v"],
        empId: json["empId"],
        isSelf: json["isSelf"],
        code: json["code"],
        branchName: json["branchName"],
        isDefault: json["isDefault"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "branchId": branchId,
        "commType": commType,
        "amount": amount,
        "__v": v,
        "empId": empId,
        "isSelf": isSelf,
        "code": code,
        "branchName": branchName,
        "isDefault": isDefault,
    };
}
