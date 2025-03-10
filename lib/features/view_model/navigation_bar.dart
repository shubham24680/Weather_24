import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_24/core/utils/colors.dart';
import 'package:weather_24/features/view_model/home_provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, provider, __) {
        return BottomNavigationBar(
          backgroundColor: purple,
          selectedItemColor: white,
          unselectedItemColor: white.withAlpha(150),
          currentIndex: provider.currentIndex,
          onTap: (value) => provider.changeIndex(value),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              label: "List",
            ),
          ],
        );
      },
    );
  }
}
