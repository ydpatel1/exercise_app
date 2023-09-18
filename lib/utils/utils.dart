import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

const bool _isPrintLog = true;

void printLog(String strLogMessage) {
  if (_isPrintLog) {
    debugPrint("----------LOG----------");
    debugPrint("-> $strLogMessage <-");
  }
}

class Utils {
  Utils._privateConstructor();

  static final Utils _instance = Utils._privateConstructor();

  static Utils get instance => _instance;

  // void showToastMessage(String? strMessage,
  //     {Color? backgroundColor, Color? textColor, ToastGravity? gravity}) {
  //   try {
  //     if (strMessage != null && strMessage.isNotEmpty) {
  //       Fluttertoast.cancel();
  //       Fluttertoast.showToast(
  //           msg: strMessage,
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: gravity ?? ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: backgroundColor,
  //           textColor: textColor,
  //           fontSize: 16.0);
  //     }
  //   } catch (ex) {
  //     printLog("ERROR : While showing toast message : ${ex.toString()}");
  //   }
  // }

  Future<bool> isNetworkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      // printLog("utils : Connectivity result : ${connectivityResult.toString()}");
      return false;
    } else {
      return true;
    }
  }

  // This method will check email id is valid or not
  bool isEmailValid(String? email) {
    if (email != null) {
      return RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);
    } else {
      return false;
    }
  }

  bool isOnlyCharacters(String? value) {
    if (value != null) {
      return RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(value);
    } else {
      return false;
    }
  }

  bool isOnlyName(String? value) {
    if (value != null) {
      return RegExp(r'^[a-zA-Z ]+$').hasMatch(value);
    } else {
      return false;
    }
  }

  // This method will check any string value is integer or not
  bool isValidInteger(String? str) {
    // Null or empty string is not a number
    if (str == null || str.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = int.tryParse(str);

    if (number == null) {
      return false;
    }

    return true;
  }

  // This method converts any type to double
  static double parseDynamicToDouble(dynamic dAmount) {
    double returnAmount = 0.00;
    String strAmount;
    try {
      if (dAmount == null) {
        return 0.00;
      }
      strAmount = dAmount.toString();
      if (strAmount.isNotEmpty) {
        if (strAmount.contains(",")) {
          strAmount = strAmount.replaceAll(",", "");
        }
        returnAmount = double.tryParse(strAmount) ?? 0.00;
      } else {
        returnAmount = 0.00;
      }
      return returnAmount;
    } catch (e) {
      printLog("ERROR : While convert to double : ${e.toString()}");
      return 0.00;
    }
  }

  // This method will check application is running on web or not
  bool isAppRunningOnWeb() {
    return kIsWeb;
  }

  // This method will return platform name on which app is running
  String getPlatformName() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "iOS";
    } else {
      return "NOP";
    }
  }

  // This method will return size of appbar
  double getAppBarImageSize() {
    try {
      return AppBar().preferredSize.height - 28;
    } catch (ex) {
      printLog("ERROR : While get size : ${ex.toString()}");
      return 30;
    }
  }
}
