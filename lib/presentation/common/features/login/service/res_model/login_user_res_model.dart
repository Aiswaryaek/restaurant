// To parse this JSON data, do
//
//     final loginUserResModel = loginUserResModelFromJson(jsonString);

import 'dart:convert';

LoginUserResModel loginUserResModelFromJson(String str) => LoginUserResModel.fromJson(json.decode(str));

String loginUserResModelToJson(LoginUserResModel data) => json.encode(data.toJson());

class LoginUserResModel {
    Data? data;
    int? status;
    String? token;
    String? imageUrl;
    String? logo;
    String? activeWalletJournel;
    bool? walletStatus;
    bool? posStatus;
    String? userName;
    String? branchId;
    String? branchPk;
    String? branchName;
    Permission? permission;
    String? storeName;
    String? currency;

    LoginUserResModel({
        this.data,
        this.status,
        this.token,
        this.imageUrl,
        this.logo,
        this.activeWalletJournel,
        this.walletStatus,
        this.posStatus,
        this.userName,
        this.branchId,
        this.branchPk,
        this.branchName,
        this.permission,
        this.storeName,
        this.currency,
    });

    factory LoginUserResModel.fromJson(Map<String, dynamic> json) => LoginUserResModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        status: json["status"],
        token: json["token"],
        imageUrl: json["imageUrl"],
        logo: json["logo"],
        activeWalletJournel: json["activeWalletJournel"],
        walletStatus: json["walletStatus"],
        posStatus: json["posStatus"],
        userName: json["userName"],
        branchId: json["branchId"],
        branchPk: json["branchPk"],
        branchName: json["branchName"],
        permission: json["permission"] == null ? null : Permission.fromJson(json["permission"]),
        storeName: json["storeName"],
        currency: json["currency"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
        "token": token,
        "imageUrl": imageUrl,
        "logo": logo,
        "activeWalletJournel": activeWalletJournel,
        "walletStatus": walletStatus,
        "posStatus": posStatus,
        "userName": userName,
        "branchId": branchId,
        "branchPk": branchPk,
        "branchName": branchName,
        "permission": permission?.toJson(),
        "storeName": storeName,
        "currency": currency,
    };
}

class Data {
    String? id;
    int? empId;
    String? staffName;
    String? gender;
    String? fathersName;
    bool? maritialStatus;
    String? contactnumber;
    String? bloodGroup;
    String? emergencyContactNumber;
    String? address;
    String? email;
    DateTime? dob;
    String? country;
    String? state;
    String? imageUrl;
    String? username;
    String? password;
    String? hash;
    String? salt;
    String? department;
    String? designation;
    DateTime? dateOfJoin;
    int? workHour;
    String? branchId;
    String? salaryType;
    int? monthlySalary;
    DateTime? contractPeriodFrm;
    DateTime? contractPeriodTo;
    bool? status;
    String? acHolder;
    int? acNo;
    String? bank;
    String? bankCode;
    String? bankLocation;
    String? pan;
    dynamic documents;
    dynamic dateOfLeaving;
    dynamic qrcode;
    String? adminId;
    String? outletLocation;
    List<AllowBranch>? allowBranches;
    int? v;

    Data({
        this.id,
        this.empId,
        this.staffName,
        this.gender,
        this.fathersName,
        this.maritialStatus,
        this.contactnumber,
        this.bloodGroup,
        this.emergencyContactNumber,
        this.address,
        this.email,
        this.dob,
        this.country,
        this.state,
        this.imageUrl,
        this.username,
        this.password,
        this.hash,
        this.salt,
        this.department,
        this.designation,
        this.dateOfJoin,
        this.workHour,
        this.branchId,
        this.salaryType,
        this.monthlySalary,
        this.contractPeriodFrm,
        this.contractPeriodTo,
        this.status,
        this.acHolder,
        this.acNo,
        this.bank,
        this.bankCode,
        this.bankLocation,
        this.pan,
        this.documents,
        this.dateOfLeaving,
        this.qrcode,
        this.adminId,
        this.outletLocation,
        this.allowBranches,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        empId: json["emp_id"],
        staffName: json["staff_name"],
        gender: json["gender"],
        fathersName: json["fathersName"],
        maritialStatus: json["maritialStatus"],
        contactnumber: json["contactnumber"],
        bloodGroup: json["bloodGroup"],
        emergencyContactNumber: json["emergencyContactNumber"],
        address: json["address"],
        email: json["email"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        country: json["country"],
        state: json["state"],
        imageUrl: json["imageUrl"],
        username: json["username"],
        password: json["password"],
        hash: json["hash"],
        salt: json["salt"],
        department: json["department"],
        designation: json["designation"],
        dateOfJoin: json["date_of_join"] == null ? null : DateTime.parse(json["date_of_join"]),
        workHour: json["workHour"],
        branchId: json["branchId"],
        salaryType: json["salaryType"],
        monthlySalary: json["monthlySalary"],
        contractPeriodFrm: json["contractPeriodFrm"] == null ? null : DateTime.parse(json["contractPeriodFrm"]),
        contractPeriodTo: json["contractPeriodTo"] == null ? null : DateTime.parse(json["contractPeriodTo"]),
        status: json["status"],
        acHolder: json["ac_holder"],
        acNo: json["ac_no"],
        bank: json["bank"],
        bankCode: json["bank_code"],
        bankLocation: json["bankLocation"],
        pan: json["pan"],
        documents: json["documents"],
        dateOfLeaving: json["date_of_leaving"],
        qrcode: json["qrcode"],
        adminId: json["admin_id"],
        outletLocation: json["outletLocation"],
        allowBranches: json["allowBranches"] == null ? [] : List<AllowBranch>.from(json["allowBranches"]!.map((x) => AllowBranch.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "emp_id": empId,
        "staff_name": staffName,
        "gender": gender,
        "fathersName": fathersName,
        "maritialStatus": maritialStatus,
        "contactnumber": contactnumber,
        "bloodGroup": bloodGroup,
        "emergencyContactNumber": emergencyContactNumber,
        "address": address,
        "email": email,
        "dob": dob?.toIso8601String(),
        "country": country,
        "state": state,
        "imageUrl": imageUrl,
        "username": username,
        "password": password,
        "hash": hash,
        "salt": salt,
        "department": department,
        "designation": designation,
        "date_of_join": dateOfJoin?.toIso8601String(),
        "workHour": workHour,
        "branchId": branchId,
        "salaryType": salaryType,
        "monthlySalary": monthlySalary,
        "contractPeriodFrm": contractPeriodFrm?.toIso8601String(),
        "contractPeriodTo": contractPeriodTo?.toIso8601String(),
        "status": status,
        "ac_holder": acHolder,
        "ac_no": acNo,
        "bank": bank,
        "bank_code": bankCode,
        "bankLocation": bankLocation,
        "pan": pan,
        "documents": documents,
        "date_of_leaving": dateOfLeaving,
        "qrcode": qrcode,
        "admin_id": adminId,
        "outletLocation": outletLocation,
        "allowBranches": allowBranches == null ? [] : List<dynamic>.from(allowBranches!.map((x) => x.toJson())),
        "__v": v,
    };
}

class AllowBranch {
    String? outletLocation;
    String? id;

    AllowBranch({
        this.outletLocation,
        this.id,
    });

    factory AllowBranch.fromJson(Map<String, dynamic> json) => AllowBranch(
        outletLocation: json["outletLocation"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "outletLocation": outletLocation,
        "_id": id,
    };
}

class Permission {
    PointOfSales? pointOfSales;
    Map<String, bool>? purchase;
    Inventory? inventory;
    Sales? sales;
    FoodManagement? foodManagement;
    PermissionReport? report;
    Accounts? accounts;
    Staff? staff;
    String? id;
    int? type;
    String? empId;
    bool? dashboard;
    bool? products;
    PointOfSale? pointOfSale;
    PermissionCustomer? customer;
    Account? account;
    bool? deviceSettings;
    bool? generateQrBarcode;
    int? v;

    Permission({
        this.pointOfSales,
        this.purchase,
        this.inventory,
        this.sales,
        this.foodManagement,
        this.report,
        this.accounts,
        this.staff,
        this.id,
        this.type,
        this.empId,
        this.dashboard,
        this.products,
        this.pointOfSale,
        this.customer,
        this.account,
        this.deviceSettings,
        this.generateQrBarcode,
        this.v,
    });

    factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        pointOfSales: json["pointOfSales"] == null ? null : PointOfSales.fromJson(json["pointOfSales"]),
        purchase: Map.from(json["purchase"]!).map((k, v) => MapEntry<String, bool>(k, v)),
        inventory: json["inventory"] == null ? null : Inventory.fromJson(json["inventory"]),
        sales: json["sales"] == null ? null : Sales.fromJson(json["sales"]),
        foodManagement: json["foodManagement"] == null ? null : FoodManagement.fromJson(json["foodManagement"]),
        report: json["report"] == null ? null : PermissionReport.fromJson(json["report"]),
        accounts: json["accounts"] == null ? null : Accounts.fromJson(json["accounts"]),
        staff: json["staff"] == null ? null : Staff.fromJson(json["staff"]),
        id: json["_id"],
        type: json["type"],
        empId: json["empId"],
        dashboard: json["dashboard"],
        products: json["products"],
        pointOfSale: json["pointOfSale"] == null ? null : PointOfSale.fromJson(json["pointOfSale"]),
        customer: json["customer"] == null ? null : PermissionCustomer.fromJson(json["customer"]),
        account: json["account"] == null ? null : Account.fromJson(json["account"]),
        deviceSettings: json["deviceSettings"],
        generateQrBarcode: json["generateQrBarcode"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "pointOfSales": pointOfSales?.toJson(),
        "purchase": Map.from(purchase!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "inventory": inventory?.toJson(),
        "sales": sales?.toJson(),
        "foodManagement": foodManagement?.toJson(),
        "report": report?.toJson(),
        "accounts": accounts?.toJson(),
        "staff": staff?.toJson(),
        "_id": id,
        "type": type,
        "empId": empId,
        "dashboard": dashboard,
        "products": products,
        "pointOfSale": pointOfSale?.toJson(),
        "customer": customer?.toJson(),
        "account": account?.toJson(),
        "deviceSettings": deviceSettings,
        "generateQrBarcode": generateQrBarcode,
        "__v": v,
    };
}

class Account {
    AccountCustomer? customer;
    AccountVendor? vendor;
    AccountAccounting? accounting;
    AccountReports? reports;
    AccountConfiguration? configuration;

    Account({
        this.customer,
        this.vendor,
        this.accounting,
        this.reports,
        this.configuration,
    });

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        customer: json["customer"] == null ? null : AccountCustomer.fromJson(json["customer"]),
        vendor: json["vendor"] == null ? null : AccountVendor.fromJson(json["vendor"]),
        accounting: json["accounting"] == null ? null : AccountAccounting.fromJson(json["accounting"]),
        reports: json["reports"] == null ? null : AccountReports.fromJson(json["reports"]),
        configuration: json["configuration"] == null ? null : AccountConfiguration.fromJson(json["configuration"]),
    );

    Map<String, dynamic> toJson() => {
        "customer": customer?.toJson(),
        "vendor": vendor?.toJson(),
        "accounting": accounting?.toJson(),
        "reports": reports?.toJson(),
        "configuration": configuration?.toJson(),
    };
}

class AccountAccounting {
    bool? all;
    bool? journal;
    bool? chartOfAccounts;
    bool? journalEntries;
    bool? recurringPosting;

    AccountAccounting({
        this.all,
        this.journal,
        this.chartOfAccounts,
        this.journalEntries,
        this.recurringPosting,
    });

    factory AccountAccounting.fromJson(Map<String, dynamic> json) => AccountAccounting(
        all: json["all"],
        journal: json["journal"],
        chartOfAccounts: json["chartOfAccounts"],
        journalEntries: json["journalEntries"],
        recurringPosting: json["recurringPosting"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "journal": journal,
        "chartOfAccounts": chartOfAccounts,
        "journalEntries": journalEntries,
        "recurringPosting": recurringPosting,
    };
}

class AccountConfiguration {
    bool? configuration;

    AccountConfiguration({
        this.configuration,
    });

    factory AccountConfiguration.fromJson(Map<String, dynamic> json) => AccountConfiguration(
        configuration: json["configuration"],
    );

    Map<String, dynamic> toJson() => {
        "configuration": configuration,
    };
}

class AccountCustomer {
    bool? all;
    bool? customerInvoices;
    bool? salesWso;
    bool? payments;
    bool? creditNotes;
    bool? customers;

    AccountCustomer({
        this.all,
        this.customerInvoices,
        this.salesWso,
        this.payments,
        this.creditNotes,
        this.customers,
    });

    factory AccountCustomer.fromJson(Map<String, dynamic> json) => AccountCustomer(
        all: json["all"],
        customerInvoices: json["customerInvoices"],
        salesWso: json["salesWso"],
        payments: json["payments"],
        creditNotes: json["creditNotes"],
        customers: json["customers"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "customerInvoices": customerInvoices,
        "salesWso": salesWso,
        "payments": payments,
        "creditNotes": creditNotes,
        "customers": customers,
    };
}

class AccountReports {
    bool? trialBalance;
    bool? balanceSheet;
    bool? generalLedger;
    bool? profitAndLoss;
    bool? accountPayable;
    bool? accountReceivable;
    bool? bankAndCashReport;

    AccountReports({
        this.trialBalance,
        this.balanceSheet,
        this.generalLedger,
        this.profitAndLoss,
        this.accountPayable,
        this.accountReceivable,
        this.bankAndCashReport,
    });

    factory AccountReports.fromJson(Map<String, dynamic> json) => AccountReports(
        trialBalance: json["trialBalance"],
        balanceSheet: json["balanceSheet"],
        generalLedger: json["generalLedger"],
        profitAndLoss: json["profitAndLoss"],
        accountPayable: json["accountPayable"],
        accountReceivable: json["accountReceivable"],
        bankAndCashReport: json["bankAndCashReport"],
    );

    Map<String, dynamic> toJson() => {
        "trialBalance": trialBalance,
        "balanceSheet": balanceSheet,
        "generalLedger": generalLedger,
        "profitAndLoss": profitAndLoss,
        "accountPayable": accountPayable,
        "accountReceivable": accountReceivable,
        "bankAndCashReport": bankAndCashReport,
    };
}

class AccountVendor {
    bool? all;
    bool? vendorBills;
    bool? purchaseWpo;
    bool? payments;
    bool? debitNotes;
    bool? vendor;

    AccountVendor({
        this.all,
        this.vendorBills,
        this.purchaseWpo,
        this.payments,
        this.debitNotes,
        this.vendor,
    });

    factory AccountVendor.fromJson(Map<String, dynamic> json) => AccountVendor(
        all: json["all"],
        vendorBills: json["vendorBills"],
        purchaseWpo: json["purchaseWpo"],
        payments: json["payments"],
        debitNotes: json["debitNotes"],
        vendor: json["vendor"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "vendorBills": vendorBills,
        "purchaseWpo": purchaseWpo,
        "payments": payments,
        "debitNotes": debitNotes,
        "vendor": vendor,
    };
}

class Accounts {
    Customers? customers;
    AccountsVendor? vendor;
    AccountsAccounting? accounting;
    Reconcilation? reconcilation;
    Vatreport? vatreport;
    AccountsReport? report;
    bool? all;
    bool? dashboard;
    bool? configuration;

    Accounts({
        this.customers,
        this.vendor,
        this.accounting,
        this.reconcilation,
        this.vatreport,
        this.report,
        this.all,
        this.dashboard,
        this.configuration,
    });

    factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
        customers: json["customers"] == null ? null : Customers.fromJson(json["customers"]),
        vendor: json["vendor"] == null ? null : AccountsVendor.fromJson(json["vendor"]),
        accounting: json["accounting"] == null ? null : AccountsAccounting.fromJson(json["accounting"]),
        reconcilation: json["reconcilation"] == null ? null : Reconcilation.fromJson(json["reconcilation"]),
        vatreport: json["vatreport"] == null ? null : Vatreport.fromJson(json["vatreport"]),
        report: json["report"] == null ? null : AccountsReport.fromJson(json["report"]),
        all: json["all"],
        dashboard: json["dashboard"],
        configuration: json["configuration"],
    );

    Map<String, dynamic> toJson() => {
        "customers": customers?.toJson(),
        "vendor": vendor?.toJson(),
        "accounting": accounting?.toJson(),
        "reconcilation": reconcilation?.toJson(),
        "vatreport": vatreport?.toJson(),
        "report": report?.toJson(),
        "all": all,
        "dashboard": dashboard,
        "configuration": configuration,
    };
}

class AccountsAccounting {
    bool? journal;
    bool? chartofaccounts;
    bool? openingBalance;
    bool? journalEntries;

    AccountsAccounting({
        this.journal,
        this.chartofaccounts,
        this.openingBalance,
        this.journalEntries,
    });

    factory AccountsAccounting.fromJson(Map<String, dynamic> json) => AccountsAccounting(
        journal: json["journal"],
        chartofaccounts: json["chartofaccounts"],
        openingBalance: json["openingBalance"],
        journalEntries: json["journalEntries"],
    );

    Map<String, dynamic> toJson() => {
        "journal": journal,
        "chartofaccounts": chartofaccounts,
        "openingBalance": openingBalance,
        "journalEntries": journalEntries,
    };
}

class Customers {
    bool? customerInvoice;
    bool? saleswoso;
    bool? payments;
    bool? creditNotes;
    bool? customers;

    Customers({
        this.customerInvoice,
        this.saleswoso,
        this.payments,
        this.creditNotes,
        this.customers,
    });

    factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        customerInvoice: json["customerInvoice"],
        saleswoso: json["saleswoso"],
        payments: json["payments"],
        creditNotes: json["creditNotes"],
        customers: json["customers"],
    );

    Map<String, dynamic> toJson() => {
        "customerInvoice": customerInvoice,
        "saleswoso": saleswoso,
        "payments": payments,
        "creditNotes": creditNotes,
        "customers": customers,
    };
}

class Reconcilation {
    bool? bankReconcilation;

    Reconcilation({
        this.bankReconcilation,
    });

    factory Reconcilation.fromJson(Map<String, dynamic> json) => Reconcilation(
        bankReconcilation: json["bankReconcilation"],
    );

    Map<String, dynamic> toJson() => {
        "bankReconcilation": bankReconcilation,
    };
}

class AccountsReport {
    FinancialReport? financialReport;
    PartnerReports? partnerReports;
    GeneralReport? generalReport;

    AccountsReport({
        this.financialReport,
        this.partnerReports,
        this.generalReport,
    });

    factory AccountsReport.fromJson(Map<String, dynamic> json) => AccountsReport(
        financialReport: json["financialReport"] == null ? null : FinancialReport.fromJson(json["financialReport"]),
        partnerReports: json["partnerReports"] == null ? null : PartnerReports.fromJson(json["partnerReports"]),
        generalReport: json["generalReport"] == null ? null : GeneralReport.fromJson(json["generalReport"]),
    );

    Map<String, dynamic> toJson() => {
        "financialReport": financialReport?.toJson(),
        "partnerReports": partnerReports?.toJson(),
        "generalReport": generalReport?.toJson(),
    };
}

class FinancialReport {
    bool? trialBalance;
    bool? balanceSheet;
    bool? generalLedger;
    bool? profitAndLoss;

    FinancialReport({
        this.trialBalance,
        this.balanceSheet,
        this.generalLedger,
        this.profitAndLoss,
    });

    factory FinancialReport.fromJson(Map<String, dynamic> json) => FinancialReport(
        trialBalance: json["trialBalance"],
        balanceSheet: json["balanceSheet"],
        generalLedger: json["generalLedger"],
        profitAndLoss: json["profitAndLoss"],
    );

    Map<String, dynamic> toJson() => {
        "trialBalance": trialBalance,
        "balanceSheet": balanceSheet,
        "generalLedger": generalLedger,
        "profitAndLoss": profitAndLoss,
    };
}

class GeneralReport {
    bool? bankAndCash;
    bool? chequeRegister;
    bool? invoiceMargin;
    bool? productMargin;
    bool? customerReciept;

    GeneralReport({
        this.bankAndCash,
        this.chequeRegister,
        this.invoiceMargin,
        this.productMargin,
        this.customerReciept,
    });

    factory GeneralReport.fromJson(Map<String, dynamic> json) => GeneralReport(
        bankAndCash: json["bankAndCash"],
        chequeRegister: json["chequeRegister"],
        invoiceMargin: json["invoiceMargin"],
        productMargin: json["productMargin"],
        customerReciept: json["customerReciept"],
    );

    Map<String, dynamic> toJson() => {
        "bankAndCash": bankAndCash,
        "chequeRegister": chequeRegister,
        "invoiceMargin": invoiceMargin,
        "productMargin": productMargin,
        "customerReciept": customerReciept,
    };
}

class PartnerReports {
    bool? accountPayable;
    bool? accountReceivable;
    bool? agingReportReceivable;
    bool? agingReportPayable;
    bool? receivableDueReport;
    bool? payableDueReport;

    PartnerReports({
        this.accountPayable,
        this.accountReceivable,
        this.agingReportReceivable,
        this.agingReportPayable,
        this.receivableDueReport,
        this.payableDueReport,
    });

    factory PartnerReports.fromJson(Map<String, dynamic> json) => PartnerReports(
        accountPayable: json["accountPayable"],
        accountReceivable: json["accountReceivable"],
        agingReportReceivable: json["agingReportReceivable"],
        agingReportPayable: json["agingReportPayable"],
        receivableDueReport: json["receivableDueReport"],
        payableDueReport: json["payableDueReport"],
    );

    Map<String, dynamic> toJson() => {
        "accountPayable": accountPayable,
        "accountReceivable": accountReceivable,
        "agingReportReceivable": agingReportReceivable,
        "agingReportPayable": agingReportPayable,
        "receivableDueReport": receivableDueReport,
        "payableDueReport": payableDueReport,
    };
}

class Vatreport {
    bool? inputoroutputreport;

    Vatreport({
        this.inputoroutputreport,
    });

    factory Vatreport.fromJson(Map<String, dynamic> json) => Vatreport(
        inputoroutputreport: json["inputoroutputreport"],
    );

    Map<String, dynamic> toJson() => {
        "inputoroutputreport": inputoroutputreport,
    };
}

class AccountsVendor {
    bool? vendorBills;
    bool? purchasewpo;
    bool? payments;
    bool? debitNotes;
    bool? vendors;

    AccountsVendor({
        this.vendorBills,
        this.purchasewpo,
        this.payments,
        this.debitNotes,
        this.vendors,
    });

    factory AccountsVendor.fromJson(Map<String, dynamic> json) => AccountsVendor(
        vendorBills: json["vendorBills"],
        purchasewpo: json["purchasewpo"],
        payments: json["payments"],
        debitNotes: json["debitNotes"],
        vendors: json["vendors"],
    );

    Map<String, dynamic> toJson() => {
        "vendorBills": vendorBills,
        "purchasewpo": purchasewpo,
        "payments": payments,
        "debitNotes": debitNotes,
        "vendors": vendors,
    };
}

class PermissionCustomer {
    bool? all;
    bool? customerList;

    PermissionCustomer({
        this.all,
        this.customerList,
    });

    factory PermissionCustomer.fromJson(Map<String, dynamic> json) => PermissionCustomer(
        all: json["all"],
        customerList: json["customerList"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "customerList": customerList,
    };
}

class FoodManagement {
    bool? all;
    bool? preperation;
    bool? recipe;
    bool? configuration;

    FoodManagement({
        this.all,
        this.preperation,
        this.recipe,
        this.configuration,
    });

    factory FoodManagement.fromJson(Map<String, dynamic> json) => FoodManagement(
        all: json["all"],
        preperation: json["preperation"],
        recipe: json["recipe"],
        configuration: json["configuration"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "preperation": preperation,
        "recipe": recipe,
        "configuration": configuration,
    };
}

class Inventory {
    Products? products;
    Operations? operations;
    InventoryReports? reports;
    InventoryConfiguration? configuration;
    bool? all;
    bool? productMaster;
    bool? product;
    bool? internalTransfer;
    bool? branchTransfer;
    bool? branchReceipts;
    bool? stockMoves;
    bool? inventoryAdjustment;
    bool? landedCost;
    bool? warehouse;
    bool? location;
    bool? settings;
    bool? attribute;
    bool? posCategory;
    bool? category;

    Inventory({
        this.products,
        this.operations,
        this.reports,
        this.configuration,
        this.all,
        this.productMaster,
        this.product,
        this.internalTransfer,
        this.branchTransfer,
        this.branchReceipts,
        this.stockMoves,
        this.inventoryAdjustment,
        this.landedCost,
        this.warehouse,
        this.location,
        this.settings,
        this.attribute,
        this.posCategory,
        this.category,
    });

    factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        products: json["products"] == null ? null : Products.fromJson(json["products"]),
        operations: json["operations"] == null ? null : Operations.fromJson(json["operations"]),
        reports: json["reports"] == null ? null : InventoryReports.fromJson(json["reports"]),
        configuration: json["configuration"] == null ? null : InventoryConfiguration.fromJson(json["configuration"]),
        all: json["all"],
        productMaster: json["productMaster"],
        product: json["product"],
        internalTransfer: json["internalTransfer"],
        branchTransfer: json["branchTransfer"],
        branchReceipts: json["branchReceipts"],
        stockMoves: json["stockMoves"],
        inventoryAdjustment: json["inventoryAdjustment"],
        landedCost: json["landedCost"],
        warehouse: json["warehouse"],
        location: json["location"],
        settings: json["settings"],
        attribute: json["attribute"],
        posCategory: json["posCategory"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "products": products?.toJson(),
        "operations": operations?.toJson(),
        "reports": reports?.toJson(),
        "configuration": configuration?.toJson(),
        "all": all,
        "productMaster": productMaster,
        "product": product,
        "internalTransfer": internalTransfer,
        "branchTransfer": branchTransfer,
        "branchReceipts": branchReceipts,
        "stockMoves": stockMoves,
        "inventoryAdjustment": inventoryAdjustment,
        "landedCost": landedCost,
        "warehouse": warehouse,
        "location": location,
        "settings": settings,
        "attribute": attribute,
        "posCategory": posCategory,
        "category": category,
    };
}

class InventoryConfiguration {
    bool? warehouse;
    bool? location;
    bool? settings;
    bool? attribute;
    bool? poscategory;
    bool? category;

    InventoryConfiguration({
        this.warehouse,
        this.location,
        this.settings,
        this.attribute,
        this.poscategory,
        this.category,
    });

    factory InventoryConfiguration.fromJson(Map<String, dynamic> json) => InventoryConfiguration(
        warehouse: json["warehouse"],
        location: json["location"],
        settings: json["settings"],
        attribute: json["attribute"],
        poscategory: json["poscategory"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "warehouse": warehouse,
        "location": location,
        "settings": settings,
        "attribute": attribute,
        "poscategory": poscategory,
        "category": category,
    };
}

class Operations {
    bool? internalTransfer;
    bool? branchTransfer;
    bool? branchReciept;
    bool? stockMoves;
    bool? inventoryAdjustments;

    Operations({
        this.internalTransfer,
        this.branchTransfer,
        this.branchReciept,
        this.stockMoves,
        this.inventoryAdjustments,
    });

    factory Operations.fromJson(Map<String, dynamic> json) => Operations(
        internalTransfer: json["internalTransfer"],
        branchTransfer: json["branchTransfer"],
        branchReciept: json["branchReciept"],
        stockMoves: json["stockMoves"],
        inventoryAdjustments: json["inventoryAdjustments"],
    );

    Map<String, dynamic> toJson() => {
        "internalTransfer": internalTransfer,
        "branchTransfer": branchTransfer,
        "branchReciept": branchReciept,
        "stockMoves": stockMoves,
        "inventoryAdjustments": inventoryAdjustments,
    };
}

class Products {
    bool? productMaster;
    bool? product;

    Products({
        this.productMaster,
        this.product,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        productMaster: json["productMaster"],
        product: json["product"],
    );

    Map<String, dynamic> toJson() => {
        "productMaster": productMaster,
        "product": product,
    };
}

class InventoryReports {
    bool? stockMoveReport;

    InventoryReports({
        this.stockMoveReport,
    });

    factory InventoryReports.fromJson(Map<String, dynamic> json) => InventoryReports(
        stockMoveReport: json["stockMoveReport"],
    );

    Map<String, dynamic> toJson() => {
        "stockMoveReport": stockMoveReport,
    };
}

class PointOfSale {
    Orders? orders;
    Billing? billing;
    Expense? expense;
    Rewards? rewards;
    Offers? offers;
    PointOfSaleConfiguration? configuration;

    PointOfSale({
        this.orders,
        this.billing,
        this.expense,
        this.rewards,
        this.offers,
        this.configuration,
    });

    factory PointOfSale.fromJson(Map<String, dynamic> json) => PointOfSale(
        orders: json["orders"] == null ? null : Orders.fromJson(json["orders"]),
        billing: json["billing"] == null ? null : Billing.fromJson(json["billing"]),
        expense: json["expense"] == null ? null : Expense.fromJson(json["expense"]),
        rewards: json["rewards"] == null ? null : Rewards.fromJson(json["rewards"]),
        offers: json["offers"] == null ? null : Offers.fromJson(json["offers"]),
        configuration: json["configuration"] == null ? null : PointOfSaleConfiguration.fromJson(json["configuration"]),
    );

    Map<String, dynamic> toJson() => {
        "orders": orders?.toJson(),
        "billing": billing?.toJson(),
        "expense": expense?.toJson(),
        "rewards": rewards?.toJson(),
        "offers": offers?.toJson(),
        "configuration": configuration?.toJson(),
    };
}

class Billing {
    bool? all;
    bool? billing;
    bool? orderList;
    bool? receipts;
    bool? billingReturn;
    bool? credit;
    bool? wallet;
    bool? oldStock;
    bool? damagedGoods;

    Billing({
        this.all,
        this.billing,
        this.orderList,
        this.receipts,
        this.billingReturn,
        this.credit,
        this.wallet,
        this.oldStock,
        this.damagedGoods,
    });

    factory Billing.fromJson(Map<String, dynamic> json) => Billing(
        all: json["all"],
        billing: json["billing"],
        orderList: json["orderList"],
        receipts: json["receipts"],
        billingReturn: json["return"],
        credit: json["credit"],
        wallet: json["wallet"],
        oldStock: json["oldStock"],
        damagedGoods: json["damagedGoods"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "billing": billing,
        "orderList": orderList,
        "receipts": receipts,
        "return": billingReturn,
        "credit": credit,
        "wallet": wallet,
        "oldStock": oldStock,
        "damagedGoods": damagedGoods,
    };
}

class PointOfSaleConfiguration {
    bool? all;
    bool? settings;
    bool? branchSettings;

    PointOfSaleConfiguration({
        this.all,
        this.settings,
        this.branchSettings,
    });

    factory PointOfSaleConfiguration.fromJson(Map<String, dynamic> json) => PointOfSaleConfiguration(
        all: json["all"],
        settings: json["settings"],
        branchSettings: json["branchSettings"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "settings": settings,
        "branchSettings": branchSettings,
    };
}

class Expense {
    bool? all;
    bool? addExpenseType;
    bool? staffExpense;
    bool? outletExpense;

    Expense({
        this.all,
        this.addExpenseType,
        this.staffExpense,
        this.outletExpense,
    });

    factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        all: json["all"],
        addExpenseType: json["addExpenseType"],
        staffExpense: json["staffExpense"],
        outletExpense: json["outletExpense"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "addExpenseType": addExpenseType,
        "staffExpense": staffExpense,
        "outletExpense": outletExpense,
    };
}

class Offers {
    bool? all;
    bool? offerListed;
    bool? addOffer;

    Offers({
        this.all,
        this.offerListed,
        this.addOffer,
    });

    factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        all: json["all"],
        offerListed: json["offerListed"],
        addOffer: json["addOffer"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "offerListed": offerListed,
        "addOffer": addOffer,
    };
}

class Orders {
    bool? all;
    bool? viewOrders;
    bool? workOrder;
    bool? woEdit;
    bool? printCuttingSlip;
    bool? alteration;
    bool? altEdit;
    bool? jobCompletion;
    bool? delivery;

    Orders({
        this.all,
        this.viewOrders,
        this.workOrder,
        this.woEdit,
        this.printCuttingSlip,
        this.alteration,
        this.altEdit,
        this.jobCompletion,
        this.delivery,
    });

    factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        all: json["all"],
        viewOrders: json["viewOrders"],
        workOrder: json["workOrder"],
        woEdit: json["woEdit"],
        printCuttingSlip: json["printCuttingSlip"],
        alteration: json["alteration"],
        altEdit: json["altEdit"],
        jobCompletion: json["jobCompletion"],
        delivery: json["delivery"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "viewOrders": viewOrders,
        "workOrder": workOrder,
        "woEdit": woEdit,
        "printCuttingSlip": printCuttingSlip,
        "alteration": alteration,
        "altEdit": altEdit,
        "jobCompletion": jobCompletion,
        "delivery": delivery,
    };
}

class Rewards {
    bool? all;
    bool? rewardsView;
    bool? addRewards;

    Rewards({
        this.all,
        this.rewardsView,
        this.addRewards,
    });

    factory Rewards.fromJson(Map<String, dynamic> json) => Rewards(
        all: json["all"],
        rewardsView: json["rewardsView"],
        addRewards: json["addRewards"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "rewardsView": rewardsView,
        "addRewards": addRewards,
    };
}

class PointOfSales {
    General? general;
    PointOfSalesReport? report;
    Expense? expense;
    PointOfSalesConfiguration? configuration;
    bool? all;
    bool? billing;
    bool? specialItems;
    bool? kot;
    bool? customerDisplay;
    bool? tokenDisplay;
    bool? floorManagement;

    PointOfSales({
        this.general,
        this.report,
        this.expense,
        this.configuration,
        this.all,
        this.billing,
        this.specialItems,
        this.kot,
        this.customerDisplay,
        this.tokenDisplay,
        this.floorManagement,
    });

    factory PointOfSales.fromJson(Map<String, dynamic> json) => PointOfSales(
        general: json["general"] == null ? null : General.fromJson(json["general"]),
        report: json["report"] == null ? null : PointOfSalesReport.fromJson(json["report"]),
        expense: json["expense"] == null ? null : Expense.fromJson(json["expense"]),
        configuration: json["configuration"] == null ? null : PointOfSalesConfiguration.fromJson(json["configuration"]),
        all: json["all"],
        billing: json["billing"],
        specialItems: json["specialItems"],
        kot: json["kot"],
        customerDisplay: json["customerDisplay"],
        tokenDisplay: json["tokenDisplay"],
        floorManagement: json["floorManagement"],
    );

    Map<String, dynamic> toJson() => {
        "general": general?.toJson(),
        "report": report?.toJson(),
        "expense": expense?.toJson(),
        "configuration": configuration?.toJson(),
        "all": all,
        "billing": billing,
        "specialItems": specialItems,
        "kot": kot,
        "customerDisplay": customerDisplay,
        "tokenDisplay": tokenDisplay,
        "floorManagement": floorManagement,
    };
}

class PointOfSalesConfiguration {
    bool? settings;
    bool? branchSettings;
    bool? aggregator;

    PointOfSalesConfiguration({
        this.settings,
        this.branchSettings,
        this.aggregator,
    });

    factory PointOfSalesConfiguration.fromJson(Map<String, dynamic> json) => PointOfSalesConfiguration(
        settings: json["settings"],
        branchSettings: json["branchSettings"],
        aggregator: json["aggregator"],
    );

    Map<String, dynamic> toJson() => {
        "settings": settings,
        "branchSettings": branchSettings,
        "aggregator": aggregator,
    };
}

class General {
    bool? shift;
    bool? orders;
    bool? payments;
    bool? wallet;

    General({
        this.shift,
        this.orders,
        this.payments,
        this.wallet,
    });

    factory General.fromJson(Map<String, dynamic> json) => General(
        shift: json["shift"],
        orders: json["orders"],
        payments: json["payments"],
        wallet: json["wallet"],
    );

    Map<String, dynamic> toJson() => {
        "shift": shift,
        "orders": orders,
        "payments": payments,
        "wallet": wallet,
    };
}

class PointOfSalesReport {
    bool? shiftReport;
    bool? shiftSummaryReport;
    bool? salesDetails;
    bool? aggregatorReport;
    bool? cashcardSummary;

    PointOfSalesReport({
        this.shiftReport,
        this.shiftSummaryReport,
        this.salesDetails,
        this.aggregatorReport,
        this.cashcardSummary,
    });

    factory PointOfSalesReport.fromJson(Map<String, dynamic> json) => PointOfSalesReport(
        shiftReport: json["shiftReport"],
        shiftSummaryReport: json["shiftSummaryReport"],
        salesDetails: json["salesDetails"],
        aggregatorReport: json["aggregatorReport"],
        cashcardSummary: json["cashcardSummary"],
    );

    Map<String, dynamic> toJson() => {
        "shiftReport": shiftReport,
        "shiftSummaryReport": shiftSummaryReport,
        "salesDetails": salesDetails,
        "aggregatorReport": aggregatorReport,
        "cashcardSummary": cashcardSummary,
    };
}

class PermissionReport {
    bool? stockreport;
    bool? all;
    bool? posSalesReport;
    bool? stockReport;
    bool? dailyReport;
    bool? dailyCashAndCard;
    bool? expenseReport;
    bool? paymentReport;
    bool? commissionReport;
    bool? jobCompletion;

    PermissionReport({
        this.stockreport,
        this.all,
        this.posSalesReport,
        this.stockReport,
        this.dailyReport,
        this.dailyCashAndCard,
        this.expenseReport,
        this.paymentReport,
        this.commissionReport,
        this.jobCompletion,
    });

    factory PermissionReport.fromJson(Map<String, dynamic> json) => PermissionReport(
        stockreport: json["stockreport"],
        all: json["all"],
        posSalesReport: json["posSalesReport"],
        stockReport: json["stockReport"],
        dailyReport: json["dailyReport"],
        dailyCashAndCard: json["dailyCashAndCard"],
        expenseReport: json["expenseReport"],
        paymentReport: json["paymentReport"],
        commissionReport: json["commissionReport"],
        jobCompletion: json["jobCompletion"],
    );

    Map<String, dynamic> toJson() => {
        "stockreport": stockreport,
        "all": all,
        "posSalesReport": posSalesReport,
        "stockReport": stockReport,
        "dailyReport": dailyReport,
        "dailyCashAndCard": dailyCashAndCard,
        "expenseReport": expenseReport,
        "paymentReport": paymentReport,
        "commissionReport": commissionReport,
        "jobCompletion": jobCompletion,
    };
}

class Sales {
    SalesReport? report;
    bool? customers;
    bool? all;
    bool? quotation;
    bool? salesOrder;
    bool? deliveryNote;
    bool? customer;
    bool? priceList;
    bool? salesReport;

    Sales({
        this.report,
        this.customers,
        this.all,
        this.quotation,
        this.salesOrder,
        this.deliveryNote,
        this.customer,
        this.priceList,
        this.salesReport,
    });

    factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        report: json["report"] == null ? null : SalesReport.fromJson(json["report"]),
        customers: json["customers"],
        all: json["all"],
        quotation: json["quotation"],
        salesOrder: json["salesOrder"],
        deliveryNote: json["deliveryNote"],
        customer: json["customer"],
        priceList: json["priceList"],
        salesReport: json["salesReport"],
    );

    Map<String, dynamic> toJson() => {
        "report": report?.toJson(),
        "customers": customers,
        "all": all,
        "quotation": quotation,
        "salesOrder": salesOrder,
        "deliveryNote": deliveryNote,
        "customer": customer,
        "priceList": priceList,
        "salesReport": salesReport,
    };
}

class SalesReport {
    bool? salesReport;
    bool? salesReportBySalesPerson;

    SalesReport({
        this.salesReport,
        this.salesReportBySalesPerson,
    });

    factory SalesReport.fromJson(Map<String, dynamic> json) => SalesReport(
        salesReport: json["salesReport"],
        salesReportBySalesPerson: json["salesReportBySalesPerson"],
    );

    Map<String, dynamic> toJson() => {
        "salesReport": salesReport,
        "salesReportBySalesPerson": salesReportBySalesPerson,
    };
}

class Staff {
    Hrm? staffHrm;
    bool? all;
    Dashboard? dashboard;
    Hrm? hrm;
    Attendance? attendance;
    Leave? leave;
    Payroll? payroll;
    Loan? loan;

    Staff({
        this.staffHrm,
        this.all,
        this.dashboard,
        this.hrm,
        this.attendance,
        this.leave,
        this.payroll,
        this.loan,
    });

    factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        staffHrm: json["hrm"] == null ? null : Hrm.fromJson(json["hrm"]),
        all: json["all"],
        dashboard: json["dashboard"] == null ? null : Dashboard.fromJson(json["dashboard"]),
        hrm: json["HRM"] == null ? null : Hrm.fromJson(json["HRM"]),
        attendance: json["attendance"] == null ? null : Attendance.fromJson(json["attendance"]),
        leave: json["leave"] == null ? null : Leave.fromJson(json["leave"]),
        payroll: json["payroll"] == null ? null : Payroll.fromJson(json["payroll"]),
        loan: json["loan"] == null ? null : Loan.fromJson(json["loan"]),
    );

    Map<String, dynamic> toJson() => {
        "hrm": staffHrm?.toJson(),
        "all": all,
        "dashboard": dashboard?.toJson(),
        "HRM": hrm?.toJson(),
        "attendance": attendance?.toJson(),
        "leave": leave?.toJson(),
        "payroll": payroll?.toJson(),
        "loan": loan?.toJson(),
    };
}

class Attendance {
    bool? attendance;

    Attendance({
        this.attendance,
    });

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        attendance: json["attendance"],
    );

    Map<String, dynamic> toJson() => {
        "attendance": attendance,
    };
}

class Dashboard {
    bool? dashboard;

    Dashboard({
        this.dashboard,
    });

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        dashboard: json["dashboard"],
    );

    Map<String, dynamic> toJson() => {
        "dashboard": dashboard,
    };
}

class Hrm {
    bool? all;
    bool? department;
    bool? designation;
    bool? manageEmployee;
    bool? addEmployee;
    bool? addDocument;

    Hrm({
        this.all,
        this.department,
        this.designation,
        this.manageEmployee,
        this.addEmployee,
        this.addDocument,
    });

    factory Hrm.fromJson(Map<String, dynamic> json) => Hrm(
        all: json["all"],
        department: json["department"],
        designation: json["designation"],
        manageEmployee: json["manageEmployee"],
        addEmployee: json["addEmployee"],
        addDocument: json["addDocument"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "department": department,
        "designation": designation,
        "manageEmployee": manageEmployee,
        "addEmployee": addEmployee,
        "addDocument": addDocument,
    };
}

class Leave {
    bool? all;
    bool? leaveApplication;
    bool? holiday;

    Leave({
        this.all,
        this.leaveApplication,
        this.holiday,
    });

    factory Leave.fromJson(Map<String, dynamic> json) => Leave(
        all: json["all"],
        leaveApplication: json["leaveApplication"],
        holiday: json["holiday"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "leaveApplication": leaveApplication,
        "holiday": holiday,
    };
}

class Loan {
    bool? all;
    bool? addNewLoan;
    bool? loanReport;
    bool? loanApprovals;

    Loan({
        this.all,
        this.addNewLoan,
        this.loanReport,
        this.loanApprovals,
    });

    factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        all: json["all"],
        addNewLoan: json["addNewLoan"],
        loanReport: json["loanReport"],
        loanApprovals: json["loanApprovals"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "addNewLoan": addNewLoan,
        "loanReport": loanReport,
        "loanApprovals": loanApprovals,
    };
}

class Payroll {
    bool? all;
    bool? employeeSalary;
    bool? addPayroll;
    bool? payrollItem;
    bool? paySlip;

    Payroll({
        this.all,
        this.employeeSalary,
        this.addPayroll,
        this.payrollItem,
        this.paySlip,
    });

    factory Payroll.fromJson(Map<String, dynamic> json) => Payroll(
        all: json["all"],
        employeeSalary: json["employeeSalary"],
        addPayroll: json["addPayroll"],
        payrollItem: json["payrollItem"],
        paySlip: json["paySlip"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "employeeSalary": employeeSalary,
        "addPayroll": addPayroll,
        "payrollItem": payrollItem,
        "paySlip": paySlip,
    };
}
