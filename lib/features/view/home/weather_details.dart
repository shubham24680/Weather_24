import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_24/core/utils/colors.dart';
import 'package:weather_24/core/widgets/card.dart';
import 'package:weather_24/core/widgets/text.dart';
import 'package:weather_24/features/view_model/weather_provider.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final prov = Provider.of<WeatherProvider>(context, listen: false);

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Assistant(text: "Montreal", size: 34),
                    Assistant(
                      text: "19° | Mostly Clear",
                      weight: FontWeight.w600,
                      color: white.withAlpha(150),
                      height: 1.5,
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 150,
              //   width: size.width,
              //   padding: const EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     color: backgroundDarkPurple.withAlpha(230),
              //     border: Border.all(color: purple),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Assistant(
              //     text: "WIND",
              //     color: purple,
              //     weight: FontWeight.w600,
              //     size: 16,
              //   ),
              // ),
              // SizedBox(height: 5),
              SizedBox(
                height: size.height - 342,
                child: GridView.builder(
                  itemCount: 4,
                  padding: const EdgeInsets.only(bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => WeatherCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
