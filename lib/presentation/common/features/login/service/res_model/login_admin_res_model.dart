// To parse this JSON data, do
//
//     final loginAdminResModel = loginAdminResModelFromJson(jsonString);

import 'dart:convert';

LoginAdminResModel loginAdminResModelFromJson(String str) => LoginAdminResModel.fromJson(json.decode(str));

String loginAdminResModelToJson(LoginAdminResModel data) => json.encode(data.toJson());

class LoginAdminResModel {
    Data? data;
    int? status;
    String? token;
    String? imageUrl;
    String? logo;
    String? userName;
    String? branchId;
    String? branchPk;
    String? branchName;
    String? storeName;
    String? currency;
    Permission? permission;

    LoginAdminResModel({
        this.data,
        this.status,
        this.token,
        this.imageUrl,
        this.logo,
        this.userName,
        this.branchId,
        this.branchPk,
        this.branchName,
        this.storeName,
        this.currency,
        this.permission,
    });

    factory LoginAdminResModel.fromJson(Map<String, dynamic> json) => LoginAdminResModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        status: json["status"],
        token: json["token"],
        imageUrl: json["imageUrl"],
        logo: json["logo"],
        userName: json["userName"],
        branchId: json["branchId"],
        branchPk: json["branchPk"],
        branchName: json["branchName"],
        storeName: json["storeName"],
        currency: json["currency"],
        permission: json["permission"] == null ? null : Permission.fromJson(json["permission"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
        "token": token,
        "imageUrl": imageUrl,
        "logo": logo,
        "userName": userName,
        "branchId": branchId,
        "branchPk": branchPk,
        "branchName": branchName,
        "storeName": storeName,
        "currency": currency,
        "permission": permission?.toJson(),
    };
}

class Data {
    Profile? profile;
    Bank? bank;
    Gst? gst;
    String? id;
    String? userName;
    String? password;
    String? db;
    String? salt;
    int? code;
    bool? firstLogin;
    dynamic discount;
    dynamic upi;
    String? terms;
    String? nativeTerms;
    dynamic rewardCriteria;
    bool? enableBackup;
    int? v;
    String? template;
    int? shiftType;
    int? packtoDate;
    String? templateModel;
    int? posReceiptTemplate;
    int? noOfBranches;
    String? packageId;

    Data({
        this.profile,
        this.bank,
        this.gst,
        this.id,
        this.userName,
        this.password,
        this.db,
        this.salt,
        this.code,
        this.firstLogin,
        this.discount,
        this.upi,
        this.terms,
        this.nativeTerms,
        this.rewardCriteria,
        this.enableBackup,
        this.v,
        this.template,
        this.shiftType,
        this.packtoDate,
        this.templateModel,
        this.posReceiptTemplate,
        this.noOfBranches,
        this.packageId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
        gst: json["gst"] == null ? null : Gst.fromJson(json["gst"]),
        id: json["_id"],
        userName: json["userName"],
        password: json["password"],
        db: json["db"],
        salt: json["salt"],
        code: json["code"],
        firstLogin: json["firstLogin"],
        discount: json["discount"],
        upi: json["upi"],
        terms: json["terms"],
        nativeTerms: json["nativeTerms"],
        rewardCriteria: json["rewardCriteria"],
        enableBackup: json["enableBackup"],
        v: json["__v"],
        template: json["template"],
        shiftType: json["shiftType"],
        packtoDate: json["packtoDate"],
        templateModel: json["templateModel"],
        posReceiptTemplate: json["posReceiptTemplate"],
        noOfBranches: json["noOfBranches"],
        packageId: json["packageId"],
    );

    Map<String, dynamic> toJson() => {
        "profile": profile?.toJson(),
        "bank": bank?.toJson(),
        "gst": gst?.toJson(),
        "_id": id,
        "userName": userName,
        "password": password,
        "db": db,
        "salt": salt,
        "code": code,
        "firstLogin": firstLogin,
        "discount": discount,
        "upi": upi,
        "terms": terms,
        "nativeTerms": nativeTerms,
        "rewardCriteria": rewardCriteria,
        "enableBackup": enableBackup,
        "__v": v,
        "template": template,
        "shiftType": shiftType,
        "packtoDate": packtoDate,
        "templateModel": templateModel,
        "posReceiptTemplate": posReceiptTemplate,
        "noOfBranches": noOfBranches,
        "packageId": packageId,
    };
}

class Bank {
    String? accountHolderName;
    String? accountType;
    String? accountNumber;
    String? ifscCode;

    Bank({
        this.accountHolderName,
        this.accountType,
        this.accountNumber,
        this.ifscCode,
    });

    factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        accountHolderName: json["accountHolderName"],
        accountType: json["accountType"],
        accountNumber: json["accountNumber"],
        ifscCode: json["ifscCode"],
    );

    Map<String, dynamic> toJson() => {
        "accountHolderName": accountHolderName,
        "accountType": accountType,
        "accountNumber": accountNumber,
        "ifscCode": ifscCode,
    };
}

class Gst {
    String? sellerRegisteredNumber;
    String? gstNumber;
    String? panNumber;
    String? productTaxCode;
    bool? isTax;

    Gst({
        this.sellerRegisteredNumber,
        this.gstNumber,
        this.panNumber,
        this.productTaxCode,
        this.isTax,
    });

    factory Gst.fromJson(Map<String, dynamic> json) => Gst(
        sellerRegisteredNumber: json["sellerRegisteredNumber"],
        gstNumber: json["gstNumber"],
        panNumber: json["panNumber"],
        productTaxCode: json["productTaxCode"],
        isTax: json["isTax"],
    );

    Map<String, dynamic> toJson() => {
        "sellerRegisteredNumber": sellerRegisteredNumber,
        "gstNumber": gstNumber,
        "panNumber": panNumber,
        "productTaxCode": productTaxCode,
        "isTax": isTax,
    };
}

class Profile {
    String? logo;
    String? prefix;
    String? companyAddress;
    String? companyEmail;
    String? companyName;
    String? contactNumber;
    String? country;
    String? currency;
    String? nativeCompanyName;
    String? website;
    String? nativeCompanyAddress;
    String? contactPerson;
    String? language;

    Profile({
        this.logo,
        this.prefix,
        this.companyAddress,
        this.companyEmail,
        this.companyName,
        this.contactNumber,
        this.country,
        this.currency,
        this.nativeCompanyName,
        this.website,
        this.nativeCompanyAddress,
        this.contactPerson,
        this.language,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        logo: json["logo"],
        prefix: json["prefix"],
        companyAddress: json["companyAddress"],
        companyEmail: json["companyEmail"],
        companyName: json["companyName"],
        contactNumber: json["contactNumber"],
        country: json["country"],
        currency: json["currency"],
        nativeCompanyName: json["nativeCompanyName"],
        website: json["website"],
        nativeCompanyAddress: json["nativeCompanyAddress"],
        contactPerson: json["contactPerson"],
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "logo": logo,
        "prefix": prefix,
        "companyAddress": companyAddress,
        "companyEmail": companyEmail,
        "companyName": companyName,
        "contactNumber": contactNumber,
        "country": country,
        "currency": currency,
        "nativeCompanyName": nativeCompanyName,
        "website": website,
        "nativeCompanyAddress": nativeCompanyAddress,
        "contactPerson": contactPerson,
        "language": language,
    };
}

class Permission {
    bool? dashboard;
    bool? products;
    PointOfSales? pointOfSales;
    Map<String, bool>? purchase;
    Inventory? inventory;
    Sales? sales;
    FoodManagement? foodManagement;
    PermissionReport? report;
    Accounts? accounts;
    Staff? staff;
    bool? deviceSettings;
    bool? generateQrBarcode;

    Permission({
        this.dashboard,
        this.products,
        this.pointOfSales,
        this.purchase,
        this.inventory,
        this.sales,
        this.foodManagement,
        this.report,
        this.accounts,
        this.staff,
        this.deviceSettings,
        this.generateQrBarcode,
    });

    factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        dashboard: json["dashboard"],
        products: json["products"],
        pointOfSales: json["pointOfSales"] == null ? null : PointOfSales.fromJson(json["pointOfSales"]),
        purchase: Map.from(json["purchase"]!).map((k, v) => MapEntry<String, bool>(k, v)),
        inventory: json["inventory"] == null ? null : Inventory.fromJson(json["inventory"]),
        sales: json["sales"] == null ? null : Sales.fromJson(json["sales"]),
        foodManagement: json["foodManagement"] == null ? null : FoodManagement.fromJson(json["foodManagement"]),
        report: json["report"] == null ? null : PermissionReport.fromJson(json["report"]),
        accounts: json["accounts"] == null ? null : Accounts.fromJson(json["accounts"]),
        staff: json["staff"] == null ? null : Staff.fromJson(json["staff"]),
        deviceSettings: json["deviceSettings"],
        generateQrBarcode: json["generateQrBarcode"],
    );

    Map<String, dynamic> toJson() => {
        "dashboard": dashboard,
        "products": products,
        "pointOfSales": pointOfSales?.toJson(),
        "purchase": Map.from(purchase!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "inventory": inventory?.toJson(),
        "sales": sales?.toJson(),
        "foodManagement": foodManagement?.toJson(),
        "report": report?.toJson(),
        "accounts": accounts?.toJson(),
        "staff": staff?.toJson(),
        "deviceSettings": deviceSettings,
        "generateQrBarcode": generateQrBarcode,
    };
}

class Accounts {
    bool? all;
    bool? dashboard;
    Customers? customers;
    Vendor? vendor;
    Accounting? accounting;
    Reconcilation? reconcilation;
    Vatreport? vatreport;
    AccountsReport? report;
    bool? configuration;

    Accounts({
        this.all,
        this.dashboard,
        this.customers,
        this.vendor,
        this.accounting,
        this.reconcilation,
        this.vatreport,
        this.report,
        this.configuration,
    });

    factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
        all: json["all"],
        dashboard: json["dashboard"],
        customers: json["customers"] == null ? null : Customers.fromJson(json["customers"]),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        accounting: json["accounting"] == null ? null : Accounting.fromJson(json["accounting"]),
        reconcilation: json["reconcilation"] == null ? null : Reconcilation.fromJson(json["reconcilation"]),
        vatreport: json["vatreport"] == null ? null : Vatreport.fromJson(json["vatreport"]),
        report: json["report"] == null ? null : AccountsReport.fromJson(json["report"]),
        configuration: json["configuration"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "dashboard": dashboard,
        "customers": customers?.toJson(),
        "vendor": vendor?.toJson(),
        "accounting": accounting?.toJson(),
        "reconcilation": reconcilation?.toJson(),
        "vatreport": vatreport?.toJson(),
        "report": report?.toJson(),
        "configuration": configuration,
    };
}

class Accounting {
    bool? journal;
    bool? chartofaccounts;
    bool? openingBalance;
    bool? journalEntries;

    Accounting({
        this.journal,
        this.chartofaccounts,
        this.openingBalance,
        this.journalEntries,
    });

    factory Accounting.fromJson(Map<String, dynamic> json) => Accounting(
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

class Vendor {
    bool? vendorBills;
    bool? purchasewpo;
    bool? payments;
    bool? debitNotes;
    bool? vendors;

    Vendor({
        this.vendorBills,
        this.purchasewpo,
        this.payments,
        this.debitNotes,
        this.vendors,
    });

    factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
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
    bool? all;
    Products? products;
    Operations? operations;
    Reports? reports;
    InventoryConfiguration? configuration;

    Inventory({
        this.all,
        this.products,
        this.operations,
        this.reports,
        this.configuration,
    });

    factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        all: json["all"],
        products: json["products"] == null ? null : Products.fromJson(json["products"]),
        operations: json["operations"] == null ? null : Operations.fromJson(json["operations"]),
        reports: json["reports"] == null ? null : Reports.fromJson(json["reports"]),
        configuration: json["configuration"] == null ? null : InventoryConfiguration.fromJson(json["configuration"]),
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "products": products?.toJson(),
        "operations": operations?.toJson(),
        "reports": reports?.toJson(),
        "configuration": configuration?.toJson(),
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

class Reports {
    bool? stockMoveReport;

    Reports({
        this.stockMoveReport,
    });

    factory Reports.fromJson(Map<String, dynamic> json) => Reports(
        stockMoveReport: json["stockMoveReport"],
    );

    Map<String, dynamic> toJson() => {
        "stockMoveReport": stockMoveReport,
    };
}

class PointOfSales {
    bool? all;
    bool? billing;
    bool? specialItems;
    General? general;
    PointOfSalesReport? report;
    Expense? expense;
    bool? kot;
    bool? customerDisplay;
    bool? tokenDisplay;
    bool? floorManagement;
    PointOfSalesConfiguration? configuration;

    PointOfSales({
        this.all,
        this.billing,
        this.specialItems,
        this.general,
        this.report,
        this.expense,
        this.kot,
        this.customerDisplay,
        this.tokenDisplay,
        this.floorManagement,
        this.configuration,
    });

    factory PointOfSales.fromJson(Map<String, dynamic> json) => PointOfSales(
        all: json["all"],
        billing: json["billing"],
        specialItems: json["specialItems"],
        general: json["general"] == null ? null : General.fromJson(json["general"]),
        report: json["report"] == null ? null : PointOfSalesReport.fromJson(json["report"]),
        expense: json["expense"] == null ? null : Expense.fromJson(json["expense"]),
        kot: json["kot"],
        customerDisplay: json["customerDisplay"],
        tokenDisplay: json["tokenDisplay"],
        floorManagement: json["floorManagement"],
        configuration: json["configuration"] == null ? null : PointOfSalesConfiguration.fromJson(json["configuration"]),
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "billing": billing,
        "specialItems": specialItems,
        "general": general?.toJson(),
        "report": report?.toJson(),
        "expense": expense?.toJson(),
        "kot": kot,
        "customerDisplay": customerDisplay,
        "tokenDisplay": tokenDisplay,
        "floorManagement": floorManagement,
        "configuration": configuration?.toJson(),
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

class Expense {
    bool? staffExpense;
    bool? outletExpense;
    bool? addExpenseType;

    Expense({
        this.staffExpense,
        this.outletExpense,
        this.addExpenseType,
    });

    factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        staffExpense: json["staffExpense"],
        outletExpense: json["outletExpense"],
        addExpenseType: json["addExpenseType"],
    );

    Map<String, dynamic> toJson() => {
        "staffExpense": staffExpense,
        "outletExpense": outletExpense,
        "addExpenseType": addExpenseType,
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
    bool? all;
    bool? stockreport;
    bool? expenseReport;

    PermissionReport({
        this.all,
        this.stockreport,
        this.expenseReport,
    });

    factory PermissionReport.fromJson(Map<String, dynamic> json) => PermissionReport(
        all: json["all"],
        stockreport: json["stockreport"],
        expenseReport: json["expenseReport"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "stockreport": stockreport,
        "expenseReport": expenseReport,
    };
}

class Sales {
    bool? all;
    bool? quotation;
    bool? salesOrder;
    bool? deliveryNote;
    bool? customers;
    SalesReport? report;

    Sales({
        this.all,
        this.quotation,
        this.salesOrder,
        this.deliveryNote,
        this.customers,
        this.report,
    });

    factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        all: json["all"],
        quotation: json["quotation"],
        salesOrder: json["salesOrder"],
        deliveryNote: json["deliveryNote"],
        customers: json["customers"],
        report: json["report"] == null ? null : SalesReport.fromJson(json["report"]),
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "quotation": quotation,
        "salesOrder": salesOrder,
        "deliveryNote": deliveryNote,
        "customers": customers,
        "report": report?.toJson(),
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
    bool? all;
    Hrm? hrm;

    Staff({
        this.all,
        this.hrm,
    });

    factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        all: json["all"],
        hrm: json["hrm"] == null ? null : Hrm.fromJson(json["hrm"]),
    );

    Map<String, dynamic> toJson() => {
        "all": all,
        "hrm": hrm?.toJson(),
    };
}

class Hrm {
    bool? department;
    bool? designation;
    bool? manageEmployee;
    bool? addEmployee;
    bool? addDocument;

    Hrm({
        this.department,
        this.designation,
        this.manageEmployee,
        this.addEmployee,
        this.addDocument,
    });

    factory Hrm.fromJson(Map<String, dynamic> json) => Hrm(
        department: json["department"],
        designation: json["designation"],
        manageEmployee: json["manageEmployee"],
        addEmployee: json["addEmployee"],
        addDocument: json["addDocument"],
    );

    Map<String, dynamic> toJson() => {
        "department": department,
        "designation": designation,
        "manageEmployee": manageEmployee,
        "addEmployee": addEmployee,
        "addDocument": addDocument,
    };
}
