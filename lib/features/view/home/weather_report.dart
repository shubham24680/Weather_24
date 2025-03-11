import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_24/core/utils/colors.dart';
import 'package:weather_24/core/widgets/text.dart';
import 'package:weather_24/features/view_model/weather_provider.dart';

class WeatherReport extends StatelessWidget {
  const WeatherReport({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<WeatherProvider>(context, listen: false);
    prov.fetchWeather();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Assistant(
          text: prov.weather?.cityName ?? "Loading City...",
          size: 34,
        ),
        Assistant(
          text: "${prov.weather?.temperature.round() ?? "..."}°",
          size: 96,
        ),
        Assistant(
          text: prov.weather?.mainConditon ?? "Loading...",
          color: white.withAlpha(150),
          weight: FontWeight.w600,
        ),
        Assistant(
          text:
              "H:${prov.weather?.tempMax ?? "0"}°  L:${prov.weather?.tempMin ?? "100"}°",
          weight: FontWeight.w600,
        ),
        Spacer(flex: 3),
        Assistant(
          text: "Swipe right for details",
          color: white.withAlpha(100),
        ),
        Spacer(),
      ],
    );
  }
}
