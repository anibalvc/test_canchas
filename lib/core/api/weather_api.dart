import 'package:test_canchas/core/api/core/http.dart';

import '../models/api_response.dart';

class WeatherAPI {
  final Http _http;
  WeatherAPI(this._http);

  Future<Object> getData() {
    return _http.request(
      '/data/2.5/forecast',
      method: 'GET',
      queryParameters: {
        "lat": '-78.5',
        "lon": '38.5',
        'appid': '8461cf748c4abda66d59dec9c0e3b739'
      },
      parser: (data) {
        return Response.fromJson(data);
      },
    );
  }
}
