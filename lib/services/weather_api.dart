import 'dart:convert';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:weather_24/features/model/weather.dart';

class WeatherApi {
  final String baseURL = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherApi({required this.apiKey});

  Future<Weather> getWeather() async {
    // Get permission for User
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    log("Successfully getting permission.");

    // Fetch current location
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 10,
      ),
    );
    log("Successfully got position: ${position.latitude}, ${position.longitude}");

    final Uri url = Uri.parse(
        "$baseURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed connection.");
    }
  }
}
