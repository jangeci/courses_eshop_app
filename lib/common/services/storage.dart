import 'dart:convert';

import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getString(String key) {
    return _pref.getString(key) ?? '';
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ?? false;
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) != null;
  }

  UserProfileModel getUserProfile() {
    // var json =  _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? '';
    var json = {'name': 'John Doe'};

    var profileJson = jsonDecode(jsonEncode(json));
    return UserProfileModel.fromJson(profileJson);
  }
}
