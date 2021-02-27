import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'location_button.dart';

class LocationPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: SvgPicture.asset(
                    "assets/images/location_unknown.svg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Search your location or \n"
                    "allow location permissions to \n"
                    "check out the weather",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            LocationButton(),
          ],
        ),
      ),
    );
  }
}
