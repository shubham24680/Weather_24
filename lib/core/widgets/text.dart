import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_24/core/utils/colors.dart';

class Assistant extends StatelessWidget {
  const Assistant({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.color,
    this.height,
  });

  final String text;
  final double? height;
  final Color? color;
  final double? size;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.assistant(
        height: height ?? 1,
        color: color ?? white,
        fontSize: size ?? 20,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
