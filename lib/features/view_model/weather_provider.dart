import 'package:flutter/material.dart';
import 'package:weather_24/features/model/weather.dart';
import 'package:weather_24/services/weather_api.dart';

class WeatherProvider extends ChangeNotifier {
  final _api = WeatherApi(apiKey: "5fb0fd1d173c2197b0338dc61399408b");
  Weather? _weather;

  Weather? get weather => _weather;

  Future<void> fetchWeather() async {
    _weather = await _api.getWeather();
    notifyListeners();
  }
}
