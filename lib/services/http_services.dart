import '../models/app_config.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  String _base_url = '';
  String _api_key = '';

  HTTPService() {
    AppConfig _config = getIt.get<AppConfig>();
    _base_url = _config.BASE_API_URL;
    _api_key = _config.API_KEY;
  }

  Future<Response> get(String _path,
      {required Map<String, dynamic> query}) async {
    try {
      //google.com/movie/popular
      //base url=google.com
      //path=movie/popular
      String _url = '$_base_url$_path';
      Map<String, dynamic> _query = {
        'api_key': _api_key,
        'language': 'en-us',
      };

      if (query != null) {
        _query.addAll(query);
      }

      return await dio.get(_url, queryParameters: _query);
    } on DioException catch (e) {
      print('unable to perform get request');
      print('DioError:$e');
      throw e;
    }
  }
}
