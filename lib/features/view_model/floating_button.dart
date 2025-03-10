import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_24/core/utils/colors.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: white,
      shape: CircleBorder(),
      child: SvgPicture.asset(
        "assets/icons/add.svg",
        colorFilter: ColorFilter.mode(purple, BlendMode.srcIn),
        height: 40,
      ),
    );
  }
}
