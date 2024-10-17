// To parse this JSON data, do
//
//     final viewPosConfigurationResModel = viewPosConfigurationResModelFromJson(jsonString);

import 'dart:convert';

ViewPosConfigurationResModel viewPosConfigurationResModelFromJson(String str) => ViewPosConfigurationResModel.fromJson(json.decode(str));

String viewPosConfigurationResModelToJson(ViewPosConfigurationResModel data) => json.encode(data.toJson());

class ViewPosConfigurationResModel {
    PosAccounts? posAccounts;
    CashInOut? cashInOut;
    PettyCash? pettyCash;
    ActiveWallet? activeWallet;
    ActiveLoyalty? activeLoyalty;
    String? id;
    bool? posStatus;
    bool? cashInOutStatus;
    bool? pettyCashStatus;
    bool? activeWalletStatus;
    bool? activeLoyaltyStatus;
    bool? isNegativeStock;
    bool? deliveryCharge;
    int? deliveryAmt;
    bool? packagingCharge;
    int? pkgCharge;
    bool? enableKot;
    bool? updateOrdAuth;
    bool? cancelOrdAuth;
    bool? addDiscountAuth;
    int? printCount;
    int? v;

    ViewPosConfigurationResModel({
        this.posAccounts,
        this.cashInOut,
        this.pettyCash,
        this.activeWallet,
        this.activeLoyalty,
        this.id,
        this.posStatus,
        this.cashInOutStatus,
        this.pettyCashStatus,
        this.activeWalletStatus,
        this.activeLoyaltyStatus,
        this.isNegativeStock,
        this.deliveryCharge,
        this.deliveryAmt,
        this.packagingCharge,
        this.pkgCharge,
        this.enableKot,
        this.updateOrdAuth,
        this.cancelOrdAuth,
        this.addDiscountAuth,
        this.printCount,
        this.v,
    });

    factory ViewPosConfigurationResModel.fromJson(Map<String, dynamic> json) => ViewPosConfigurationResModel(
        posAccounts: json["posAccounts"] == null ? null : PosAccounts.fromJson(json["posAccounts"]),
        cashInOut: json["cashInOut"] == null ? null : CashInOut.fromJson(json["cashInOut"]),
        pettyCash: json["pettyCash"] == null ? null : PettyCash.fromJson(json["pettyCash"]),
        activeWallet: json["activeWallet"] == null ? null : ActiveWallet.fromJson(json["activeWallet"]),
        activeLoyalty: json["activeLoyalty"] == null ? null : ActiveLoyalty.fromJson(json["activeLoyalty"]),
        id: json["_id"],
        posStatus: json["posStatus"],
        cashInOutStatus: json["cashInOutStatus"],
        pettyCashStatus: json["pettyCashStatus"],
        activeWalletStatus: json["activeWalletStatus"],
        activeLoyaltyStatus: json["activeLoyaltyStatus"],
        isNegativeStock: json["isNegativeStock"],
        deliveryCharge: json["deliveryCharge"],
        deliveryAmt: json["deliveryAmt"],
        packagingCharge: json["packagingCharge"],
        pkgCharge: json["pkgCharge"],
        enableKot: json["enableKot"],
        updateOrdAuth: json["updateOrdAuth"],
        cancelOrdAuth: json["cancelOrdAuth"],
        addDiscountAuth: json["addDiscountAuth"],
        printCount: json["printCount"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "posAccounts": posAccounts?.toJson(),
        "cashInOut": cashInOut?.toJson(),
        "pettyCash": pettyCash?.toJson(),
        "activeWallet": activeWallet?.toJson(),
        "activeLoyalty": activeLoyalty?.toJson(),
        "_id": id,
        "posStatus": posStatus,
        "cashInOutStatus": cashInOutStatus,
        "pettyCashStatus": pettyCashStatus,
        "activeWalletStatus": activeWalletStatus,
        "activeLoyaltyStatus": activeLoyaltyStatus,
        "isNegativeStock": isNegativeStock,
        "deliveryCharge": deliveryCharge,
        "deliveryAmt": deliveryAmt,
        "packagingCharge": packagingCharge,
        "pkgCharge": pkgCharge,
        "enableKot": enableKot,
        "updateOrdAuth": updateOrdAuth,
        "cancelOrdAuth": cancelOrdAuth,
        "addDiscountAuth": addDiscountAuth,
        "printCount": printCount,
        "__v": v,
    };
}

class ActiveLoyalty {
    String? activeLoyaltyJournel;

    ActiveLoyalty({
        this.activeLoyaltyJournel,
    });

    factory ActiveLoyalty.fromJson(Map<String, dynamic> json) => ActiveLoyalty(
        activeLoyaltyJournel: json["activeLoyaltyJournel"],
    );

    Map<String, dynamic> toJson() => {
        "activeLoyaltyJournel": activeLoyaltyJournel,
    };
}

class ActiveWallet {
    String? activeWalletJournel;

    ActiveWallet({
        this.activeWalletJournel,
    });

    factory ActiveWallet.fromJson(Map<String, dynamic> json) => ActiveWallet(
        activeWalletJournel: json["activeWalletJournel"],
    );

    Map<String, dynamic> toJson() => {
        "activeWalletJournel": activeWalletJournel,
    };
}

class CashInOut {
    String? cashInOutAccount;

    CashInOut({
        this.cashInOutAccount,
    });

    factory CashInOut.fromJson(Map<String, dynamic> json) => CashInOut(
        cashInOutAccount: json["cashInOutAccount"],
    );

    Map<String, dynamic> toJson() => {
        "cashInOutAccount": cashInOutAccount,
    };
}

class PettyCash {
    dynamic pettycashJournel;

    PettyCash({
        this.pettycashJournel,
    });

    factory PettyCash.fromJson(Map<String, dynamic> json) => PettyCash(
        pettycashJournel: json["PettycashJournel"],
    );

    Map<String, dynamic> toJson() => {
        "PettycashJournel": pettycashJournel,
    };
}

class PosAccounts {
    String? posReceivableAccount;
    String? posIncomeAccount;
    String? posDiscountAccount;
    String? posBankChargesAccount;
    String? deliveryChargeAccount;
    String? posJournalAccount;
    String? packagingChargeAccount;
    dynamic cashGainOrLossAccount;

    PosAccounts({
        this.posReceivableAccount,
        this.posIncomeAccount,
        this.posDiscountAccount,
        this.posBankChargesAccount,
        this.deliveryChargeAccount,
        this.posJournalAccount,
        this.packagingChargeAccount,
        this.cashGainOrLossAccount,
    });

    factory PosAccounts.fromJson(Map<String, dynamic> json) => PosAccounts(
        posReceivableAccount: json["posReceivableAccount"],
        posIncomeAccount: json["posIncomeAccount"],
        posDiscountAccount: json["posDiscountAccount"],
        posBankChargesAccount: json["posBankChargesAccount"],
        deliveryChargeAccount: json["deliveryChargeAccount"],
        posJournalAccount: json["posJournalAccount"],
        packagingChargeAccount: json["packagingChargeAccount"],
        cashGainOrLossAccount: json["cashGainOrLossAccount"],
    );

    Map<String, dynamic> toJson() => {
        "posReceivableAccount": posReceivableAccount,
        "posIncomeAccount": posIncomeAccount,
        "posDiscountAccount": posDiscountAccount,
        "posBankChargesAccount": posBankChargesAccount,
        "deliveryChargeAccount": deliveryChargeAccount,
        "posJournalAccount": posJournalAccount,
        "packagingChargeAccount": packagingChargeAccount,
        "cashGainOrLossAccount": cashGainOrLossAccount,
    };
}
