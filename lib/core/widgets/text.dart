import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_24/core/utils/colors.dart';

class Assistant extends StatelessWidget {
  const Assistant({
    super.key,
    required this.text,
    this.maxLines,
    this.height,
    this.color,
    this.size,
    this.weight,
  });

  final String text;
  final int? maxLines;
  final double? height;
  final Color? color;
  final double? size;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      style: GoogleFonts.assistant(
        height: height ?? 1,
        color: color ?? white,
        fontSize: size ?? 20,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
