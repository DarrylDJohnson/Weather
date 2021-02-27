import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/services/shared_pref.dart';

import 'splash_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashStateInitial());

  init() async {
    try {
      SharedPref prefs = new SharedPref();
      List<Place> places = await prefs.readPlaces();

      places != null && places.isNotEmpty
          ? emit(SplashStateWeather(places.last))
          : emit(SplashStateLocation());

    } catch (error) {
      emit(SplashStateError(error));
    }
  }
}
