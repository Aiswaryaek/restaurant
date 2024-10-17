// To parse this JSON data, do
//
//     final categoriesViewResModel = categoriesViewResModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesViewResModel> categoriesViewResModelFromJson(String str) =>
    List<CategoriesViewResModel>.from(
        json.decode(str).map((x) => CategoriesViewResModel.fromJson(x)));

String categoriesViewResModelToJson(List<CategoriesViewResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

///Mapping List of data into empty list
class CategoriesListResModel {
  List<CategoriesViewResModel> categoriesView;

  CategoriesListResModel({required this.categoriesView});

  factory CategoriesListResModel.fromJson(List<dynamic> parsedJson) {
    List<CategoriesViewResModel> categoriesView = parsedJson
        .map((json) => CategoriesViewResModel.fromJson(json))
        .toList();
    return CategoriesListResModel(categoriesView: categoriesView);
  }
}

class CategoriesViewResModel {
  String? id;
  String? catId;
  String? name;
  String? parentName;
  List<String>? parentCategories;
  int? v;
  String? catname;

  CategoriesViewResModel({
    this.id,
    this.catId,
    this.name,
    this.parentName,
    this.parentCategories,
    this.v,
    this.catname,
  });

  factory CategoriesViewResModel.fromJson(Map<String, dynamic> json) =>
      CategoriesViewResModel(
        id: json["_id"],
        catId: json["catId"],
        name: json["name"],
        parentName: json["parentName"],
        parentCategories: json["parentCategories"] == null
            ? []
            : List<String>.from(json["parentCategories"]!.map((x) => x)),
        v: json["__v"],
        catname: json["CATNAME"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "catId": catId,
        "name": name,
        "parentName": parentName,
        "parentCategories": parentCategories == null
            ? []
            : List<dynamic>.from(parentCategories!.map((x) => x)),
        "__v": v,
        "CATNAME": catname,
      };
}
