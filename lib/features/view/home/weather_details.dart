import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_24/core/utils/colors.dart';
import 'package:weather_24/core/widgets/weather_card.dart';
import 'package:weather_24/core/widgets/text.dart';
import 'package:weather_24/features/view_model/weather_provider.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 0.8,
              colors: [
                backgroundPurple.withAlpha(100),
                backgroundPurple.withAlpha(120),
              ],
            ),
          ),
          child: FutureBuilder(
            future:
                Provider.of<WeatherProvider>(context, listen: false).getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: purple),
                );
              } else if (snapshot.hasError) {
                return Assistant(text: "Error while loading...");
              } else {
                final prov = Provider.of<WeatherProvider>(context);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        children: [
                          Assistant(
                            text: prov.weather?.cityName ?? "Loading City...",
                            size: 34,
                          ),
                          Assistant(
                            text:
                                "${prov.weather?.temperature.round() ?? "..."}° | ${prov.weather?.mainConditon ?? "Loading..."}",
                            weight: FontWeight.w600,
                            color: white.withAlpha(150),
                            height: 1.5,
                          ),
                        ],
                      ),
                    ),
                    WeatherCard(card: prov.card[prov.card.length - 1]),
                    SizedBox(height: 5),
                    SizedBox(
                      height: size.height - 342,
                      child: GridView.builder(
                        itemCount: prov.card.length - 1,
                        padding: const EdgeInsets.only(bottom: 10),
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => WeatherCard(
                          card: prov.card[index],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
