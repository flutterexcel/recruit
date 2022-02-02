import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil _storageUtil;
  static SharedPreferences _preferences;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtil._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setDomain(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('domain', value);
  }

  static String getDomain({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('domain') ?? defValue;
  }

  static Future<bool> setUserEmail(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('userEmail', value);
  }

  static String getUserEmail({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('userEmail') ?? defValue;
  }

  static Future<bool> setPassword(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('password', value);
  }

  static String getPassword({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('password') ?? defValue;
  }

  static Future<bool> setId(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('id', value);
  }

  static String getId({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('id') ?? defValue;
  }

  static Future<bool> setToken(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('token', value);
  }

  static String getToken({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('token') ?? defValue;
  }

  static Future<bool> setLogo(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('logo', value);
  }

  static String getLogo({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('logo') ?? defValue;
  }

  static Future<bool> setUserName(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('username', value);
  }

  static String getUserName({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('username') ?? defValue;
  }

  static Future<bool> setUserProfileImage(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('userimage', value);
  }

  static String getUserProfileImage({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('userimage') ?? defValue;
  }

  static Future<bool> setUserPhone(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('userPhone', value);
  }

  static String getUserPhone({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('userPhone') ?? defValue;
  }

//sign in
  static Future<bool> setUserSign(String value) async {
    if (_preferences == null) return null;
    return _preferences.setString('userSign', value);
  }

  static String getUserSign({String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString('userSign') ?? defValue;
  }

  // ignore: missing_return
  static Future<bool> clearCredentials() async {
    if (StorageUtil.getUserEmail() == null) {
      throw Exception();
    } else {
      _preferences.clear();
    }
  }
}
