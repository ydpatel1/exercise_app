import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/all_config.dart';
import 'utils.dart';

abstract class PreferenceStateBase {
  @protected
  SharedPreferences? _sharedPrefs;

  Future<bool> performLogout() async {
    return _sharedPrefs!.setString(AppConst.keyLoginToken, "");
  }

  SharedPreferences? getSharedPrefs() {
    return _sharedPrefs;
  }

  void setLoginToken(String? value) async {
    if (value != null && _sharedPrefs != null) {
      if (value.isNotEmpty) {
        await _sharedPrefs!.setString(AppConst.keyLoginToken, value);
      } else {
        printLog("-------> ACCESS TOKEN SET WITH EMPTY : $value is empty");
      }
    } else {
      printLog(
          "-------> ACCESS TOKEN SET WITH NULL : ${value.toString()} , ${_sharedPrefs.toString()}");
    }
  }

  void setRefreshToken(String? value) async {
    if (value != null && _sharedPrefs != null) {
      if (value.isNotEmpty) {
        await _sharedPrefs!.setString(AppConst.keyRefreshToken, value);
      } else {
        printLog("-------> ACCESS TOKEN SET WITH EMPTY : $value is empty");
      }
    } else {
      printLog(
          "-------> ACCESS TOKEN SET WITH NULL : ${value.toString()} , ${_sharedPrefs.toString()}");
    }
  }

  Future<String> getLoginToken() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
    if (_sharedPrefs != null &&
        _sharedPrefs!.getString(AppConst.keyLoginToken) != null) {
      return _sharedPrefs!.getString(AppConst.keyLoginToken) ?? "";
    } else {
      return "";
    }
  }

  Future<String> getRefreshToken() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
    if (_sharedPrefs != null &&
        _sharedPrefs!.getString(AppConst.keyRefreshToken) != null) {
      return _sharedPrefs!.getString(AppConst.keyRefreshToken) ?? "";
    } else {
      return "";
    }
  }
}

class SharedPreferenceUtils extends PreferenceStateBase {
  static final SharedPreferenceUtils _instance =
      SharedPreferenceUtils._internal();

  factory SharedPreferenceUtils() {
    return _instance;
  }

  SharedPreferenceUtils._internal() {
    SharedPreferences.getInstance().then((value) {
      _sharedPrefs = value;
    });
  }
}
