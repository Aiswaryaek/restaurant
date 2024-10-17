// To parse this JSON data, do
//
//     final getAllEmployeesResModel = getAllEmployeesResModelFromJson(jsonString);

import 'dart:convert';

List<GetAllEmployeesResModel> getAllEmployeesResModelFromJson(String str) => List<GetAllEmployeesResModel>.from(json.decode(str).map((x) => GetAllEmployeesResModel.fromJson(x)));

String getAllEmployeesResModelToJson(List<GetAllEmployeesResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


///Mapping List of data into empty list
class AllEmployeesListResModel {
  List<GetAllEmployeesResModel> allEmployeesView;

  AllEmployeesListResModel({required this.allEmployeesView});

  factory AllEmployeesListResModel.fromJson(List<dynamic> parsedJson) {
    List<GetAllEmployeesResModel> allEmployeesView = parsedJson
        .map((json) => GetAllEmployeesResModel.fromJson(json))
        .toList();
    return AllEmployeesListResModel(allEmployeesView: allEmployeesView);
  }
}
///SingleList

class GetAllEmployeesResModel {
    String? id;
    String? empId;
    dynamic staffName;
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
    num? workHour;
    String? branchId;
    String? salaryType;
    int? monthlySalary;
    DateTime? contractPeriodFrm;
    DateTime? contractPeriodTo;
    bool? status;
    String? acHolder;
    num? acNo;
    String? bank;
    String? bankCode;
    String? bankLocation;
    String? pan;
    List<Document>? documents;
    dynamic dateOfLeaving;
    String? qrcode;
    String? adminId;
    String? outletLocation;
    num? v;
    List<AllowBranch>? allowBranches;
    String? establishment;
    String? designationName;
    String? departmentName;
    String? branchName;

    GetAllEmployeesResModel({
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
        this.v,
        this.allowBranches,
        this.establishment,
        this.designationName,
        this.departmentName,
        this.branchName,
    });

    factory GetAllEmployeesResModel.fromJson(Map<String, dynamic> json) => GetAllEmployeesResModel(
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
        documents: json["documents"] == null ? [] : List<Document>.from(json["documents"]!.map((x) => Document.fromJson(x))),
        dateOfLeaving: json["date_of_leaving"],
        qrcode: json["qrcode"],
        adminId: json["admin_id"],
        outletLocation: json["outletLocation"],
        v: json["__v"],
        allowBranches: json["allowBranches"] == null ? [] : List<AllowBranch>.from(json["allowBranches"]!.map((x) => AllowBranch.fromJson(x))),
        establishment: json["establishment"],
        designationName: json["designationName"],
        departmentName: json["departmentName"],
        branchName: json["branchName"],
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
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "country": country,
        "state": state,
        "imageUrl": imageUrl,
        "username": username,
        "password": password,
        "hash": hash,
        "salt": salt,
        "department": department,
        "designation": designation,
        "date_of_join": "${dateOfJoin!.year.toString().padLeft(4, '0')}-${dateOfJoin!.month.toString().padLeft(2, '0')}-${dateOfJoin!.day.toString().padLeft(2, '0')}",
        "workHour": workHour,
        "branchId": branchId,
        "salaryType": salaryType,
        "monthlySalary": monthlySalary,
        "contractPeriodFrm": "${contractPeriodFrm!.year.toString().padLeft(4, '0')}-${contractPeriodFrm!.month.toString().padLeft(2, '0')}-${contractPeriodFrm!.day.toString().padLeft(2, '0')}",
        "contractPeriodTo": "${contractPeriodTo!.year.toString().padLeft(4, '0')}-${contractPeriodTo!.month.toString().padLeft(2, '0')}-${contractPeriodTo!.day.toString().padLeft(2, '0')}",
        "status": status,
        "ac_holder": acHolder,
        "ac_no": acNo,
        "bank": bank,
        "bank_code": bankCode,
        "bankLocation": bankLocation,
        "pan": pan,
        "documents": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x.toJson())),
        "date_of_leaving": dateOfLeaving,
        "qrcode": qrcode,
        "admin_id": adminId,
        "outletLocation": outletLocation,
        "__v": v,
        "allowBranches": allowBranches == null ? [] : List<dynamic>.from(allowBranches!.map((x) => x.toJson())),
        "establishment": establishment,
        "designationName": designationName,
        "departmentName": departmentName,
        "branchName": branchName,
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

class Document {
    String? imageUrl;
    String? uuid;
    String? documentType;
    String? documentNumber;
    DateTime? expiryDate;

    Document({
        this.imageUrl,
        this.uuid,
        this.documentType,
        this.documentNumber,
        this.expiryDate,
    });

    factory Document.fromJson(Map<String, dynamic> json) => Document(
        imageUrl: json["imageUrl"],
        uuid: json["uuid"],
        documentType: json["documentType"],
        documentNumber: json["documentNumber"],
        expiryDate: json["expiryDate"] == null ? null : DateTime.parse(json["expiryDate"]),
    );

    Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "uuid": uuid,
        "documentType": documentType,
        "documentNumber": documentNumber,
        "expiryDate": "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
    };
}
                                                 