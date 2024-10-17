import 'dart:convert';

List<AllCategoriesViewResModel> allCategoriesViewResModelFromJson(String str) =>
    List<AllCategoriesViewResModel>.from(
        json.decode(str).map((x) => AllCategoriesViewResModel.fromJson(x)));

String allCategoriesViewResModelToJson(List<AllCategoriesViewResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

///Mapping List of data into empty list
class AllCategoriesListResModel {
  List<AllCategoriesViewResModel> allCategoriesView;

  AllCategoriesListResModel({required this.allCategoriesView});

  factory AllCategoriesListResModel.fromJson(List<dynamic> parsedJson) {
    List<AllCategoriesViewResModel> allCategoriesView = parsedJson
        .map((json) => AllCategoriesViewResModel.fromJson(json))
        .toList();
    return AllCategoriesListResModel(allCategoriesView: allCategoriesView);
  }
}
///SingleList
class AllCategoriesViewResModel {
  String? branchId;
  String? id;
  String? categoryName;
  dynamic salesJournal;
  dynamic salesExpenseAccount;
  String? salesIncome;
  bool? status;
  bool? type;
  String? imageUrl;
  int? v;
  List<String>? branchIdList;

  AllCategoriesViewResModel({
    this.branchId,
    this.id,
    this.categoryName,
    this.salesJournal,
    this.salesExpenseAccount,
    this.salesIncome,
    this.status,
    this.type,
    this.imageUrl,
    this.v,
    this.branchIdList,
  });

  factory AllCategoriesViewResModel.fromJson(Map<String, dynamic> json) => AllCategoriesViewResModel(
    branchId: json["branchId"],
    id: json["_id"],
    categoryName: json["categoryName"],
    salesJournal: json["salesJournal"],
    salesExpenseAccount: json["salesExpenseAccount"],
    salesIncome: json["salesIncome"],
    status: json["status"],
    type: json["type"],
    imageUrl: json["imageUrl"],
    v: json["__v"],
    branchIdList: json["branchIdList"] == null ? [] : List<String>.from(json["branchIdList"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "branchId": branchId,
    "_id": id,
    "categoryName": categoryName,
    "salesJournal": salesJournal,
    "salesExpenseAccount": salesExpenseAccount,
    "salesIncome": salesIncome,
    "status": status,
    "type": type,
    "imageUrl": imageUrl,
    "__v": v,
    "branchIdList": branchIdList == null ? [] : List<dynamic>.from(branchIdList!.map((x) => x)),
  };}
