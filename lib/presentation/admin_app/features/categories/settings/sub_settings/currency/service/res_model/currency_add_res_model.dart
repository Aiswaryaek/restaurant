// To parse this JSON data, do
//
//     final currencyResModel = currencyResModelFromJson(jsonString);

import 'dart:convert';

CurrencyResModel currencyResModelFromJson(String str) => CurrencyResModel.fromJson(json.decode(str));

String currencyResModelToJson(CurrencyResModel data) => json.encode(data.toJson());

class CurrencyResModel {
    String? currencyCode;
    String? name;
    String? symbol;
    String? currencyUnit;
    String? currencySubUnit;
    num? usdperunit;
    num? lastUpdatedDate;
    num? currencyRate;
    bool? symbolPosition;
    bool? status;
    String? country;
    String? id;
    num? v;

    CurrencyResModel({
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
        this.id,
        this.v,
    });

    factory CurrencyResModel.fromJson(Map<String, dynamic> json) => CurrencyResModel(
        currencyCode: json["currencyCode"],
        name: json["name"],
        symbol: json["symbol"],
        currencyUnit: json["currencyUnit"],
        currencySubUnit: json["currencySubUnit"],
        usdperunit: json["usdperunit"],
        lastUpdatedDate: json["lastUpdatedDate"],
        currencyRate: json["currencyRate"],
        symbolPosition: json["symbolPosition"],
        status: json["status"],
        country: json["country"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "currencyCode": currencyCode,
        "name": name,
        "symbol": symbol,
        "currencyUnit": currencyUnit,
        "currencySubUnit": currencySubUnit,
        "usdperunit": usdperunit,
        "lastUpdatedDate": lastUpdatedDate,
        "currencyRate": currencyRate,
        "symbolPosition": symbolPosition,
        "status": status,
        "country": country,
        "_id": id,
        "__v": v,
    };
}
