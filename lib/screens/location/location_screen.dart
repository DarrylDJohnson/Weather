import 'package:flutter/material.dart';
import 'package:weather_app/screens/components/toolbar.dart';

import 'components/location_prompt.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Toolbar(),
          LocationPrompt(),
        ],
      ),
    );
  }
}
