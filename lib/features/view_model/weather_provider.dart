import 'package:flutter/material.dart';
import 'package:weather_24/features/model/cards.dart';
import 'package:weather_24/features/model/weather.dart';
import 'package:weather_24/services/weather_api.dart';

class WeatherProvider extends ChangeNotifier {
  final _api = WeatherApi(apiKey: "5fb0fd1d173c2197b0338dc61399408b");
  Weather? _weather;
  List<Cards> card = [
    Cards(
      icon: "assets/icons/feel_like.svg",
      property: "FEELS LIKE",
      unit: "°",
      description: "Similar to the actual temperature.",
    ),
    Cards(
      icon: "assets/icons/air_quality.svg",
      property: "HUMIDITY",
      unit: "%",
      description: "The dew point is 17 right now.",
    ),
    Cards(
      icon: "assets/icons/rain.svg",
      property: "PRESSURE",
      unit: "mBar",
      description: "",
    ),
    Cards(
      icon: "assets/icons/visibility.svg",
      property: "VISIBILITY",
      unit: "km",
      description: "Similar to the actual temperature.",
    ),
    Cards(
      icon: "assets/icons/wind.svg",
      property: "WIND SPEED",
      unit: "km/h",
      description: "",
    ),
  ];

  Weather? get weather => _weather;

  Future<void> fetchWeather() async {
    _weather = await _api.getWeather();
    notifyListeners();
  }

  Future<void> getData() async {
    card[0].value = _weather?.feelsLike;
    card[1].value = _weather?.humidity;
    card[2].value = _weather?.pressure;
    card[3].value = _weather?.visibility;
    card[4].value = _weather?.windSpeed;
    // notifyListeners();
  }
}
