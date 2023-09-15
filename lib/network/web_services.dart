import 'package:dio/dio.dart';

class MetanteiConanNetwork {
  final Dio _dio = Dio();
  Future<dynamic> get(
      {required String? url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers,
      bool withToken = false}) async {
    Response? res;
    if (headers != null) {
      _dio.options.headers = headers;
    } else if (withToken) {
      String token = ""; // get the token
      // await SharedHelper.sharedHelper!.readString(CachingKey.TOKEN);
      _dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Accept-Language': "US"
      };
    }
    try {
      res = await _dio.get(url!, queryParameters: query);
      // log_request(request: url, requestMethod: "GET", query: query ?? {}, headers: _dio!.options.headers);
      return res;
    } on DioError {}
  }
}
