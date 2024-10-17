

import 'dart:convert';

List<ViewProductsForPosModel> viewProductsForPosModelFromJson(String str) => List<ViewProductsForPosModel>.from(json.decode(str).map((x) => ViewProductsForPosModel.fromJson(x)));

String viewProductsForPosModelToJson(List<ViewProductsForPosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

///Mapping List of data into empty list
class ViewProductsPosListResModel {
  List<ViewProductsForPosModel> viewProductsPosList;

  ViewProductsPosListResModel({required this.viewProductsPosList});

  factory ViewProductsPosListResModel.fromJson(List<dynamic> parsedJson) {
    List<ViewProductsForPosModel> viewProductsPosList = parsedJson
        .map((json) => ViewProductsForPosModel.fromJson(json))
        .toList();
    return ViewProductsPosListResModel(viewProductsPosList: viewProductsPosList);
  }
}

class ViewProductsForPosModel {
  dynamic id;
  String? mainCatgeoryId;
  String? poscat;
  dynamic prodType;
  int? barcode;
  dynamic uom;
  dynamic purchaseuom;
  double? cost;
  dynamic salesPrice;
  List<dynamic>? attribute;
  String? productName;
  List<String>? imageUrl;
  dynamic purchaseUomName;
  dynamic uomName;
  List<Tax>? taxes;
  dynamic includedPrice;
  int? relevanceScore;

  ViewProductsForPosModel({
    this.id,
    this.mainCatgeoryId,
    this.poscat,
    this.prodType,
    this.barcode,
    this.uom,
    this.purchaseuom,
    this.cost,
    this.salesPrice,
    this.attribute,
    this.productName,
    this.imageUrl,
    this.purchaseUomName,
    this.uomName,
    this.taxes,
    this.includedPrice,
    this.relevanceScore,
  });

  factory ViewProductsForPosModel.fromJson(Map<String, dynamic> json) => ViewProductsForPosModel(
    id: json["_id"],
    mainCatgeoryId: json["mainCatgeoryId"],
    poscat: json["poscat"],
    prodType: json["prodType"],
    barcode: json["barcode"],
    uom: json["uom"],
    purchaseuom: json["purchaseuom"],
    cost: json["cost"]?.toDouble(),
    salesPrice: json["salesPrice"],
    attribute: json["attribute"] == null ? [] : List<dynamic>.from(json["attribute"]!.map((x) => x)),
    productName: json["productName"],
    imageUrl: json["imageUrl"] == null ? [] : List<String>.from(json["imageUrl"]!.map((x) => x)),
    purchaseUomName: json["purchaseUomName"],
    uomName: json["uomName"],
    taxes: json["taxes"] == null ? [] : List<Tax>.from(json["taxes"]!.map((x) => Tax.fromJson(x))),
    includedPrice: json["includedPrice"],
    relevanceScore: json["relevanceScore"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "mainCatgeoryId": mainCatgeoryId,
    "poscat": poscat,
    "prodType": prodType,
    "barcode": barcode,
    "uom": uom,
    "purchaseuom":purchaseuom,
    "cost": cost,
    "salesPrice": salesPrice,
    "attribute": attribute == null ? [] : List<dynamic>.from(attribute!.map((x) => x)),
    "productName": productName,
    "imageUrl": imageUrl == null ? [] : List<dynamic>.from(imageUrl!.map((x) => x)),
    "purchaseUomName": purchaseUomName,
    "uomName": uomName,
    "taxes": taxes == null ? [] : List<dynamic>.from(taxes!.map((x) => x.toJson())),
    "includedPrice": includedPrice,
    "relevanceScore": relevanceScore,
  };
}


class Tax {
  String? id;
  bool? includedPrice;
  double? amount;
  String? accountId;
  String? taxName;
  String? taxType;

  Tax({
    this.id,
    this.includedPrice,
    this.amount,
    this.accountId,
    this.taxName,
    this.taxType,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    id: json["_id"],
    includedPrice: json["includedPrice"],
    amount: json["amount"]?.toDouble(),
    accountId: json["accountId"],
    taxName: json["taxName"],
    taxType: json["taxType"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "includedPrice": includedPrice,
    "amount": amount,
    "accountId": accountId,
    "taxName": taxName,
    "taxType": taxType,
  };
}
class Cart {
  dynamic id;
  dynamic qty;

  Cart({this.id, this.qty});
  Cart.fromMap(Map map)        // This Function helps to convert our Map into our User Object
      : this.id = map["id"],
        this.qty = map["qty"];

  Map toMap() {               // This Function helps to convert our User Object into a Map.
    return {
      "id": this.id,
      "qty": this.qty,
    };
  }
}
