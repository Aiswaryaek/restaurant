// To parse this JSON data, do
//
//     final viewCustomerWalletResModel = viewCustomerWalletResModelFromJson(jsonString);

import 'dart:convert';

ViewCustomerWalletResModel viewCustomerWalletResModelFromJson(String str) => ViewCustomerWalletResModel.fromJson(json.decode(str));

String viewCustomerWalletResModelToJson(ViewCustomerWalletResModel data) => json.encode(data.toJson());

class ViewCustomerWalletResModel {
    int? walletBalance;
    String? customerName;

    ViewCustomerWalletResModel({
        this.walletBalance,
        this.customerName,
    });

    factory ViewCustomerWalletResModel.fromJson(Map<String, dynamic> json) => ViewCustomerWalletResModel(
        walletBalance: json["walletBalance"],
        customerName: json["customerName"],
    );

    Map<String, dynamic> toJson() => {
        "walletBalance": walletBalance,
        "customerName": customerName,
    };
}
