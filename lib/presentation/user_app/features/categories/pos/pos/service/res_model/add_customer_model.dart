// To parse this JSON data, do
//
//     final addCustomerResModel = addCustomerResModelFromJson(jsonString);

import 'dart:convert';

AddCustomerResModel addCustomerResModelFromJson(String str) => AddCustomerResModel.fromJson(json.decode(str));

String addCustomerResModelToJson(AddCustomerResModel data) => json.encode(data.toJson());

class AddCustomerResModel {
    int? cusId;
    String? name;
    String? mobileNo;
    String? streetName;
    dynamic landMark;
    dynamic email;
    dynamic refferedBy;
    dynamic gst;
    bool? status;
    dynamic points;
    String? branchId;
    dynamic relId;
    dynamic alternateNumber;
    bool? isVendor;
    String? city;
    dynamic country;
    dynamic state;
    dynamic phone;
    dynamic payTerm;
    dynamic supplierCurrency;
    dynamic contactPerson;
    dynamic contactPersonMobile;
    dynamic companyCode;
    dynamic imageUrl;
    dynamic customerGroup;
    bool? isCustomer;
    bool? isCashCustomer;
    String? roomNo;
    String? buildingNo;
    String? buildingName;
    String? id;
    int? v;

    AddCustomerResModel({
        this.cusId,
        this.name,
        this.mobileNo,
        this.streetName,
        this.landMark,
        this.email,
        this.refferedBy,
        this.gst,
        this.status,
        this.points,
        this.branchId,
        this.relId,
        this.alternateNumber,
        this.isVendor,
        this.city,
        this.country,
        this.state,
        this.phone,
        this.payTerm,
        this.supplierCurrency,
        this.contactPerson,
        this.contactPersonMobile,
        this.companyCode,
        this.imageUrl,
        this.customerGroup,
        this.isCustomer,
        this.isCashCustomer,
        this.roomNo,
        this.buildingNo,
        this.buildingName,
        this.id,
        this.v,
    });

    factory AddCustomerResModel.fromJson(Map<String, dynamic> json) => AddCustomerResModel(
        cusId: json["cusId"],
        name: json["name"],
        mobileNo: json["mobileNo"],
        streetName: json["streetName"],
        landMark: json["landMark"],
        email: json["email"],
        refferedBy: json["refferedBy"],
        gst: json["gst"],
        status: json["status"],
        points: json["points"],
        branchId: json["branchId"],
        relId: json["relId"],
        alternateNumber: json["alternateNumber"],
        isVendor: json["isVendor"],
        city: json["city"],
        country: json["country"],
        state: json["state"],
        phone: json["phone"],
        payTerm: json["payTerm"],
        supplierCurrency: json["supplierCurrency"],
        contactPerson: json["contactPerson"],
        contactPersonMobile: json["contactPersonMobile"],
        companyCode: json["companyCode"],
        imageUrl: json["imageUrl"],
        customerGroup: json["customerGroup"],
        isCustomer: json["isCustomer"],
        isCashCustomer: json["isCashCustomer"],
        roomNo: json["roomNo"],
        buildingNo: json["buildingNo"],
        buildingName: json["buildingName"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "cusId": cusId,
        "name": name,
        "mobileNo": mobileNo,
        "streetName": streetName,
        "landMark": landMark,
        "email": email,
        "refferedBy": refferedBy,
        "gst": gst,
        "status": status,
        "points": points,
        "branchId": branchId,
        "relId": relId,
        "alternateNumber": alternateNumber,
        "isVendor": isVendor,
        "city": city,
        "country": country,
        "state": state,
        "phone": phone,
        "payTerm": payTerm,
        "supplierCurrency": supplierCurrency,
        "contactPerson": contactPerson,
        "contactPersonMobile": contactPersonMobile,
        "companyCode": companyCode,
        "imageUrl": imageUrl,
        "customerGroup": customerGroup,
        "isCustomer": isCustomer,
        "isCashCustomer": isCashCustomer,
        "roomNo": roomNo,
        "buildingNo": buildingNo,
        "buildingName": buildingName,
        "_id": id,
        "__v": v,
    };
}
