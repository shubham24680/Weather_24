import 'package:flutter/material.dart';
import 'package:weather_24/core/utils/colors.dart';
import 'package:weather_24/core/widgets/text.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkPurple,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          height: 195,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage("assets/images/background_design.png"),
              fit: BoxFit.fitWidth,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assistant(
                    text: "19°",
                    size: 64,
                    weight: FontWeight.bold,
                  ),
                  Image.asset(
                    "assets/images/weathers/cloud.png",
                    height: 130,
                  )
                ],
              ),
              Assistant(
                text: "H:24°  L:18°",
                weight: FontWeight.w600,
                color: white.withAlpha(150),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Assistant(
                    text: "Las Vegas, Nevada",
                    size: 24,
                  ),
                  Assistant(
                    text: "Mid Rain",
                    size: 18,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
