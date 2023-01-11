import 'package:test_canchas/core/api/core/api_status.dart';
import 'package:test_canchas/core/api/weather_api.dart';
import 'package:test_canchas/core/base/base_view_model.dart';
import 'package:test_canchas/core/locator.dart';
import 'package:test_canchas/core/models/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:test_canchas/widgets/app_dialogs.dart';

class HomeViewModel extends BaseViewModel {
  bool _loading = false;

  final _weatherApi = locator<WeatherAPI>();

  final logger = Logger();

  late Response response;

  HomeViewModel();

  Future<void> onInit(BuildContext context) async {}
  Future<void> prueba(BuildContext context) async {
    var resp = await _weatherApi.getData();
    if (resp is Success<Response>) {
      Dialogs.alert(context,
          tittle: "Titulo",
          description: [resp.response.rainData.first.probability.toString()]);
    }
    _weatherApi.getData();
  }
}
