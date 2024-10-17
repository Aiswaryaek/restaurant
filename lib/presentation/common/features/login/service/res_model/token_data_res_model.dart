class TokenData {
  String? id;
  String? role;
  String? branchId;
  String? admin;
  String? db;
  String? prefix;
  num? password;
  num? shiftType;
  bool? isTax;
  num? iat;
  num? exp;

  TokenData({
     this.id,
     this.role,
     this.branchId,
     this.admin,
     this.db,
     this.prefix,
     this.password,
     this.shiftType,
     this.isTax,
     this.iat,
     this.exp,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) {
    return TokenData(
      id: json['_id'],
      role: json['role'],
      branchId: json['branchId'],
      admin: json['admin'],
      db: json['db'],
      prefix: json['prefix'],
      password: json['password'],
      shiftType: json['shiftType'],
      isTax: json['isTax'],
      iat: json['iat'],
      exp: json['exp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'role': role,
      'branchId': branchId,
      'admin': admin,
      'db': db,
      'prefix': prefix,
      'password': password,
      'shiftType': shiftType,
      'isTax': isTax,
      'iat': iat,
      'exp': exp,
    };
  }
}
