// To parse this JSON data, do
//
//     final viewSpecialOfferResModel = viewSpecialOfferResModelFromJson(jsonString);

import 'dart:convert';

List<ViewSpecialOfferResModel> viewSpecialOfferResModelFromJson(String str) =>
    List<ViewSpecialOfferResModel>.from(
        json.decode(str).map((x) => ViewSpecialOfferResModel.fromJson(x)));

String viewSpecialOfferResModelToJson(List<ViewSpecialOfferResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

///Mapping List of data into empty list
class ViewPOSSpecialOfferResModel {
  List<ViewSpecialOfferResModel> viewSpecialOffersPosList;

  ViewPOSSpecialOfferResModel({required this.viewSpecialOffersPosList});

  factory ViewPOSSpecialOfferResModel.fromJson(List<dynamic> parsedJson) {
    List<ViewSpecialOfferResModel> viewSpecialOffersPosList = parsedJson
        .map((json) => ViewSpecialOfferResModel.fromJson(json))
        .toList();
    return ViewPOSSpecialOfferResModel(
        viewSpecialOffersPosList: viewSpecialOffersPosList);
  }
}

class ViewSpecialOfferResModel {
  String? id;
  String? name;
  bool? status;

  ViewSpecialOfferResModel({
    this.id,
    this.name,
    this.status,
  });

  factory ViewSpecialOfferResModel.fromJson(Map<String, dynamic> json) =>
      ViewSpecialOfferResModel(
        id: json["_id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "status": status,
      };
}
