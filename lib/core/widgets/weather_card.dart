import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:weather_24/core/utils/colors.dart';
import 'package:weather_24/core/widgets/text.dart';
import 'package:weather_24/features/model/cards.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.card});

  final Cards card;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundDarkPurple.withAlpha(230),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    card.icon,
                    height: 15,
                    colorFilter:
                        ColorFilter.mode(white.withAlpha(150), BlendMode.srcIn),
                  ),
                  SizedBox(width: 2),
                  Assistant(
                    text: card.property,
                    color: white.withAlpha(150),
                    weight: FontWeight.w500,
                    size: 14,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Assistant(
                text: "${card.value ?? "..."} ${card.unit}",
                maxLines: 2,
                color: white,
                size: 40,
              ),
              SizedBox(height: 20),
            ],
          ),
          Assistant(
            text: card.description,
            maxLines: 2,
            color: white.withAlpha(150),
            size: 14,
          ),
        ],
      ),
    );
  }
}
