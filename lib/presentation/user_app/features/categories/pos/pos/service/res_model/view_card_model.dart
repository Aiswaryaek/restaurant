// To parse this JSON data, do
//
//     final viewCardResModel = viewCardResModelFromJson(jsonString);

import 'dart:convert';

List<ViewCardResModel> viewCardResModelFromJson(String str) => List<ViewCardResModel>.from(json.decode(str).map((x) => ViewCardResModel.fromJson(x)));

String viewCardResModelToJson(List<ViewCardResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

///Mapping List of data into empty list
class AllCardsListResModel {
  List<ViewCardResModel> allCardsView;

  AllCardsListResModel({required this.allCardsView});

  factory AllCardsListResModel.fromJson(List<dynamic> parsedJson) {
    List<ViewCardResModel> allCardsView = parsedJson
        .map((json) => ViewCardResModel.fromJson(json))
        .toList();
    return AllCardsListResModel(allCardsView: allCardsView);
  }
}
///SingleList
class ViewCardResModel {
    String? id;
    String? cardName;
    double? commission;
    bool? status;
    String? imageUrl;
    int? v;
    String? journalId;
    String? journalName;

    ViewCardResModel({
        this.id,
        this.cardName,
        this.commission,
        this.status,
        this.imageUrl,
        this.v,
        this.journalId,
        this.journalName,
    });

    factory ViewCardResModel.fromJson(Map<String, dynamic> json) => ViewCardResModel(
        id: json["_id"],
        cardName: json["cardName"],
        commission: json["commission"]?.toDouble(),
        status: json["status"],
        imageUrl: json["imageUrl"],
        v: json["__v"],
        journalId: json["journalId"],
        journalName: json["journalName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "cardName": cardName,
        "commission": commission,
        "status": status,
        "imageUrl": imageUrl,
        "__v": v,
        "journalId": journalId,
        "journalName": journalName,
    };
}
