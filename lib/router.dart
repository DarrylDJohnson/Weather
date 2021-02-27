import 'package:flutter/material.dart';

import 'providers/forecast_provider.dart';
import 'providers/location_provider.dart';
import 'providers/splash_provider.dart';

const String initialRoute = '/';
const String locationRoute = '/location';
const String weatherRoute = '/weather';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => SplashProvider());
        break;
      case locationRoute:
        return MaterialPageRoute(builder: (_) => LocationProvider());
        break;
      case weatherRoute:
        return MaterialPageRoute(
            builder: (_) => ForecastProvider(settings.arguments));
        break;
      default:
        return MaterialPageRoute(builder: (_) => SplashProvider());
        break;
    }
  }
}
