import 'package:flutter/material.dart';
import 'package:weather_24/core/widgets/text.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Assistant(text: "Details"),
    );
  }
}
