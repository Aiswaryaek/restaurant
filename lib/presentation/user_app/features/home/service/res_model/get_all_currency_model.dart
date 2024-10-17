// To parse this JSON data, do
//
//     final viewCurrencyListResModel = viewCurrencyListResModelFromJson(jsonString);

import 'dart:convert';

List<ViewCurrencyListResModel> viewCurrencyListResModelFromJson(String str) => List<ViewCurrencyListResModel>.from(json.decode(str).map((x) => ViewCurrencyListResModel.fromJson(x)));

String viewCurrencyListResModelToJson(List<ViewCurrencyListResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


///Mapping List of data into empty list
class AllCurrencyListResModel {
  List<ViewCurrencyListResModel> allCurrencyView;

  AllCurrencyListResModel({required this.allCurrencyView});

  factory AllCurrencyListResModel.fromJson(List<dynamic> parsedJson) {
    List<ViewCurrencyListResModel> allCurrencyView = parsedJson
        .map((json) => ViewCurrencyListResModel.fromJson(json))
        .toList();
    return AllCurrencyListResModel(allCurrencyView: allCurrencyView);
  }
}
///SingleList
class ViewCurrencyListResModel {
    String? id;
    String? currencyCode;
    String? name;
    String? symbol;
    String? currencyUnit;
    String? currencySubUnit;
    double? usdperunit;
    DateTime? lastUpdatedDate;
    double? currencyRate;
    bool? symbolPosition;
    bool? status;
    String? country;
    int? v;

    ViewCurrencyListResModel({
        this.id,
        this.currencyCode,
        this.name,
        this.symbol,
        this.currencyUnit,
        this.currencySubUnit,
        this.usdperunit,
        this.lastUpdatedDate,
        this.currencyRate,
        this.symbolPosition,
        this.status,
        this.country,
        this.v,
    });

    factory ViewCurrencyListResModel.fromJson(Map<String, dynamic> json) => ViewCurrencyListResModel(
        id: json["_id"],
        currencyCode: json["currencyCode"],
        name: json["name"],
        symbol: json["symbol"],
        currencyUnit: json["currencyUnit"],
        currencySubUnit: json["currencySubUnit"],
        usdperunit: json["usdperunit"]?.toDouble(),
        lastUpdatedDate: json["lastUpdatedDate"] == null ? null : DateTime.parse(json["lastUpdatedDate"]),
        currencyRate: json["currencyRate"]?.toDouble(),
        symbolPosition: json["symbolPosition"],
        status: json["status"],
        country: json["country"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "currencyCode": currencyCode,
        "name": name,
        "symbol": symbol,
        "currencyUnit": currencyUnit,
        "currencySubUnit": currencySubUnit,
        "usdperunit": usdperunit,
        "lastUpdatedDate": "${lastUpdatedDate!.year.toString().padLeft(4, '0')}-${lastUpdatedDate!.month.toString().padLeft(2, '0')}-${lastUpdatedDate!.day.toString().padLeft(2, '0')}",
        "currencyRate": currencyRate,
        "symbolPosition": symbolPosition,
        "status": status,
        "country": country,
        "__v": v,
    };
}
