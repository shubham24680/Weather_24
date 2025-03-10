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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        Assistant(
          text: prov.weather?.cityName ?? "Las Vegas",
          size: 34,
        ),
        Assistant(
          text: "${prov.weather?.temperature.round() ?? "19"}°",
          size: 96,
        ),
        Assistant(
          text: prov.weather?.mainConditon ?? "Mostly clear",
          color: white.withAlpha(150),
          weight: FontWeight.w600,
        ),
        Assistant(
          text: "H:24°  L:18°",
          weight: FontWeight.w600,
        ),
        Spacer(flex: 6),
        Assistant(
          text: "Swipe right for details",
          color: white.withAlpha(100),
        ),
        Spacer(),
      ],
    );
  }
}
