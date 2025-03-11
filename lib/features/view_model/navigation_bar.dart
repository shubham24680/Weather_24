import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_24/core/utils/colors.dart';
import 'package:weather_24/features/view_model/home_provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      child: Consumer<HomeProvider>(
        builder: (_, provider, __) {
          return BottomAppBar(
            height: 70,
            color: purple,
            elevation: 0,
            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => provider.changeIndex(0),
                    icon: SvgPicture.asset(
                      "assets/icons/map.svg",
                      height: 30,
                      colorFilter: ColorFilter.mode(
                        provider.currentIndex == 0
                            ? white
                            : white.withAlpha(100),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => provider.changeIndex(1),
                    icon: SvgPicture.asset(
                      "assets/icons/list.svg",
                      height: 30,
                      colorFilter: ColorFilter.mode(
                        provider.currentIndex == 1
                            ? white
                            : white.withAlpha(100),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
