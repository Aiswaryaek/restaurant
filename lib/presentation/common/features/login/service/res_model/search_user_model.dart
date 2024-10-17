
class SearchUserModel {
  String? role;
  String? logo;
  String? companyName;

  SearchUserModel({
     this.role,
     this.logo,
     this.companyName,
  });

  factory SearchUserModel.fromJson(Map<String, dynamic> json) {
    return SearchUserModel(
      role: json['role'],
      logo: json['logo'],
      companyName: json['companyName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'logo': logo,
      'companyName': companyName,
    };
  }
}
