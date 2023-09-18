import 'package:dio/dio.dart';
import '../utils/shared_preference_utils.dart';
import '../utils/utils.dart';

class Api {
  late Dio _dio;
  Api._instance() {
    _dio = Dio();
    _dio
      ..options.baseUrl = "http://16.171.185.228/api/v1/"
      ..options.contentType = Headers.jsonContentType
      ..interceptors.add(ApiProviderTokenInterceptor())
      ..options.responseType = ResponseType.json;
  }
  static final Api _api = Api._instance();
  factory Api() => _api;
  Dio get sendRequest => _dio;
}

class ApiProviderTokenInterceptor extends Interceptor {
  ApiProviderTokenInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    bool isNetworkConnected = await Utils.instance.isNetworkConnected();
    if (!isNetworkConnected) {
      return handler.reject(DioException.badResponse(
          statusCode: 404,
          requestOptions: options,
          response: Response(
              data: {"message": "No Internet"}, requestOptions: options)));
    } else {
      if (!options.headers.containsKey("Authorization")) {
        if (options.uri !=
            Uri.parse("http://16.171.185.228/api/v1/auth/login/")) {
          var token = await SharedPreferenceUtils().getLoginToken();
          options.headers.addAll({'Authorization': "JWT $token"});
        }
      }
      return handler.next(options);
    }
  }
}
