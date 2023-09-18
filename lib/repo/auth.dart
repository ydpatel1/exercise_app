import 'package:dio/dio.dart';

import '../api/api.dart';
import '../api/api_result.dart';
import '../utils/dialog_utils.dart';
import '../utils/shared_preference_utils.dart';

class AuthandUpdateRepo {
  static Api api = Api();
  static Future<ApiResult<String>> loginapi() async {
    try {
      var resposne = await api.sendRequest.post("auth/login/",
          data: {"email": "sdffgm@gmail.com", "password": "Admin@123"});

      if (resposne.statusCode == 200) {
        print(resposne.data);
        SharedPreferenceUtils().setLoginToken(resposne.data["data"]["access"]);
        SharedPreferenceUtils()
            .setRefreshToken(resposne.data["data"]["refresh"]);
        return Sucsess(data: resposne.data["data"]["access"]);
      } else {
        showCustomSanckBar("Some With want rong");
        return Failure(error: "Some With want rong");
      }
    } catch (e, s) {
      print(e);
      print(s);
      if (e is DioException) {
        if (e.response?.data != null) {
          showCustomSanckBar((e.response?.data as Map)["message"]);
          return Failure(error: (e.response?.data as Map)["message"]);
        }
      } else {
        showCustomSanckBar("Some With want rong");
      }
      return Failure(error: e.toString());
    }
  }

  static Future<ApiResult<String>> updateUser(List<String> list) async {
    try {
      var resposne = await api.sendRequest.post("user/update_user/", data: {
        "active_breaks": {"recommended": false, "breaks": list}
      });

      if (resposne.statusCode == 200) {
        print(resposne.data);
        return Sucsess(data: resposne.data["message"]);
      } else {
        showCustomSanckBar("Some With want rong");
        return Failure(error: "Some With want rong");
      }
    } catch (e, s) {
      print(e);
      print(s);
      if (e is DioException) {
        if (e.response?.data != null) {
          showCustomSanckBar((e.response?.data as Map)["message"]);
          return Failure(error: (e.response?.data as Map)["message"]);
        }
      } else {
        showCustomSanckBar("Some With want rong");
      }
      return Failure(error: e.toString());
    }
  }
}
