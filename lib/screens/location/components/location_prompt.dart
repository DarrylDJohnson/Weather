import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'location_button.dart';

class LocationPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/location_unknown.svg",
                  ),
                  ListTile(
                    title: Text(
                      "Check out the weather!\n"
                      "Search by city or\n"
                      "use your location.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: LocationButton(),
            ),
          ],
        ),
      ),
    );
  }
}
