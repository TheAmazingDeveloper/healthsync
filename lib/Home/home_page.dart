import 'package:flutter/material.dart';
import 'package:healthsync/Home/home_page_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: ((context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          return const HomePageDesktop();
        } else {
          return const Center(
            child: Text(
              "Sorry, currently we are not supported on this device, but we are working on it...",
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w300,
              ),
            ),
          );
        }
      }),
    );
  }
}
