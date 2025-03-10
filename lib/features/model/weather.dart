class Weather {
  final String cityName;
  final String mainConditon;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int visibility;

  Weather({
    required this.cityName,
    required this.mainConditon,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      mainConditon: json["weather"][0]["main"],
      temperature: json["main"]["temp"],
      feelsLike: json["main"]["feels_like"],
      tempMin: json["main"]["temp_min"],
      tempMax: json["main"]["temp_max"],
      pressure: json["main"]["pressure"],
      humidity: json["main"]["humidity"],
      windSpeed: json["wind"]["speed"],
      visibility: json["visibility"],
    );
  }
}
