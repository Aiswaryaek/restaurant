// To parse this JSON data, do
//
//     final viewFloorResModel = viewFloorResModelFromJson(jsonString);

import 'dart:convert';

List<ViewFloorResModel> viewFloorResModelFromJson(String str) => List<ViewFloorResModel>.from(json.decode(str).map((x) => ViewFloorResModel.fromJson(x)));

String viewFloorResModelToJson(List<ViewFloorResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

///Mapping List of data into empty list
class AllFloorResModel {
  List<ViewFloorResModel> allFloorView;

  AllFloorResModel({required this.allFloorView});

  factory AllFloorResModel.fromJson(List<dynamic> parsedJson) {
    List<ViewFloorResModel> allFloorView = parsedJson
        .map((json) => ViewFloorResModel.fromJson(json))
        .toList();
    return AllFloorResModel(allFloorView: allFloorView);
  }
}
///SingleList
class ViewFloorResModel {
    String? id;
    dynamic branchId;
    String? nameOfFloor;
    String? color;
    bool? seatSelection;
    int? v;

    ViewFloorResModel({
        this.id,
        this.branchId,
        this.nameOfFloor,
        this.color,
        this.seatSelection,
        this.v,
    });

    factory ViewFloorResModel.fromJson(Map<String, dynamic> json) => ViewFloorResModel(
        id: json["_id"],
        branchId: json["branchId"],
        nameOfFloor: json["nameOfFloor"],
        color: json["color"],
        seatSelection: json["seatSelection"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "branchId": branchId,
        "nameOfFloor": nameOfFloor,
        "color": color,
        "seatSelection": seatSelection,
        "__v": v,
    };
}


