import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_canchas/core/api/core/constants.dart';
import 'package:test_canchas/core/api/core/http.dart';
import 'package:test_canchas/core/api/weather_api.dart';

import '../core/logger.dart';
import '../core/services/navigator_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;

class LocatorInjector {
  static final Logger _log = getLogger('LocatorInjector');

  static Future<void> setupLocator() async {
    _log.d('Initializing Navigator Service');
    locator.registerLazySingleton(() => NavigatorService());
  }
}

abstract class DependencyInjection {
  static Future<void> initialize() async {
    final Dio dio = Dio(BaseOptions(baseUrl: server));
    Logger logger = Logger();
    Http http = Http(dio: dio, logger: logger, logsEnabled: true);

    final weatherApi = WeatherAPI(http);

    final storage = await SharedPreferences.getInstance();

    locator.registerSingleton<WeatherAPI>(weatherApi);
  }
}
