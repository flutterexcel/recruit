class UserModel {
  int status;
  String token;
  String role;
  bool firstLogin;
  UserDetails userDetails;
  bool imapExist;
  bool jobProfileExist;

  UserModel(
      {this.status,
      this.token,
      this.role,
      this.firstLogin,
      this.userDetails,
      this.imapExist,
      this.jobProfileExist});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    role = json['role'];
    firstLogin = json['firstLogin'];
    userDetails = json['userDetails'] != null
        ? new UserDetails.fromJson(json['userDetails'])
        : null;
    imapExist = json['imapExist'];
    jobProfileExist = json['jobProfileExist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    data['role'] = this.role;
    data['firstLogin'] = this.firstLogin;
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails.toJson();
    }
    data['imapExist'] = this.imapExist;
    data['jobProfileExist'] = this.jobProfileExist;
    return data;
  }
}

class UserDetails {
  String lastLogin;
  bool activeStatus;
  String sId;
  String email;
  String password;
  String userType;
  String name;
  String imageName;
  String createdAt;
  String updatedAt;
  int iV;
  UserSetting userSetting;
  int phoneNo;
  String signature;
  String id;

  UserDetails(
      {this.lastLogin,
      this.activeStatus,
      this.sId,
      this.email,
      this.password,
      this.userType,
      this.name,
      this.imageName,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.userSetting,
      this.phoneNo,
      this.signature,
      this.id});

  UserDetails.fromJson(Map<String, dynamic> json) {
    lastLogin = json['last_login'];
    activeStatus = json['activeStatus'];
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    userType = json['user_type'];
    name = json['name'];
    imageName = json['imageName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    userSetting = json['user_setting'] != null
        ? new UserSetting.fromJson(json['user_setting'])
        : null;
    phoneNo = json['phoneNo'];
    signature = json['signature'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_login'] = this.lastLogin;
    data['activeStatus'] = this.activeStatus;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['imageName'] = this.imageName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.userSetting != null) {
      data['user_setting'] = this.userSetting.toJson();
    }
    data['phoneNo'] = this.phoneNo;
    data['signature'] = this.signature;
    data['id'] = this.id;
    return data;
  }
}

class UserSetting {
  bool firstLogin;
  bool dtAgain;

  UserSetting({this.firstLogin, this.dtAgain});

  UserSetting.fromJson(Map<String, dynamic> json) {
    firstLogin = json['firstLogin'];
    dtAgain = json['dtAgain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstLogin'] = this.firstLogin;
    data['dtAgain'] = this.dtAgain;
    return data;
  }
}
