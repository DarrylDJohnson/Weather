import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/shared_pref.dart';

import 'menu_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final LocationService service;
  final SharedPref sharedPref;

  MenuCubit()
      : this.service = LocationService(),
        this.sharedPref = SharedPref(),
        super(MenuStateLoading());

  init() async {
    try {
      List<Place> places = await sharedPref.readPlaces();

      emit(MenuStateMain(places));
    } catch (e) {
      emit(MenuStateError(e));
    }
  }

  goToLocation([Place place]) async {
    try {
      if (place == null)
        emit(MenuEvent(await service.currentLocation));
      else
        emit(MenuEvent(place));
    } catch (e) {
      emit(MenuStateError(e));
    }
  }
}
