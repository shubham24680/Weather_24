import 'package:flutter/material.dart';

import 'package:weather_24/features/view/home/weather_report.dart';
import 'package:weather_24/features/view/home/weather_details.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Widget> _pages = [
    const WeatherReport(),
    const WeatherDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => _pages[index],
    );
  }
}
