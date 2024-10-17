

import 'dart:convert';

List<CurrencyViewResModel> currencyViewResModelFromJson(String str) => List<CurrencyViewResModel>.from(json.decode(str).map((x) => CurrencyViewResModel.fromJson(x)));

String currencyViewResModelToJson(List<CurrencyViewResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class CurrencyListResModel {
  List<CurrencyViewResModel> currencies;

  CurrencyListResModel({required this.currencies});

  factory CurrencyListResModel.fromJson(List<dynamic> parsedJson) {
    List<CurrencyViewResModel> currencies = parsedJson.map((json) => CurrencyViewResModel.fromJson(json)).toList();
    return CurrencyListResModel(currencies: currencies);
  }
}






class CurrencyViewResModel {
    String? id;
    String? currencyCode;
    String? name;
    String? symbol;
    String? currencyUnit;
    String? currencySubUnit;
    num? usdperunit;
    DateTime? lastUpdatedDate;
    num? currencyRate;
    bool? symbolPosition;
    bool? status;
    String? country;
    num? v;

    CurrencyViewResModel({
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

    factory CurrencyViewResModel.fromJson(Map<String, dynamic> json) => CurrencyViewResModel(
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



