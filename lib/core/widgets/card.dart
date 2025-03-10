import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_24/core/utils/colors.dart';
import 'package:weather_24/core/widgets/text.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundDarkPurple.withAlpha(230),
        // border: Border.all(color: purple),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/feel_like.svg",
                    height: 15,
                    colorFilter:
                        ColorFilter.mode(white.withAlpha(150), BlendMode.srcIn),
                  ),
                  SizedBox(width: 2),
                  Assistant(
                    text: "FEELS LIKE",
                    color: white.withAlpha(150),
                    weight: FontWeight.w500,
                    size: 14,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Assistant(
                text: "19°",
                color: white,
                size: 44,
              ),
            ],
          ),
          Assistant(
            text: "Similar to the actual temperature",
            color: white.withAlpha(150),
            size: 14,
          ),
        ],
      ),
    );
  }
}
