import 'package:get_it/get_it.dart';
import 'package:movie_search_app/services/http_services.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;
  late HTTPService _http;
  MovieService() {
    _http = getIt.get<HTTPService>();
  }
}
