import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_24/features/view/layout.dart';
import 'package:weather_24/features/view_model/home_provider.dart';
import 'package:weather_24/features/view_model/weather_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ],
        child: Layout(),
      ),
    );
  }
}
