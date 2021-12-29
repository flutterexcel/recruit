class HiringTeamModel {
  String lastLogin;
  bool activeStatus;
  String sId;
  String email;
  String userType;
  String name;
  String imageName;
  String createdAt;
  String updatedAt;
  int iV;
  UserSetting userSetting;
  String id;
  String imageUrl;

  HiringTeamModel(
      {this.lastLogin,
      this.activeStatus,
      this.sId,
      this.email,
      this.userType,
      this.name,
      this.imageName,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.userSetting,
      this.id,
      this.imageUrl});

  HiringTeamModel.fromJson(Map<String, dynamic> json) {
    lastLogin = json['last_login'];
    activeStatus = json['activeStatus'];
    sId = json['_id'];
    email = json['email'];
    userType = json['user_type'];
    name = json['name'];
    imageName = json['imageName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    userSetting = json['user_setting'] != null
        ? new UserSetting.fromJson(json['user_setting'])
        : null;
    id = json['id'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_login'] = this.lastLogin;
    data['activeStatus'] = this.activeStatus;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['imageName'] = this.imageName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.userSetting != null) {
      data['user_setting'] = this.userSetting.toJson();
    }
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
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
