// To parse this JSON data, do
//
//     final verifyPasswordResModel = verifyPasswordResModelFromJson(jsonString);

import 'dart:convert';

VerifyPasswordResModel verifyPasswordResModelFromJson(String str) => VerifyPasswordResModel.fromJson(json.decode(str));

String verifyPasswordResModelToJson(VerifyPasswordResModel data) => json.encode(data.toJson());

class VerifyPasswordResModel {
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
    int? dob;
    String? country;
    String? state;
    String? imageUrl;
    String? username;
    String? password;
    dynamic hash;
    dynamic salt;
    String? department;
    String? designation;
    int? dateOfJoin;
    int? workHour;
    String? branchId;
    String? salaryType;
    int? monthlySalary;
    int? contractPeriodFrm;
    int? contractPeriodTo;
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

    VerifyPasswordResModel({
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

    factory VerifyPasswordResModel.fromJson(Map<String, dynamic> json) => VerifyPasswordResModel(
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
        dob: json["dob"],
        country: json["country"],
        state: json["state"],
        imageUrl: json["imageUrl"],
        username: json["username"],
        password: json["password"],
        hash: json["hash"],
        salt: json["salt"],
        department: json["department"],
        designation: json["designation"],
        dateOfJoin: json["date_of_join"],
        workHour: json["workHour"],
        branchId: json["branchId"],
        salaryType: json["salaryType"],
        monthlySalary: json["monthlySalary"],
        contractPeriodFrm: json["contractPeriodFrm"],
        contractPeriodTo: json["contractPeriodTo"],
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
        "dob": dob,
        "country": country,
        "state": state,
        "imageUrl": imageUrl,
        "username": username,
        "password": password,
        "hash": hash,
        "salt": salt,
        "department": department,
        "designation": designation,
        "date_of_join": dateOfJoin,
        "workHour": workHour,
        "branchId": branchId,
        "salaryType": salaryType,
        "monthlySalary": monthlySalary,
        "contractPeriodFrm": contractPeriodFrm,
        "contractPeriodTo": contractPeriodTo,
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
