import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:weather_24/features/view/details/details.dart';
import 'package:weather_24/features/view/home/home.dart';

import 'package:weather_24/core/utils/colors.dart';
import 'package:weather_24/features/view_model/floating_button.dart';
import 'package:weather_24/features/view_model/home_provider.dart';
import 'package:weather_24/features/view_model/navigation_bar.dart';

class Layout extends StatelessWidget {
  Layout({super.key});

  final List<Widget> _body = [
    Home(),
    const Details(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    SystemUiOverlayStyle(
      statusBarColor: purple,
      systemNavigationBarColor: purple,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer<HomeProvider>(
          builder: (_, provider, __) {
            return Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_image.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: _body[provider.currentIndex],
            );
          },
        ),
        extendBody: true,
        floatingActionButton: FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
